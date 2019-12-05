<?php
namespace App\Utils;

use Illuminate\Support\Facades\Hash;

class EncryptData
{

    public static function encryptPassword($str){
        return Hash::make($str);
    }

}