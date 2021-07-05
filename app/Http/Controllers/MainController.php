<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use App\Models\Produit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function index(){

        $produits = Produit::where('featured',true)->inRandomOrder()->get();
        $topventes = DB::table('commande_produit')
            ->leftJoin('produits','produits.id','=','commande_produit.produit_id')
            ->select('produits.*','commande_produit.produit_id',
                DB::raw('SUM(commande_produit.quantite) as total'))
            ->groupBy('produits.id','commande_produit.produit_id','produits.nom')
            ->orderBy('total','desc')
            ->get();


        return view('index')->with([
            'produits' => $produits,
            'topventes' => $topventes,
            ]);
    }
}
