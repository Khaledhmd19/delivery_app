<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\User;
use App\Models\Store;
use App\Models\Product;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

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
        Admin::updateOrCreate(
            ['email' => 'sedra@gmail.com'], // Change to your desired email
            [
                'name' => 'Super Admin',
                'password' => Hash::make('password123'), // Change to your desired password
            ]
            );

        Store::factory(5)->create();
        Product::factory(20)->create();
    }
}
