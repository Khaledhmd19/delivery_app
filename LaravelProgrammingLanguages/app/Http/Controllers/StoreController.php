<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Store;
use App\Models\Product;
class StoreController extends Controller
{
    //
    public function index(){
        
        return response([
            'stores'=>Store::all()
        ],200);


    }
    public function search(){
        $query = request()->query('query');
        return response([
            'stores' => Store::where('title','LIKE',value: '%' . $query . '%')->get()
        ]);
    }
    

    

}
