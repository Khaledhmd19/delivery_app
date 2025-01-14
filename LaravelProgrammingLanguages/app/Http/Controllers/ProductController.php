<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Store;
use Illuminate\Support\Facades\Auth;
class ProductController extends Controller
{
    public function index($id){
        $store = Store::with('products')->findorFail($id);
        return response([
            'store'=>$store,
        ]);
    }
    public function homeProducts(){
        $user=Auth::user();
        $count =0;
        $products = collect();
        $categories = $user->categories;
        $categories = $categories->shuffle();
        foreach($categories as $category){
            if($count==2)break;
            $products->push($category->products()->inRandomOrder()->first()->load('category'));
            $count++;
        }

        if($products->count()==0){
            $products->push(Product::inRandomOrder()->first()->load('category'));
        }
        return response([
            'products'=>$products
        ]);
    }
    public function show($id1,$id2){
        $store= Store::findOrFail($id1);
        $product = $store->products()->findorFail($id2)->load(['store','category']);
        return response([
            'product'=> $product
        ]);
    }

    public function search(){
        $query = request()->query('query');
        return response([
            'products' => Product::with('store')->where('name','LIKE',value: '%' . $query . '%')->get()
        ]);
    }



}
    