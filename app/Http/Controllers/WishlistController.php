<?php

namespace App\Http\Controllers;

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::instance('wishlist')->remove($id);

        return back()->with('success_message','Le produit a été supprimé de votre Wishlist');
    }

    /**
     * Move the specified resource from cart.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function switchToCart($id)
    {
        $item = Cart::instance('wishlist')->get($id);

        $duplicate = Cart::instance('default')->search(function ($cartItem,$rowId) use($item){
            return $cartItem->id == $item->id;
        });

        if($duplicate->isNotEmpty()){
            return back()->with('success_message','Le produit est déjà dans votre Panier');
        }
        Cart::instance('default')->add($item->id,$item->name,1,$item->price)
            ->associate('App\Models\Produit');

        Cart::instance('wishlist')->remove($id);
        return back()->with('success_message','Le produit a été déplacé vers votre Panier');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function empty()
    {
        if(Cart::instance('wishlist')->content()->count() > 0){
            foreach(Cart::instance('wishlist')->content() as $content)
                Cart::instance('wishlist')->remove($content->rowId);

            return back()->with('success_message','Votre liste d\'envies a été vidée');
        }
        return back()->with('success_message','Votre liste d\'envies est vide');
    }
}
