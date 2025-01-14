<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $guarded=[];
    

    public function favorites(){
        return $this->belongsToMany(Product::class,'favorites');
    }
    
    public function orders(){
        return $this->hasMany(Order::class);
    }
    
    public function categories(){
        return $this->belongsToMany(Category::class);
    }
    public function ordersToDeliver(){
        if($this->role == 'driver'){
            return $this->hasMany(Order::class,'driver_id');
        }
        return collect();
    }

    public function creditCard(){
        return $this->hasOne(CreditCard::class);
    }

}
