<?php

namespace App\Http\Controllers;

use App\Models\CreditCard;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class CreditCardController extends Controller
{
    public function show(){
        $credit = Auth::user()->credit;
        return response([
            'creditCard'=>$credit
        ]);
    }
    public function store(){
        request()->validate([
            'card_number'=>['required','min:16' , 'max:19'],
            'holder_name'=>['required'],
            'ccv'=>['required'],
            'expiration_date'=>['required']
        ]);
        CreditCard::updateOrCreate(
['user_id'=>Auth::user()->id],
    [
                 'card_number'=>request('card_number'),
                 'holder_name'=>request('holder_name'),
                 'ccv'=>request('ccv'),
                 'expiration_date'=>request('expiration_date'),
                 'user_id'=>Auth::user()->id
            ]
        );
    }
}
