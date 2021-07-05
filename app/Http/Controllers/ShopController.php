<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use App\Models\Marque;
use App\Models\Produit;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use function React\Promise\all;

class ShopController extends Controller
{
    public $pagination = 10;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
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

        $produits = $produits->paginate($this->pagination);

        $topventes = DB::table('commande_produit')
            ->leftJoin('produits','produits.id','=','commande_produit.produit_id')
            ->select('produits.*','commande_produit.produit_id',
                DB::raw('SUM(commande_produit.quantite) as total'))
            ->groupBy('produits.id','commande_produit.produit_id','produits.nom')
            ->orderBy('total','desc')
            ->get();

        return view('store')->with([
            'produits' => $produits,
            'categories' => $categories,
            'marques' => $marques,
            'topventes' => $topventes,
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

//        $reviews = $produit->reviews()->with('user')->orderBy('created_at','desc')->paginate(3);
        $reviews = $produit->reviews()->with('user')->orderBy('updated_at','desc');

        foreach (range(1,5) as $note) {
            $countR[$note] = countReviews($reviews->get(),$note);
            $widthR[$note] = widthReview($reviews->get(),$note);
        }

        $reviewDetails = array(
            'countR' => $countR,
            'widthR' => $widthR,
        );

        $stockQ = getStockLevel($produit->quantite);
        $reviews = $reviews->paginate(3);

        return view('produit')->with([
            'produit' => $produit,
            'stockQ' => $stockQ,
            'recommendations' => $recommendations,
            'reviews' => $reviews,
            'reviewDetails' => $reviewDetails,
        ]);
    }

    public function search(Request $request)
    {
        $request->validate([
            'query' => 'required|min:2',
        ]);

        $query = request()->input('query');

        $produits = Produit::search($query)->paginate($this->pagination);

        return view('search.search')->with('produits',$produits);
    }

    public function sort(Request $request)
    {
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
        else {
            $produits = Produit::whereBetween('prix_ht', array($request->price_min, $request->price_max));
        }

        $produits = $produits->paginate($this->pagination);

        $topventes = DB::table('commande_produit')
            ->leftJoin('produits','produits.id','=','commande_produit.produit_id')
            ->select('produits.*','commande_produit.produit_id',
                DB::raw('SUM(commande_produit.quantite) as total'))
            ->groupBy('produits.id','commande_produit.produit_id','produits.nom')
            ->orderBy('total','desc')
            ->get();

        return view('store')->with([
            'produits' => $produits,
            'categories' => $categories,
            'marques' => $marques,
            'topventes' => $topventes,
        ]);
    }

    public function promotion()
    {
        $produits = Produit::whereNotNull('promotion_id')
            ->whereHas('promotion', function($query) {
                $query->where('online', true);
            })
            ->paginate($this->pagination);

        return view('search.search')->with('produits',$produits);
    }
}
