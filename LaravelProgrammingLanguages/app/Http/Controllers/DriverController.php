<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DriverController extends Controller
{
    public function getPendingOrders(){
        $orders = Order::where('status','=', 'Waiting for a driver')->get();
        return response([
            'orders'=>$orders
        ]);
    }

    public function pickOrder($id){
        $order = Order::findOrFail($id);
        $lastOrder = Order::where('driver_id','=',Auth::user()->id)->latest('updated_at')->first();
        if($order->status != 'Waiting for a driver'){
            return response([
                'message'=>'Picking a non-delivery order'
            ],400);
        }
        if($lastOrder!=null && $lastOrder->status!='Delivered'){
            return response([
                'message'=> 'Deliver your order first :)'
            ],401);
        }
        $order->update([
            'driver_id' => Auth::user()->id,
            'status'=> 'On the way'
        ]);

        return response([
            'status'=>true
        ]);
    }

    public function confirmOrder($id){
        $order = Order::findOrFail($id);
        if($order->driver_id != Auth::user()->id){
            return response([
                'message'=>'Pick an order first'
            ],401);
        }
        if($order->status!= 'On the way'){
            return response([
                'message'=>'unauthroized'
            ],401);
        }
        $order->update([
            'status' => 'Delivered'
        ]);

        return response([
            'status'=>true
        ]);
    }

    public function getDriverOrders(){
        $orders = Auth::user()->ordersToDeliver()->where('status','=','On the way')->get();
        return response([
            'orders'=>$orders
        ]);
    }   
}
