<?php

namespace App\Http\Controllers;

use App\Models\Produit;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $produits = Produit::inRandomOrder()->take(9)->get();

        return view('store')->with('produits',$produits);
    }



    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $produit = Produit::where('id',$id)->firstOrFail();
        $recommendations = Produit::where('id','!=',$id)->mightAlsoLike()->get();

        return view('produit')->with([
            'produit' => $produit,
            'recommendations' => $recommendations,
        ]);
    }
}
