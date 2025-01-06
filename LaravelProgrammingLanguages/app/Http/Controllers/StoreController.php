<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Store;
use App\Models\Product;
class StoreController extends Controller
{
    //
    public function index(){
        $user=Auth::user();
        $user->load('categories');
        $count =0;
        $products = collect();
        foreach($user->categories as $category){
            if($count==2)break;
            $products->push($category->products()->first()->load('category'));
            $count++;
        }
        if($products->count()==0){
            $products->push(Product::first()->load('category'));
        }
        return response([
            'products'=>$products,
            'stores'=>Store::all()
        ]);


    }
    public function search(){
        $query = request()->query('query');
        return response([
            'stores' => Store::where('title','LIKE',value: '%' . $query . '%')->get()
        ]);
    }
    

    

}
