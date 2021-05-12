<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use App\Models\Produit;
use Illuminate\Http\Request;

class MainController extends Controller
{
    //
    public function index(){

        $produits = Produit::all();

        return view('index')->with('produits',$produits);
    }
}
