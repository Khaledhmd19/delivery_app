<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Store;
class ProductController extends Controller
{
    public function index($id){
        $store = Store::with('products')->findorFail($id);
        return response([
            'store'=>$store,
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
