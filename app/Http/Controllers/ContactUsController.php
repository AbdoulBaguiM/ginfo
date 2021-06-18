<?php

namespace App\Http\Controllers;

use App\Models\ContactUS;
use App\Models\User;
use App\Notifications\NewMessageNotification;
use Illuminate\Http\Request;

class ContactUsController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function contactUS()
    {
        return view('extras.contactUS');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function contactUSPost(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required'
        ]);
        ContactUS::create($request->all());

        $admin = User::find(1);
        $superU = User::find(2);

        $admin->notify(new NewMessageNotification($request));
        $superU->notify(new NewMessageNotification($request));

        return back()->with('success_message', 'Merci de votre message!');
    }
}
