<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
   /*  public function up()
    {
        //
        Schema::create('pages', function (Blueprint $table) {
            $table->bigIncrements('id');
			$table->unsignedBigInteger('user_id')->constrained()->onDelete('cascade');
           $table->string('title');
		   $table->string('url');
		   $table->text('description');
           $table->integer('status');
		   $table->timestamps();
        });
    } */

    /**
     * Reverse the migrations.
     *
     * @return void
     */
  /*   public function down()
    {
        //
        Schema::dropIfExists('pages');
    } */
}