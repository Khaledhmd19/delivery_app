<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    public function index(){
        return response([
            'categories'=>Category::all()
        ]);
    }
    
    public function store(){
        $user = Auth::user();

        $categories = request()->all();
        
        foreach($categories as $category){
            $user->categories()->syncWithoutDetaching($category['id']);
        }
        return response([
            'message'=>'Categories added successfully'
        ],201);

    }
}
