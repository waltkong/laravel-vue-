<?php
namespace App\Http\Validator;

class CompanyValidator extends BaseValidator{

    public function store(array $input){
        $rule = [
            'name' => 'required',
        ];
        $ruleChinese = [
            'name.required' => '名称必须',
        ];
        parent::commonValidate($input,$rule,$ruleChinese);
    }

    public function update(array $input){
        $rule = [
            'name' => 'required',
            'id' => 'required',
        ];
        $ruleChinese = [
            'name.required' => '名称必须',
        ];
        parent::commonValidate($input,$rule,$ruleChinese);
    }


    public function destroy(array $input){
        $rule = [
            'id' => 'required',
        ];
        $ruleChinese = [
            'id.required' => 'id必须',
        ];
        parent::commonValidate($input,$rule,$ruleChinese);
    }
}