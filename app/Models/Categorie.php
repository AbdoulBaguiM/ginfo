<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categorie extends Model
{
    use HasFactory;
    use \Staudenmeir\EloquentHasManyDeep\HasRelationships;

    protected $table = 'category';

    public function produits(){
        return $this->belongsToMany('App\Models\Produit');
    }


    public function commandes(){
        return $this->hasManyDeep('App\Models\Commande', ['categorie_produit', 'App\Models\Produit', 'commande_produit']);
    }
}
