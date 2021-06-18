<?php

namespace App\Http\Controllers;

use App\Models\Produit;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $recommendations = Produit::mightAlsoLike()->get();

        return view('panier')->with('recommendations',$recommendations);
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
        $duplicate = Cart::search(function ($cartItem,$rowId) use($request){
            return $cartItem->id == $request->id;
        });

        if($duplicate->isNotEmpty()){
            return back()->with('success_message','Le produit est déjà dans votre Panier');
        }

        $quantite = $request->quant[$request->id];

        if(!$quantite)
            $quantite = 1;

        Cart::add($request->id, $request->nom, $quantite, $request->prix_ht)
            ->associate('App\Models\Produit');

        return back()->with('success_message', 'Le produit a été ajouté a votre Panier');
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
        Cart::update($id, $request->quantity);
        session()->flash('success_message', 'La quantité a été mise à jour avec succès!');
        return response()->json(['success' => true]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::remove($id);

        return back()->with('success_message','Le produit a été supprimé de votre Panier');
    }

    /**
     * Save the specified resource in th Wishlist
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function saveToWishlist(Request $request)
    {
        $duplicate = Cart::instance('wishlist')->search(function ($cartItem,$rowId) use($request){
            return $cartItem->id == $request->id;
        });

        if($duplicate->isNotEmpty()){
            return back()->with('success_message','Le produit est déjà dans votre Wishlist');
        }
        Cart::instance('wishlist')->add($request->id,$request->nom,1,$request->prix_ht)
            ->associate('App\Models\Produit');

        return back()->with('success_message','Le produit a été ajouté à votre Wishlist');
    }
}
