<?php

namespace Database\Seeders;

use App\Models\Categorie;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now()->toDateTimeString();

        Categorie::insert([
            ['nom' => 'Laptops', 'slug' => 'laptops', 'created_at' => $now, 'updated_at' => $now],
            ['nom' => 'Desktops', 'slug' => 'desktops', 'created_at' => $now, 'updated_at' => $now],
            ['nom' => 'Cameras', 'slug' => 'cameras', 'created_at' => $now, 'updated_at' => $now],
            ['nom' => 'Tablets', 'slug' => 'tablets', 'created_at' => $now, 'updated_at' => $now],
            ['nom' => 'Imprimantes', 'slug' => 'imprimantes', 'created_at' => $now, 'updated_at' => $now],
            ['nom' => 'Accessoires', 'slug' => 'accessoires', 'created_at' => $now, 'updated_at' => $now],
        ]);
    }
}
