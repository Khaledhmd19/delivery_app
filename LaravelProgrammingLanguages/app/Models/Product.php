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
    
    public function inCartBy(){
        return $this->belongsToMany(User::class,'cart');
    }
    public function orders(){
        return $this->belongsToMany(Order::class);
    }
    public function store(){
        return $this->belongsTo(Store::class);
    }
}
