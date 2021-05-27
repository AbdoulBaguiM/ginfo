<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produit extends Model
{
    use HasFactory;

    public function scopeMightAlsoLike($query){
        return $query->inRandomOrder()->take(4);
    }

    public function categories(){
        return $this->belongsToMany('App\Models\Categorie');
    }

    public function marque(){
        return $this->belongsTo('App\Models\Marque');
    }
}
