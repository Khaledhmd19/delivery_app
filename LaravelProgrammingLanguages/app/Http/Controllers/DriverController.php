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
        $number = $order->user->number;
        $params=array(
            'token' => 'z3cxgqyxc5s3ztx9',
            'to' => $number,
            'body' => 'Your order with id = '.$order->id.' is out for delivery'
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
              CURLOPT_URL => "https://api.ultramsg.com/instance100696/messages/chat",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_SSL_VERIFYHOST => 0,
              CURLOPT_SSL_VERIFYPEER => 0,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => http_build_query($params),
              CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded"
              ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        
        curl_close($curl);
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
        $number = $order->user->number;
        $params=array(
            'token' => 'z3cxgqyxc5s3ztx9',
            'to' => $number,
            'body' => 'The driver is at your door, go and take your order!'
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
              CURLOPT_URL => "https://api.ultramsg.com/instance100696/messages/chat",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_SSL_VERIFYHOST => 0,
              CURLOPT_SSL_VERIFYPEER => 0,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => http_build_query($params),
              CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded"
              ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        
        curl_close($curl);

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
