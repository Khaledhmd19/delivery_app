<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' =>fake()->name(),
            'description'=>fake()->text(255),
            'price'=>random_int(100,1000),
            'stock'=>random_int(1,100),
            'store_id'=>random_int(1,5),
            'category_id'=>random_int(1,3)
        ];
    }
}
