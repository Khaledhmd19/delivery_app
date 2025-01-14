<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Broadcasting\Broadcasters\PusherBroadcaster;
use Illuminate\Http\Request;
use App\Models\Store;
use Illuminate\Support\Facades\Auth;
class ProductController extends Controller
{
    public function index($id){
        $store = Store::findorFail($id);
        $products = collect();
        foreach($store->products as $product){
            $is_favorite = false;
            if(Auth::user()->favorites()->find($product->id)!=null){
                $is_favorite=true;
            }
            $products->push([
                'id'=> $product->id,
                'name'=>$product->name,
                'description'=>$product->description,
                'image'=>$product->imgae,
                'price'=>$product->price,
                'stock'=>$product->stock,
                'category'=>$product->category_id,
                'is_favorite'=>$is_favorite
            ]);
        
        }
        return response(content: [
            'store'=>[
                'id'=>$store->id,
                'title'=>$store->title,
                'description'=>$store->description,
                'products'=>$products
            ]
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
            $is_favorite=false;
            $product = $category->products()->inRandomOrder()->first()->load('category');
            if(Auth::user()->favorites()->find($product->id)!=null){
                $is_favorite=true;
            }
            $products->push([
                'id'=> $product->id,
                'name'=>$product->name,
                'description'=>$product->description,
                'image'=>$product->imgae,
                'price'=>$product->price,
                'stock'=>$product->stock,
                'category'=>$product->category_id,
                'is_favorite'=>$is_favorite
            ]);
            $count++;
        }

        if($products->count()==0){
            $is_favorite=false;

            $product = Product::inRandomOrder()->first()->load('category');
            if(Auth::user()->favorites()->find($product->id)!=null){
                $is_favorite=true;
            }
            $products->push([
                'id'=> $product->id,
                'name'=>$product->name,
                'description'=>$product->description,
                'image'=>$product->imgae,
                'price'=>$product->price,
                'stock'=>$product->stock,
                'category'=>$product->category_id,
                'is_favorite'=>$is_favorite
            ]);
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
    