<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class Isnumber implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string, ?string=): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if((strlen($value)==10 && ($value[0]!='0' || $value[1]!='9')) || (strlen($value)==9 && $value[0]!='9')){
            $fail('You entered a non-syrian number');
        }
    }
}
