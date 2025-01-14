<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DriverController extends Controller
{
    public function getPendingOrders(){
        $orders = Order::where('status', 'Waiting for a driver')::all();
        return response([
            'orders'=>$orders
        ]);
    }

    public function pickOrder($id){
        $order = Order::findOrFail($id);

        $order->update([
            'driver_id' => Auth::user()->$id
        ]);

        return response([
            'status'=>true
        ]);
    }

    public function confirmOrder($id){
        $order = Order::findOrFail($id);

        $order->update([
            'status' => 'Delivered'
        ]);

        return response([
            'status'=>true
        ]);
    }

    public function getDriverOrders(){
        $orders = Auth::user()->ordersToDeliver;
        return response([
            'orders'=>$orders
        ]);
    }

    public function validateCreditCard(){
        request()->validate([
            'card_number'=>['required','min:16' , 'max:19'],
            'holder_name'=>['required'],
            'ccv'=>['required'],
            'expiration_date'=>['required']
        ]);

        return response([
            'status'=>true
        ]);
    }


}
