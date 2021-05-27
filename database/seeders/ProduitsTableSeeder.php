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
        $produit->details = "Asus pc portable X543B AMD A9-9425 15.6 HD 4GO 1TO WIN 10";
        $produit->description = "GPU NVIDIA";
        $produit->photo_principale = "product01.png";
        $produit->save();
        $produit->categories()->attach(1);

        $produit = new Produit();
        $produit->nom = "Casque 01";
        $produit->prix_ht = 500;
        $produit->details = "Edifier W830BT Casque supra-auriculaire sans fil, écouteur Bluetooth";
        $produit->description = "Sonic Master";
        $produit->photo_principale = "product02.png";
        $produit->save();
        $produit->categories()->attach(6);

        $produit = new Produit();
        $produit->nom = "HP Notebook";
        $produit->prix_ht = 3500;
        $produit->details = "Hp NoteBook 15-da0017nk (4BX89EA) 15.6 (8Go, 1To) Intel Core i5 Wndows 10";
        $produit->description = "GPU AMD";
        $produit->photo_principale = "product03.png";
        $produit->save();
        $produit->categories()->attach(1);

        $produit = new Produit();
        $produit->nom = "Samsung Tab II";
        $produit->prix_ht = 1000;
        $produit->details = "Samsung Galaxy Tab A 2019 8.0, QUAD 2 Ghz 2GB  32Go LTE- Noir";
        $produit->description = "Android";
        $produit->photo_principale = "product04.png";
        $produit->save();
        $produit->categories()->attach(4);

        $produit = new Produit();
        $produit->nom = "Casque 02";
        $produit->prix_ht = 500;
        $produit->details = "Edifier W830BT Casque supra-auriculaire sans fil, écouteur Bluetooth";
        $produit->description = "Sonic Master";
        $produit->photo_principale = "product05.png";
        $produit->save();
        $produit->categories()->attach(6);

        $produit = new Produit();
        $produit->nom = "Acer XS1";
        $produit->prix_ht = 2500;
        $produit->details = "Acer PC PORTABLE Predator Helios 300 Gamer i7-10750H RTX 3060 16 Go/SSD 512 Win10";
        $produit->description = "CPU Intel";
        $produit->photo_principale = "product06.png";
        $produit->save();
        $produit->categories()->attach(2);

        $produit = new Produit();
        $produit->nom = "Galaxy A7";
        $produit->prix_ht = 2000;
        $produit->details = "Samsung Galaxy A7 - 6.5'' - (6GB - 128GB) - Android10.0 - 4G - 48MP-Rose - KIT i100";
        $produit->description = "Android 9 Oreo";
        $produit->photo_principale = "product07.png";
        $produit->save();
        $produit->categories()->attach(4);

        $produit = new Produit();
        $produit->nom = "Acer Aspire ";
        $produit->prix_ht = 6000;
        $produit->details = "Acer Pc Portable Aspire 3 AC315 I5-8256U 4GB/1TO 15,6 - Linux";
        $produit->description = "GPU Nvidia GTX1050";
        $produit->photo_principale = "product08.png";
        $produit->save();
        $produit->categories()->attach(1);

        $produit = new Produit();
        $produit->nom = "Camera";
        $produit->prix_ht = 250;
        $produit->details = "Action camera ULTRA HD 4K 30 fps WIfi (du vrai 4K )";
        $produit->description = "Zoom x100";
        $produit->photo_principale = "product09.png";
        $produit->save();
        $produit->categories()->attach(3);

        $produit = Produit::find(1);
        $produit->categories()->attach(2);
    }
}
