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
    public function store($id){
        $user = Auth::user();
        $user->favorites()->attach($id);
    }

    public function destory($id){
        $user = Auth::user();
        $user->favorites()->detach($id);
    }
}
