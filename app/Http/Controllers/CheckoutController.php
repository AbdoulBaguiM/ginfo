<?php

namespace App\Http\Controllers;

use App\Models\Commande;
use App\Models\CommandeProduit;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('checkout')->with([
            'discount' => $this->getNumbers()->get('discount'),
            'newSubtotal' => $this->getNumbers()->get('newSubtotal'),
            'newTax' => $this->getNumbers()->get('newTax'),
            'newTotal' => $this->getNumbers()->get('newTotal'),
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
    public function store(Request $request)
    {
        //Insert into Commandes table

        $commande = Commande::create([
            'user_id' => auth()->user() ? auth()->user()->id : null ,
            'c_nom' => $request->nom,
            'c_prenom' => $request->prenom,
            'c_email' => $request->email,
            'c_adresse' => $request->adresse,
            'c_ville' => $request->ville,
            'c_pays' => $request->pays,
            'c_zipcode' => $request->zip_code,
            'c_telephone' => $request->tel,
            'c_discount' => $this->getNumbers()->get('discount'),
            'c_discountCode' => $this->getNumbers()->get('code'),
            'c_subtotal' => $this->getNumbers()->get('newSubtotal'),
            'c_taxe' => $this->getNumbers()->get('newTax'),
            'c_total' => $this->getNumbers()->get('newTotal'),
            'erreur' => null,
        ]);

        //Insert into Commande_Produit table

        foreach (Cart::content() as $item){
            CommandeProduit::create([
                'commande_id' => $commande->id,
                'produit_id' => $item->model->id,
                'quantite' => $item->model->quantite,
            ]);
        }

        //SUCCES

        Cart::instance('default')->destroy();
        session()->forget('coupon');

        return redirect()->route('confirmation')->with('success_message', 'Merci! Votre commande a été enregistrée avec succès');

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

    function getNumbers()
    {
        $tax = config('cart.tax') / 100;
        $discount = session()->get('coupon')['discount'] ?? 0;
        $code = session()->get('coupon')['name'] ?? null;
        $newSubtotal = ((float)str_replace(',','',Cart::subtotal()) - $discount);
        if ($newSubtotal < 0) {
            $newSubtotal = 0;
        }
        $newTax = $newSubtotal * $tax;
        $newTotal = $newSubtotal * (1 + $tax);

        return collect([
            'tax' => $tax,
            'discount' => $discount,
            'code' => $code,
            'newSubtotal' => $newSubtotal,
            'newTax' => $newTax,
            'newTotal' => $newTotal,
        ]);
    }
}
