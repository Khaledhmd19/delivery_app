<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Order;
class OrderController extends Controller
{
    public function index(){
        $orders = Auth::user()->orders;
        return response([
            'orders'=>$orders
        ]);
    }
    public function show($id){
        $order = Auth::user()->orders()->findOrFail($id);
        $products = $order->products;
        $productsCollection = collect();
        $orderCollection = collect();
        $orderCollection->push([
            "id"=> $order->id,
            "location"=>$order->location,
            'status'=> $order->status,
        ]);
        foreach($products as $product){
            $productsCollection->push([
                'id'=> $product->id,
                'name'=>$product->name,
                'description'=>$product->description,
                'image'=>$product->image,
                'price'=>$product->pivot->price,
                'quantity'=>$product->pivot->quantity,
                'store'=> [
                    'id'=>$product->store->id,
                    'title'=>$product->store->title
                ]
            ]);
        }
        return([
            'order'=>$orderCollection,
            'products'=>$productsCollection
        ]);
    }

    public function store(){
        $user = Auth::user();
        if(is_null($user->creditCard)){
            return response([
                'message'=>'Please complete your credit card information in profile'
            ],422);
        }
        $products = request()->all();
        $outOfStockProducts= collect();
        $inStockProducts=collect();
        foreach($products as $product){
            $checkProduct=Product::findOrFail($product['id']);
            if($checkProduct->stock<$product['quantity']){
                $outOfStockProducts->push($checkProduct);
            }
        }
        if(!$outOfStockProducts->isEmpty()){
            return response([
                'message'=>'Some products are out of stock',
                'products'=>$outOfStockProducts
            ],422);
        }
        $order =Order::create([
            'location'=>$user->location,
            'status'=>'Waiting for a driver',
            'user_id'=>$user->id
        ]);
        foreach($products as $p){
            $product=Product::findOrFail($p['id']);
            $order->products()->attach($product->id,[
                'price'=>$product->price,
                'quantity'=>$p['quantity']
            ]);
            $product->update([
                'stock'=>$product->stock - $p['quantity']
            ]);
        }
        return response([
            'message'=>'Order added successfully'
        ],201);

    }
    public function destroy($id){
        $order = Order::findOrFail($id);
        if(Auth::user()->id!=$order->user_id){
            return response([
                'message'=>'Unauthorized'
            ],401);
        }
        if($order->status =='Waiting for a driver'){
            $order->update([
                'status'=>'Canceled'
            ]);
            return response([
                'message'=>'Order canceled'
            ],200);
        }else{
            return response([
                'message'=>'You can not cancel the order'
            ],400);
        }
    }
}
