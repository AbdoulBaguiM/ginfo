<?php

namespace App\Http\Controllers\Voyager;

use App\Models\Categorie;
use App\Models\Commande;
use App\Models\User;
use Illuminate\Support\Carbon;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Http\Request;

class MyVoyagerController extends \TCG\Voyager\Http\Controllers\VoyagerController
{
    public function index()
    {
        // Les catégories avec les produits
        $categorie_produits = Categorie::with("produits")->get();

        // Les catégories avec les produits et les ventes
        $categories = Categorie::with('produits', 'commandes')->get();

        //Les ventes par villes
        $ventes = Commande::all()->groupBy('c_ville');

        // Les utilisateurs par villes
        $clients = User::all()->groupBy('ville');

        return view('vendor.voyager.index')->with(compact('categories'))
                                                ->with(compact('categorie_produits'))
                                                ->with(compact('clients'))
                                                ->with(compact('ventes'));
    }

    /**
     * Mark notifications as Read
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function markNotification(Request $request)
    {
        auth()->user()
            ->unreadNotifications
            ->when($request->input('id'), function ($query) use ($request) {
                return $query->where('id', $request->input('id'));
            })
            ->markAsRead();

        if (empty($request->input('id')))
            auth()->user()->notifications()->delete();

        return back();
    }
}
