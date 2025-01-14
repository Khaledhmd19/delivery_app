<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CreditCardController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\StoreController;
use App\Models\Category;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

//Login and Register
Route::post('/otp-request', [RegisterController::class,'store']);
Route::post('/otp-verification',[LoginController::class,'store']);
Route::post('/register',[RegisterController::class,'update']);
Route::middleware('auth:sanctum')->get('/categories',[CategoryController::class,'index']);
Route::middleware('auth:sanctum')->post('/categories',[CategoryController::class,'store']);
Route::middleware('auth:sanctum')->post('/logout',[LoginController::class,'destory']);

//Home page
Route::middleware('auth:sanctum')->get('/home/stores',[StoreController::class,'index']);
Route::middleware('auth:sanctum')->get('/home/products',[ProductController::class,'homeProducts']);
Route::middleware('auth:sanctum')->get('/stores/{id}/products',[ProductController::class,'index']);
Route::middleware('auth:sanctum')->get('/stores/{id1}/products/{id2}',[ProductController::class,'show']);

//Search page
Route::middleware('auth:sanctum')->get('/search/stores',[StoreController::class,'search']);
Route::middleware('auth:sanctum')->get('/search/products',[ProductController::class,'search']);

//Favorites
Route::middleware('auth:sanctum')->get('/favorites',[FavoriteController::class,'index']);
Route::middleware('auth:sanctum')->delete('/favorites/{id}',[FavoriteController::class,'destory']);
Route::middleware('auth:sanctum')->post('/favorites/{id}',[FavoriteController::class,'store']);

//Order
Route::middleware('auth:sanctum')->get('/orders',[OrderController::class,'index']);
Route::middleware('auth:sanctum')->get('/orders/{id}',[OrderController::class,'show']);
Route::middleware('auth:sanctum')->post('/orders',[OrderController::class,'store']);
Route::middleware('auth:sanctum')->delete('/orders/{id}',[OrderController::class,'destroy']);

//Credit card
Route::middleware('auth:sanctum')->get('/profile/credit-card',[CreditCardController::class,'index']);
Route::middleware('auth:sanctum')->post('/profile/credit-card',[CreditCardController::class,'store']);
