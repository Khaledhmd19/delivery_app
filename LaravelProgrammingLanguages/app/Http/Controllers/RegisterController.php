<?php

namespace App\Http\Controllers;

use App\Rules\Isnumber;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
class RegisterController extends Controller
{
    public function store(){
        if (Auth::guard('sanctum')->check()) {
            return response()->json(['message' => 'Access denied for authenticated users.'], 403);
        }
        request()->validate([
            'number'=>['min:9' , 'max:10' ,new Isnumber()]  
        ]);
        $number = request('number');
        if(strlen($number)==10){
            $number= substr($number,1);
        }
        $number = '+963'. $number;
        
        $code = rand(1000,9999);
        $params=array(
            'token' => 'z3cxgqyxc5s3ztx9',
            'to' => $number,
            'body' => 'Your code is '. $code . ', please don\'t send it to anyone. This code will expire in 10 minutes'
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
        $user =User::where('number','=',$number)->first();
        if($user!=null){
            $user->update([
                'otp'=>$code,
                'otp_timestamp' => Carbon::now()->addMinutes(10)   
            ]);
        }else{
             User::create([
                'number' => $number,
                'otp'=> $code,
                'otp_timestamp' => Carbon::now()->addMinutes(10),
                'role'=>'user'
            ]);
     }
    }

    public function update(){
        if (Auth::guard('sanctum')->check()) {
            return response()->json(['message' => 'Access denied for authenticated users.'], 403);
        }

        request()->validate([
            'number' =>['min:9','max:10',new Isnumber()],
            'first_name' => ['required'],
            'last_name'=>['required'],
            'location' => ['required'],
        ]);
        $number = request('number');
        if(strlen($number)==10){
            $number= substr($number,1);
        }
        $number = '+963'. $number;

        $user =User::where('number','=',$number)->first();
        if(!$user){
            return response()->json([
                'verified'=>false,
                'time'=>false,
                'message' => 'Number is not correct'
            ],400);
        }
        if($user->otp != request('otp')){
            return response()->json([
                'verified'=>false,
                'time'=>true,
                'message' => 'Invalid credentials'
            ],401);
        }




        $user->update([
            'first_name'=>request('first_name'),
            'last_name'=>request('last_name'),
            'location'=>request('location'),
        ]);

        Auth::login($user);
        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json([
            'token'=> $token,
            'user' => $user
        ]);
    }


}
