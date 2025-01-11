<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class FavoriteController extends Controller
{
    //
    public function index(){
        return response([
            'products'=> Auth::user()->favorites
        ]);
    }
    public function store(){
        $user = Auth::user();
        $product = request()->all();
        $user->favorites()->attach($product['id']);
    }

    public function destory(){
        $user = Auth::user();
        $product = request('product');
        $user->favorites()->detach($product['id']);
    }
}
