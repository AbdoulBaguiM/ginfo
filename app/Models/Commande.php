<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id','c_nom','c_prenom','c_email','c_adresse','c_ville','c_pays','c_zipcode',
        'c_telephone','c_discount','c_discountCode','c_subtotal','c_taxe','c_total','c_payement','statut','erreur',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function produits()
    {
        return $this->belongsToMany('App\Models\Produit')->withPivot('quantite');
    }
}
