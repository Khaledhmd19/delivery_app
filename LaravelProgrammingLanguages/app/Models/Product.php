<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    /** @use HasFactory<\Database\Factories\ProductFactory> */
    use HasFactory;
    protected $guarded = [];

    public function favoritedBy(){
        return $this->belongsToMany(User::class,'favorites');
    }
    
   
    public function orders(){
        return $this->belongsToMany(Order::class);
    }
    public function store(){
        return $this->belongsTo(Store::class);
    }
    public function category(){
        return $this->belongsTo(Category::class);
    }
}
