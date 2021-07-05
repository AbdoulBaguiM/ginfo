<?php

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Carbon;

function getStockLevel($quantite)
{
    if ($quantite > setting('site.stock_level'))
        $stockQ = '<span style="color: forestgreen">En Stock</span>';
    elseif ($quantite <= setting('site.stock_level') && $quantite > 0)
        $stockQ = '<span style="color: darkorange">Stock Faible</span>';
    else
        $stockQ = '<span style="color: red">Epuisé</span>';

    return $stockQ;
}

function getLivraisonPrice(){
    return number_format((int)setting('site.livraison_price'),2);
}

function getNumbers()
{
    $tax = setting('site.tax') / 100;
    $discount = session()->get('coupon')['discount'] ?? 0;
    $code = session()->get('coupon')['name'] ?? null;
    $newSubtotal = ((float)str_replace(',','',Cart::subtotal()) - $discount);
    if ($newSubtotal < 0) {
        $newSubtotal = 0;
    }
    $newTax = $newSubtotal * $tax;
    $newTotal = $newSubtotal * (1 + $tax) +getLivraisonPrice();

    return collect([
        'tax' => $tax,
        'discount' => $discount,
        'code' => $code,
        'newSubtotal' => $newSubtotal,
        'newTax' => $newTax,
        'newTotal' => $newTotal,
    ]);
}

function presentDate($date)
{
    Carbon::setLocale('fr');

    return Carbon::parse($date)->format('d M Y, H:h:i');
}

function countReviews($reviews,$note)
{
    return $reviews->where('note',$note)->count();
}

function widthReview($reviews,$note)
{
    $nombreRT = $reviews->count();
    $nombreR = countReviews($reviews,$note);

    if ($nombreR !=0 && $nombreRT != 0)
        return (countReviews($reviews,$note)/$reviews->count())*100;
}

function getNotification()
{
    $notifications = auth()->user()->unreadNotifications;

    return $notifications;
}

function getProductPromotion($produit){
    return $produit->promotion['percent_off'];
}

function getProductInPromotionPrice($produit){
    $percent_off = getProductPromotion($produit)/100;

    return $produit->prix_ht-($produit->prix_ht*$percent_off);
}

function getProductPrice($produit)
{
    if( auth()->user() && auth()->user()->role->name == "reseller" ){
        return  number_format($produit->prix_reseller,2);
    }
    else{
        if ( !empty($produit->promotion) ){
            return number_format(getProductInPromotionPrice($produit),2);
        }
        else
            return number_format($produit->prix_ht,2);
    }
}

function getProductDelPrice($produit)
{
    if( auth()->user() && auth()->user()->role->name == "reseller" ){
        return number_format($produit->prix_ht,2);
    }
    else{
        if ( !empty($produit->promotion) ){
            return number_format($produit->prix_ht,2);
        }
        else
            return null;
    }
}

function getCategories()
{
    $categories = \App\Models\Categorie::all();
    return $categories;
}
