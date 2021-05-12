<?php

namespace Database\Seeders;

use App\Models\Produit;
use Illuminate\Database\Seeder;

class ProduitsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $produit = new Produit();
        $produit->nom = "ASUS X541UV";
        $produit->prix_ht = 3500;
        $produit->description = "GPU NVIDIA";
        $produit->photo_principale = "product01.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Casque 01";
        $produit->prix_ht = 500;
        $produit->description = "Sonic Master";
        $produit->photo_principale = "product02.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "HP Notebook";
        $produit->prix_ht = 3500;
        $produit->description = "GPU AMD";
        $produit->photo_principale = "product03.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Samsung Tab II";
        $produit->prix_ht = 1000;
        $produit->description = "Android";
        $produit->photo_principale = "product04.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Casque 02";
        $produit->prix_ht = 500;
        $produit->description = "Sonic Master";
        $produit->photo_principale = "product05.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Acer XS1";
        $produit->prix_ht = 2500;
        $produit->description = "CPU Intel";
        $produit->photo_principale = "product06.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Galaxy A7";
        $produit->prix_ht = 2000;
        $produit->description = "Android 9 Oreo";
        $produit->photo_principale = "product07.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Acer Aspire ";
        $produit->prix_ht = 6000;
        $produit->description = "GPU Nvidia GTX1050";
        $produit->photo_principale = "product08.png";
        $produit->save();

        $produit = new Produit();
        $produit->nom = "Camera";
        $produit->prix_ht = 250;
        $produit->description = "Zoom x100";
        $produit->photo_principale = "product09.png";
        $produit->save();
    }
}
