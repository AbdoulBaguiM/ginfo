<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategorieProduitTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categorie_produit', function (Blueprint $table) {
            $table->id();

            $table->integer('produit_id')->unsigned()->nullable();
            $table->foreign('produit_id')->references('id')
                    ->on('produits')->onDelete('cascade');

            $table->integer('categorie_id')->unsigned()->nullable();
            $table->foreign('categorie_id')->references('id')
                ->on('category')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categorie_produit');
    }
}
