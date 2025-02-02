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
        $ordersCollection = collect();
        foreach($orders as $order){
            $total=0;
            foreach($order->products as $product){
                $total += $product->pivot->price*$product->pivot->quantity;
            }
            $ordersCollection->push([
                'id'=> $order->id,
                'location'=>$order->location,
                'status'=>$order->status,
                'user_id'=>$order->user_id,
                'driver_id'=>$order->driver_id,
                'total'=>$total
            ]);
        }
        return response([
            'orders'=>$ordersCollection
        ]);
    }
    public function show($id){
        $order = Auth::user()->orders()->findOrFail($id);
        $products = $order->products;
        $productsCollection = collect();
        $orderCollection = collect();
        
        $total=0;
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
            $total += $product->pivot->price*$product->pivot->quantity;
        }
        $orderCollection->push([
            "id"=> $order->id,
            "location"=>$order->location,
            'status'=> $order->status,
            'total'=>$total
        ]);
        return([
            'order'=>$orderCollection,
            'products'=>$productsCollection,
    
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
        $order = Auth::user()->orders()->find($id);
        if($order->status =='Waiting for a driver'){
            $order->delete();
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
