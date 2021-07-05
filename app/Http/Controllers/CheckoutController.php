<?php

namespace App\Http\Controllers;

use App\Mail\CommandeEffectue;
use App\Models\Commande;
use App\Models\CommandeProduit;
use App\Models\Produit;
use App\Models\User;
use App\Notifications\NewOrderNotification;
use Cartalyst\Stripe\Exception\CardErrorException;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Cart::content()->count() == 0)
            return redirect()->route('voir_produits')->withErrors('Ajoutez des produits à votre panier avant de commander');

        $gateway = new \Braintree\Gateway([
            'environment' => config('services.braintree.environment'),
            'merchantId' => config('services.braintree.merchantId'),
            'publicKey' => config('services.braintree.publicKey'),
            'privateKey' => config('services.braintree.privateKey')
        ]);

        $token = $gateway->ClientToken()->generate();

        return view('checkout')->with([
            'token' => $token,
            'discount' => getNumbers()->get('discount'),
            'newSubtotal' => getNumbers()->get('newSubtotal'),
            'newTax' => getNumbers()->get('newTax'),
            'newTotal' => getNumbers()->get('newTotal'),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function pay(Request $request)
    {
        //Verification
        if($this->productsAreNoLongerAvailable()){
            Cart::instance('default')->destroy();
            return back()->withErrors('Désolé, un des produits dans votre panier n\'est plus disponible');
        }

        //Add User Informations if not available
        $user = auth()->user();
        $input = $request->except('nom', 'email');

        if (!$user->last_name || !$user->adresse || !$user->ville || !$user->zipcode){

            $user->fill([
                'last_name' => $input['prenom'],
                'adresse' => $input['adresse'],
                'ville' => $input['ville'],
                'zipcode' => $input['zip_code'],
            ])->save();
        }

        $contents = Cart::content()->map(function ($item) {
            return $item->model->nom.', '.$item->qty;
        })->values()->toJson();

        try {
            $charge = Stripe::charges()->create([
                'amount' => getNumbers()->get('newTotal'),
                'currency' => 'MAD',
                'source' => $request->stripeToken,
                'description' => 'Commande',
                'receipt_email' => $request->email,
                'metadata' => [
                    'contents' => $contents,
                    'quantity' => Cart::instance('default')->count(),
                    'discount' => collect(session()->get('coupon'))->toJson(),
                ],
            ]);

            $commande = $this->addToOrdersTables($request, null);

            //SUCCES
            $this->decreaseQuantities();
            Mail::send(new CommandeEffectue($commande, $charge['payment_method_details']['card']['last4']));

            $admin = User::find(1);
            $superU = User::where('role_id', 3)->get();

            foreach ($superU as $super) {
                $super->notify(new NewOrderNotification($user));
            }

            $admin->notify(new NewOrderNotification($user));

            Cart::instance('default')->destroy();
            session()->forget('coupon');

            return redirect()->route('confirmation')->with('success_message', 'Merci de votre commande, le paiement est un succès');
        }catch (CardErrorException $e) {
            $this->addToOrdersTables($request, $e->getMessage());
            return back()->withErrors('Error! ' . $e->getMessage());
        }
    }

    /*public function pay(Request $request)
    {
        //Verification
        if($this->productsAreNoLongerAvailable()){
            Cart::instance('default')->destroy();
            return back()->withErrors('Désolé, un des produits dans votre panier n\'est plus disponible');
        }

        //Add User Informations if not available
        $user = auth()->user();
        $input = $request->except('nom', 'email');

        if (!$user->last_name || !$user->adresse || !$user->ville || !$user->zipcode){

            $user->fill([
                'last_name' => $input['prenom'],
                'adresse' => $input['adresse'],
                'ville' => $input['ville'],
                'zipcode' => $input['zip_code'],
            ])->save();
        }

        $gateway = new \Braintree\Gateway([
            'environment' => config('services.braintree.environment'),
            'merchantId' => config('services.braintree.merchantId'),
            'publicKey' => config('services.braintree.publicKey'),
            'privateKey' => config('services.braintree.privateKey')
        ]);;
        $amount = round(getNumbers()->get('newTotal'), 2);
        $nonce = $request->payment_method_nonce;

        $result = $gateway->transaction()->sale([
            'amount' => $amount,
            'paymentMethodNonce' => $nonce,
            'customer' => [
                'firstName' => $request->c_nom,
                'lastName' => $request->c_prenom,
                'email' => $request->c_email,
            ],
            'options' => [
                'submitForSettlement' => true
            ]
        ]);

        if ($result->success) {
            $transaction = $result->transaction;
            // header("Location: transaction.php?id=" . $transaction->id);
            $commande = $this->addToOrdersTables($request,null);

            //SUCCES

            $this->decreaseQuantities();
            Mail::send(new CommandeEffectue($commande,$transaction->creditCard['last4']));

            $admin = User::find(1);
            $superU = User::where('role_id',3)->get();

            foreach ($superU as $super){
                $super->notify(new NewOrderNotification($user));
            }

            $admin->notify(new NewOrderNotification($user));

            Cart::instance('default')->destroy();
            session()->forget('coupon');

            return redirect()->route('confirmation')->with('success_message', 'Le paiement est un succès, l\'ID de la transaction est : '.$transaction->id);
        } else {
            $errorString = "";

            foreach ($result->errors->deepAll() as $error) {
                $errorString .= 'Error: ' . $error->code . ": " . $error->message . "\n";
            }

            // $_SESSION["errors"] = $errorString;
            // header("Location: index.php");
            return back()->withErrors('Une erreur s\'est produite: ' . $result->message);
        }
    }*/

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Verification
        if($this->productsAreNoLongerAvailable()){
            Cart::instance('default')->destroy();
            return back()->withErrors('Désolé, un des produits dans votre panier n\'est plus disponible');
        }

        //Add User Informations if not available
        $user = auth()->user();
        $input = $request->except('nom', 'email');

        if (!$user->last_name || !$user->adresse || !$user->ville || !$user->zipcode){

            $user->fill([
                'last_name' => $input['prenom'],
                'adresse' => $input['adresse'],
                'ville' => $input['ville'],
                'zipcode' => $input['zip_code'],
            ])->save();
        }

        $commande = $this->addToOrdersTables($request,null);

        //SUCCES

        $this->decreaseQuantities();
        Mail::send(new CommandeEffectue($commande,null));

        $admin = User::find(1);
        $superU = User::where('role_id',3)->get();

        foreach ($superU as $super){
            $super->notify(new NewOrderNotification($user));
        }

        $admin->notify(new NewOrderNotification($user));

        Cart::instance('default')->destroy();
        session()->forget('coupon');

        return redirect()->route('confirmation')->with('success_message', 'Merci, votre commande a été enregistrée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function decreaseQuantities()
    {
        foreach (Cart::content() as $item){
            $produit = Produit::find($item->model->id);

            $produit->update(['quantite' => $produit->quantite - $item->qty]);
        }

    }

    public function productsAreNoLongerAvailable()
    {
        foreach (Cart::content() as $item){
            $produit = Produit::find($item->model->id);
            if($produit->quantite < $item->qty)
                return true;
        }
        return false;
    }

    public function addToOrdersTables($request,$error)
    {
        //Insert into Commandes table

        $commande = Commande::create([
            'user_id' => auth()->user() ? auth()->user()->id : null ,
            'c_nom' => $request->nom,
            'c_prenom' => $request->prenom,
            'c_email' => $request->email,
            'c_adresse' => $request->adresse,
            'c_ville' => $request->ville,
            'c_zipcode' => $request->zip_code,
            'c_telephone' => $request->tel,
            'c_discount' => getNumbers()->get('discount'),
            'c_discountCode' => getNumbers()->get('code'),
            'c_subtotal' => getNumbers()->get('newSubtotal'),
            'c_taxe' => getNumbers()->get('newTax'),
            'c_total' => getNumbers()->get('newTotal'),
            'c_payement' => $request->payement,
            'erreur' => $error,
        ]);

        //Insert into Commande_Produit table

        foreach (Cart::content() as $item){
            CommandeProduit::create([
                'commande_id' => $commande->id,
                'produit_id' => $item->model->id,
                'quantite' => $item->qty,
            ]);
        }

        return $commande;
    }
}
