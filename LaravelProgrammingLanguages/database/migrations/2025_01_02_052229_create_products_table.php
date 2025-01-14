<?php

use App\Models\Category;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\Store;
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description');
<<<<<<< HEAD
            $table->string('image')->default('images/profile');
=======
            $table->string('image')->nullable()->default('assets/iPhone_16_pro.png');
>>>>>>> a823ebcf0809b1e9984ae7f235a1b8bc584bd1e9
            $table->integer('price');
            $table->integer('stock');
            $table->foreignIdFor(Category::class);
            $table->foreignIdFor(Store::class);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
