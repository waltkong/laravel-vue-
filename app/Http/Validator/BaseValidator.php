<?php
namespace App\Http\Validator;

use App\Utils\ResultCode;
use Illuminate\Support\Facades\Validator;

class BaseValidator
{

    public static function commonValidate($data,$rule,$ruleChinese=[]){
        $validator = Validator::make($data,$rule,$ruleChinese);
        if($validator->fails()){
            $errors = $validator->errors()->all();
            return ResultCode::error(ResultCode::ERROR,$errors,[]);
        }
        return true;
    }

}