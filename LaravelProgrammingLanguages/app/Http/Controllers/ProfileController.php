<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class ProfileController extends Controller
{
    public function index(){
        return response([
            'user'=> Auth::user()
        ]);
    }
    public function update(){
        $attributes = request()->validate([
            'first_name'=>['required'],
            'last_name'=>['required'],
            'location'=>['required'],
        ]);
    
        Auth::user()->update(request()->all());
    }
}