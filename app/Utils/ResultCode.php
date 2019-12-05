<?php
namespace App\Utils;

class ResultCode
{

    // 成功状态码
    const SUCCESS = 1;
    const ERROR = -1;

    // -------------------失败状态码----------------------
    // 参数错误
    const PARAMS_IS_NULL = 10001;// 参数为空
    const PARAMS_NOT_COMPLETE = 10002; // 参数不全
    const PARAMS_TYPE_ERROR = 10003; // 参数类型错误
    const PARAMS_IS_INVALID = 10004; // 参数无效

    // 用户错误
    const USER_NOT_EXIST = 20001; // 用户不存在
    const USER_NOT_LOGGED_IN = 20002; // 用户未登陆
    const USER_ACCOUNT_ERROR = 20003; // 用户名或密码错误
    const USER_ACCOUNT_FORBIDDEN = 20004; // 用户账户已被禁用
    const USER_HAS_EXIST = 20005;// 用户已存在
    const USER_TOKEN_ERROR = 20006;  //用户token异常

    // 业务错误
    const BUSINESS_ERROR = 30001;// 系统业务出现问题

    // 系统错误
    const SYSTEM_INNER_ERROR = 40001; // 系统内部错误

    // 数据错误
    const DATA_NOT_FOUND = 50001; // 数据未找到
    const DATA_IS_WRONG = 50002;// 数据有误
    const DATA_ALREADY_EXISTED = 50003;// 数据已存在

    // 接口错误
    const INTERFACE_INNER_INVOKE_ERROR = 60001; // 系统内部接口调用异常
    const INTERFACE_OUTER_INVOKE_ERROR = 60002;// 系统外部接口调用异常
    const INTERFACE_FORBIDDEN = 60003;// 接口禁止访问
    const INTERFACE_ADDRESS_INVALID = 60004;// 接口地址无效
    const INTERFACE_REQUEST_TIMEOUT = 60005;// 接口请求超时
    const INTERFACE_EXCEED_LOAD = 60006;// 接口负载过高

    // 权限错误
    const PERMISSION_NO_ACCESS = 70001;// 没有访问权限

    public static function success($msg='ok',$data=[]){
        header('Content-Type:application/json; charset=utf-8');
        $ret = [
            'code' => self::SUCCESS,
            'msg'  => $msg,
            'data' => $data,
        ];
        $json = json_encode($ret,JSON_UNESCAPED_UNICODE);
        echo JsonFormat::jsonPretty($json);die;
    }

    public static function error($code,$msg,$data=[]){
        header('Content-Type:application/json; charset=utf-8');
        $ret = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];
        $json =  json_encode($ret,JSON_UNESCAPED_UNICODE);
        echo JsonFormat::jsonPretty($json);die;
    }

}