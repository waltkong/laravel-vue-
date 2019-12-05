<?php
namespace App\Http\Logic;
use App\Utils\ResultCode;

class BaseLogic
{

    //用户信息  该row-obj
    public static $user;
    public static $userId;
    public static $companyId;

    public function __construct()
    {
        self::$user = app('auth')->user();
        self::$userId = (self::$user)->id;
        self::$companyId = (self::$user)->company_id;
    }

    public static function success($msg='ok',$data=[]){
        return [
            'code' => ResultCode::SUCCESS,
            'msg' => $msg,
            'data' => $data
        ];
    }

    public static function error($code=ResultCode::ERROR,$msg='error',$data=[]){
        return [
            'code' => $code,
            'msg' => $msg,
            'data' => $data
        ];
    }
}