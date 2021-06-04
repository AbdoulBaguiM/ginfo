<?php

use Gloudemans\Shoppingcart\Facades\Cart;
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
Route::get('/','App\Http\Controllers\Shop\MainController@index')->name('acceuil');

Route::get('/boutique','App\Http\Controllers\ShopController@index')->name('voir_produits');
Route::get('/boutique/{produit}','App\Http\Controllers\ShopController@show')->name('voir_produit');

Route::get('/panier','App\Http\Controllers\CartController@index')->name('voir_panier');
Route::post('/panier','App\Http\Controllers\CartController@store')->name('ajouter_au_panier');
Route::delete('/panier/{produit}','App\Http\Controllers\CartController@destroy')->name('supprimer_du_panier');
Route::post('/panier/saveToWishlist','App\Http\Controllers\CartController@saveToWishlist')->name('ajouter_a_la_wishlist');

Route::delete('/panier/saveToWishlist/{produit}','App\Http\Controllers\WishlistController@destroy')->name('supprimer_de_la_wishlist');
Route::post('/panier/saveToWishlist/switchToCart/{produit}','App\Http\Controllers\WishlistController@switchToCart')->name('envoyer_au_panier');

Route::post('/coupon', 'App\Http\Controllers\CouponsController@store')->name('ajouter_coupon');
Route::delete('/coupon', 'App\Http\Controllers\CouponsController@destroy')->name('supprimer_coupon');

Route::get('/checkout','App\Http\Controllers\CheckoutController@index')->name('checkout_commande')->middleware('auth');
Route::post('/checkout', 'App\Http\Controllers\CheckoutController@store')->name('passer_commande');

Route::get('/merci','App\Http\Controllers\ConfirmationController@index')->name('confirmation');

Route::get('/search','App\Http\Controllers\ShopController@search')->name('rechercher');

//Voyager


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

