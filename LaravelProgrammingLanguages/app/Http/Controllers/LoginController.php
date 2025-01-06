<?php

namespace App\Http\Controllers;

use App\Rules\Isnumber;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
class LoginController extends Controller
{
    
    public function store(){
        if (Auth::guard('sanctum')->check()) {
            return response()->json(['message' => 'Access denied for authenticated users.'], 403);
        }
       
        request()->validate([
            'otp'=> ['required','min:4','max:4'],
            'number'=>['required','min:9','max:10',new Isnumber()]
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
                'time'=>true,
                'message' => 'Number is not correct'
            ],400);
        }
        if(Carbon::now() > $user->otp_timestamp){
                return response()->json([
                'verified'=>false,
                'time'=>false,
                'message' => 'The verification code has expired. Please request a new code.'
                ],400);
        }
        if($user->otp != request('otp')){
            return response()->json([
                'verified'=>false,
                'time'=>true,
                'message' => 'Invalid Otp'
            ],401);
        }else{
            if($user->first_name!=null){
                Auth::login($user);
                
                $token = $user->createToken('auth_token')->plainTextToken;
                return response()->json([
                    'verified'=>true,
                     'is_new'=>false,
                     'token'=> $token,
                     'user' => $user
                 ]);
               }else{
                return response()->json([
                    'verified'=>true,
                    'is_new' =>true
                ],200);
            }
        }
    }

    public function destory(){
        Auth::user()->currentAccessToken()->delete();
    }
}
