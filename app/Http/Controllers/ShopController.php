<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use App\Models\Marque;
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
        $pagination = 6;
        $categories = Categorie::all();
        $marques = Marque::all();

        if (request()->categorie){
            $produits = Produit::with('categories')->whereHas('categories',function ($query){
               $query->where('slug',request()->categorie);

            });
        }
        elseif(request()->marque){
            $produits = Produit::with('marque')->whereHas('marque',function ($query){
                $query->where('slug',request()->marque);

            });
        }
        else{
            $produits = Produit::take(6);
        }
        $produits = $produits->paginate($pagination);

        return view('store')->with([
            'produits' => $produits,
            'categories' => $categories,
            'marques' => $marques,
        ]);
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
