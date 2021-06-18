<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommandesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('commandes', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')->on('users')
                ->onUpdate('cascade')->onDelete('set null');
            $table->string('c_nom');
            $table->string('c_prenom')->nullable();
            $table->string('c_email');
            $table->string('c_adresse');
            $table->string('c_ville');
            $table->string('c_zipcode');
            $table->string('c_telephone');
            $table->integer('c_discount')->default(0);
            $table->string('c_discountCode')->nullable();
            $table->integer('c_subtotal');
            $table->integer('c_taxe');
            $table->integer('c_total');
            $table->boolean('c_payement');
            $table->boolean('statut')->default(false);
            $table->string('erreur')->nullable();

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
        Schema::dropIfExists('commandes');
    }
}
