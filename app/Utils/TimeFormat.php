<?php
namespace App\Utils;

class TimeFormat
{

    public static function UTC2dateTime($str){
        $str =  str_replace("T"," ",$str);
        $str =  str_replace("Z","",$str);
        return trim($str);
    }

    public static function timestamp2UTC($str){
        $date1 = date('Y-m-d',$str);
        $date2 = date('H:i:s',$str);
        return $date1.'T'.$date2.'Z';
    }

}