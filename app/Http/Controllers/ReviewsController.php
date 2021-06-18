<?php

namespace App\Http\Controllers;

use App\Models\Produit;
use App\Models\Review;
use Illuminate\Http\Request;

class ReviewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $user = auth()->user();
        $produit = Produit::where('id',$request->id)->firstOrFail();

        $request->validate([
            'rating' => 'required|string|max:1',
        ]);

        $review = Review::where([
            ['user_id', '=', $user->id],
            ['produit_id', '=', $produit->id],
        ])->first();

        if($review){
            $review->fill([
                'note' => $request->rating,
                'message' => $request->commentaire,
            ])->save();
        }
        else{
            $review = Review::create([
                'user_id' => $user->id,
                'produit_id' => $request->id,
                'note' => $request->rating,
                'message' => $request->commentaire,
            ]);
        }

        $reviews = $produit->reviews();
        $avgRating = $reviews->avg('note');
        $produit->rating_cache = round($avgRating,1);
        $produit->rating_count = $reviews->count();
        $produit->save();

        return back()->with('success_message', 'Merci d\'avoir noté ce produit');
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
}
