<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommandeProduitTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('commande_produit', function (Blueprint $table) {
            $table->id();

            $table->integer('commande_id')->unsigned()->nullable();
            $table->foreign('commande_id')->references('id')
                ->on('commandes')->onUpdate('cascade')->onDelete('set null');

            $table->integer('produit_id')->unsigned()->nullable();
            $table->foreign('produit_id')->references('id')
                ->on('produits')->onUpdate('cascade')->onDelete('set null');

            $table->integer('quantite')->unsigned();
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
        Schema::dropIfExists('commande_produit');
    }
}
