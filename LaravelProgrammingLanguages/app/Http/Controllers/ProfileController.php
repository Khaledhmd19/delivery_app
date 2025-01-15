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
        request()->validate([
            'first_name'=>['required'],
            'last_name'=>['required'],
            'location'=>['required'],
            'image'=>['image','mimes:jpeg,png,jpg','max:2048']
        ]);
        $user= Auth::user();
        if(request()->hasFile('image')){
            $imageName =time().'.'.request('image')->getClientOriginalName(); 
            request('image')->move(public_path('images'),$imageName);
            $imagePath = 'images/'.$imageName;
            $user->update(['image'=>$imagePath]);
        }
        $user->update([
            'first_name'=>request('first_name'),
            'last_name'=>request('last_name'),
            'location'=>request('location'),
        ]);
    }
}