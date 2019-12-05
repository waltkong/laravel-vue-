<?php
namespace App\Utils;

class JsonFormat
{

    /** Json数据格式化,美化
     * @param  Mixed  $data   数据
     * @param  String $indent 缩进字符，默认4个空格
     * @return mixed
     */
    public static function jsonPretty($data, $indent=null){
        if(is_array($data)){
            $data = json_encode($data);
        }
        // 将urlencode的内容进行urldecode
        $data = urldecode($data);
        // 缩进处理
        $ret = '';
        $pos = 0;
        $length = strlen($data);
        $indent = isset($indent)? $indent : '    ';
        $newline = "\n";
        $prevchar = '';
        $outofquotes = true;

        for($i=0; $i<=$length; $i++){

            $char = substr($data, $i, 1);

            if($char=='"' && $prevchar!='\\'){
                $outofquotes = !$outofquotes;
            }elseif(($char=='}' || $char==']') && $outofquotes){
                $ret .= $newline;
                $pos --;
                for($j=0; $j<$pos; $j++){
                    $ret .= $indent;
                }
            }

            $ret .= $char;

            if(($char==',' || $char=='{' || $char=='[') && $outofquotes){
                $ret .= $newline;
                if($char=='{' || $char=='['){
                    $pos ++;
                }

                for($j=0; $j<$pos; $j++){
                    $ret .= $indent;
                }
            }

            $prevchar = $char;
        }
        return $ret;
    }

}