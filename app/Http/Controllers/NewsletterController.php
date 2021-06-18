<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Newsletter;

class NewsletterController extends Controller
{
    public function store(Request $request)
    {
        if ( ! Newsletter::isSubscribed($request->email) ) {
            Newsletter::subscribe($request->email);
            return back()->with('success_message','Merci de vous être abonné à notre newsletter');
        }

        return back()->with('success_message','Vous êtes déjà abonné à notre newsletter');

    }

    public function delete(Request $request)
    {
        if ( Newsletter::isSubscribed($request->email) ){
            Newsletter::unsubscribe($request->email);
            return back()->with('success_message','Vous vous êtes désabonné de notre newsletter');
        }

        return back()->with('success_message','Vous n\'êtes pas inscrit à notre newsletter');
    }
}
