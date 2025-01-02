<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $guarded=[];
    

    public function favorites(){
        return $this->belongsToMany(Product::class,'favorites');
    }
    public function cart(){
        return $this->belongsToMany(Product::class,'cart');
    }
    public function orders(){
        return $this->hasMany(Order::class);
    }
    
    public function ordersToDeliver(){
        if($this->role == 'driver'){
            return $this->hasMany(Order::class,'driver_id');
        }
        return collect();
    }
    

}
