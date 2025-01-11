<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Store;
use App\Models\Product;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        Store::factory(10)->create([
            'title' => fake()->title(),
            'description' =>fake()->text(50),
            'location'=> fake()->text(50)
        ]);
        Product::factory(10)->create([
            'name'=>fake()->name(),
            'description'=>fake()->text(50),
            'image'=>'33',
            'price'=>443,
            'stock'=> random_int(100,200),
            'store_id'=>random_int(1,6),
            'category_id'=>random_int(1,3)
        ]);

    }
}
