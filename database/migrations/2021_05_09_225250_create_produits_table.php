<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProduitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produits', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nom')->unique();
            $table->float('prix_ht');
            $table->float('prix_reseller');
            $table->text('details');
            $table->text('description');
            $table->string('photo_principale')->unique();
            $table->boolean('featured')->default(false);
            $table->text('images')->nullable();
            $table->unsignedInteger('quantite')->default(30);
            $table->float('rating_cache')->nullable();
            $table->unsignedInteger('rating_count')->nullable();
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
        Schema::dropIfExists('produits');
    }
}
