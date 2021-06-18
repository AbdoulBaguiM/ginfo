<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UsersController extends Controller
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
        //
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
     * @return \Illuminate\Http\Response
     */
    public function edit()
    {
        $commandes = auth()->user()->commande()->with('produits')->get();

        return view('auth.profile.my-profile')->with([
            'user' => auth()->user(),
            'commandes'=> $commandes,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.auth()->id(),
            'telephone' => 'required|regex:/(0)[0-9]/|not_regex:/[a-z]/|size:10',
            'adresse' => 'required|string|max:255',
            'password' => 'sometimes|nullable|string|min:6|confirmed',
        ]);

        $user = auth()->user();
        $input = $request->except('password', 'password_confirmation');

        if($request->avatar){
            $image_path = '/'.$user->avatar;

            if (Storage::disk('public')->exists($image_path)) {
                Storage::disk('public')->delete($image_path);
            }

            $imageName = time().'_'.$user->id.'.'.$request->avatar->extension();
            $request->avatar->storeAs('/public/users/avatars', $imageName);
            $user->avatar = 'users/avatars/'.$imageName;
        }

        if (! $request->filled('password')) {
            $user->fill($input)->save();

            return back()->with('success_message', 'Profil mis à jour avec succès');
        }

        $user->password = bcrypt($request->password);
        $user->fill($input)->save();

        return back()->with('success_message', 'Profil et Mot de Passe mis à jour avec succès');
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
