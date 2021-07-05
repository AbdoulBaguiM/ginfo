<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/','App\Http\Controllers\MainController@index')->name('acceuil');

Route::get('/boutique','App\Http\Controllers\ShopController@index')->name('voir_produits');
Route::get('/boutique/{produit}','App\Http\Controllers\ShopController@show')->name('voir_produit');
Route::post('/boutique','App\Http\Controllers\ShopController@sort')->name('trier_par_prix');
Route::get('/promotions','App\Http\Controllers\ShopController@promotion')->name('voir_promotions');

Route::get('/panier','App\Http\Controllers\CartController@index')->name('voir_panier');
Route::post('/panier','App\Http\Controllers\CartController@store')->name('ajouter_au_panier');
Route::patch('/panier/{produit}', 'App\Http\Controllers\CartController@update')->name('actualiser_panier');
Route::delete('/panier/{produit}','App\Http\Controllers\CartController@destroy')->name('supprimer_du_panier');
Route::post('/panier/saveToWishlist','App\Http\Controllers\CartController@saveToWishlist')->name('ajouter_a_la_wishlist');

Route::delete('/panier/saveToWishlist/{produit}','App\Http\Controllers\WishlistController@destroy')->name('supprimer_de_la_wishlist');
Route::post('/panier/saveToWishlist/switchToCart/{produit}','App\Http\Controllers\WishlistController@switchToCart')->name('envoyer_au_panier');
Route::get('/viderWishlist','App\Http\Controllers\WishlistController@empty')->name('vider_la_wishlist');

Route::post('/coupon', 'App\Http\Controllers\CouponsController@store')->name('ajouter_coupon');
Route::delete('/coupon', 'App\Http\Controllers\CouponsController@destroy')->name('supprimer_coupon');

Route::get('/checkout','App\Http\Controllers\CheckoutController@index')->name('checkout_commande')->middleware('auth');
Route::post('/checkout/online', 'App\Http\Controllers\CheckoutController@pay')->name('passer_commande_en_ligne');
Route::post('/checkout/offline', 'App\Http\Controllers\CheckoutController@store')->name('passer_commande_hors_ligne');

Route::get('/merci','App\Http\Controllers\ConfirmationController@index')->name('confirmation');

Route::get('/search','App\Http\Controllers\ShopController@search')->name('rechercher');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    //Mark a notification as read
    Route::post('/mark-as-read', 'App\Http\Controllers\Voyager\MyVoyagerController@markNotification')->name('markNotification');
});

Auth::routes();

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware('auth')->group(function () {
    Route::get('/mon-compte', 'App\Http\Controllers\UsersController@edit')->name('modifier_mon_profil');
    Route::patch('/mon-compte', 'App\Http\Controllers\UsersController@update')->name('mettre_profil_a_jour');
});

Route::post('/review', 'App\Http\Controllers\ReviewsController@store')->name('ajouter_review')->middleware('auth');

Route::get('contact-us', 'App\Http\Controllers\ContactUSController@contactUS')->name('contactez-nous');
Route::post('contact-us', ['as'=>'contactus.store','uses'=>'App\Http\Controllers\ContactUSController@contactUSPost']);

Route::post('/newsletter','App\Http\Controllers\NewsletterController@store')->name('inscription_newsletter');
Route::delete('/newsletter', 'App\Http\Controllers\CouponsController@delete')->name('desinscription_newsletter');

Route::get('/terms&conditons', function (){
    return view('extras.terms&conditions');
})->name('voir_termes_et_conditions');

Route::get('/aboutUs', function (){
    return view('extras.aboutUS');
})->name('qui_sommes_nous');
