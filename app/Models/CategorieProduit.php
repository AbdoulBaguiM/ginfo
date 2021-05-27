<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategorieProduit extends Model
{
    protected $table = 'categorie_produit';

    protected $fillable = ['produit_id', 'categorie_id'];
}
