<?php

use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

//Send number without +963
Route::post('/otp-request', [RegisterController::class,'store']);
//Send number and otp 
Route::post('/otp-verification',[LoginController::class,'store']);
//Send number,otp and user information (first_name,last_name,location,image path if exists)
Route::patch('/register',[RegisterController::class,'update']);

//logout send token 
Route::middleware('auth:sanctum')->post('/logout',[LoginController::class,'destory']);



