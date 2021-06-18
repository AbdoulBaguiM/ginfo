<?php

namespace App\Http\Controllers\Voyager;

use TCG\Voyager\Facades\Voyager;
use Illuminate\Http\Request;

class MyVoyagerController extends \TCG\Voyager\Http\Controllers\VoyagerController
{
    public function index()
    {
        return view('vendor.voyager.index');
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

        return back();
    }
}
