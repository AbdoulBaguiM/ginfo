<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Nicolaslopezj\Searchable\SearchableTrait;

class Produit extends Model
{
    use HasFactory;
    use SearchableTrait;

    protected $fillable = ['quantite'];

    public function scopeMightAlsoLike($query){
        return $query->inRandomOrder()->take(4);
    }

    public function categories(){
        return $this->belongsToMany('App\Models\Categorie');
    }

    public function marque(){
        return $this->belongsTo('App\Models\Marque');
    }

    public function reviews(){
        return $this->hasMany('App\Models\Review');
    }

    public function promotion(){
        return $this->belongsTo('App\Models\Promotion');
    }

    /**
     * Searchable rules.
     *
     * @var array
     */
    protected $searchable = [
        /**
         * Columns and their priority in search results.
         * Columns with higher values are more important.
         * Columns with equal values have equal importance.
         *
         * @var array
         */
        'columns' => [
            'produits.nom' => 10,
            'produits.details' => 5,
        ],
    ];
}
