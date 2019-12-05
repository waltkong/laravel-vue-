<?php
namespace App\Http\Controllers\User;

use App\Http\Controllers\AdminBaseController;
use App\Http\Logic\RoleLogic;
use App\Http\Validator\RoleValidator;
use App\Utils\ResultCode;

class RoleController extends AdminBaseController{

    protected $logic;
    protected $validator;

    public function __construct()
    {
        parent::__construct();
        $this->logic = new RoleLogic();
        $this->validator = new RoleValidator();
    }

    public function index()
    {
        $input =  request()->all();
        $page = $input['page'] ?? 1;
        $limit = $input['limit'] ?? 15;
        $res = $this->logic->index($input,$page,$limit);
        ResultCode::success('ok',$res);
    }

    public function storeOrUpdate()
    {
        $input =  request()->all();
        $this->validator->store($input);
        if(empty($input['id'])){
            $res = $this->logic->store($input);
        }else{
            $res = $this->logic->update($input['id'],$input);
        }
        $res['code']==ResultCode::SUCCESS ?ResultCode::success('OK',$res)
            : ResultCode::error($res['code'],$res['msg'],$res['data']);
    }


    public function destroy()
    {
        $input =  request()->all();
        $this->validator->destroy($input);
        $res = $this->logic->destroy($input['id']);
        $res['code']==ResultCode::SUCCESS ?ResultCode::success('OK',$res)
            : ResultCode::error($res['code'],$res['msg'],$res['data']);
    }

    public function roleOptions()
    {
        $input =  request()->all();
        $res = $this->logic->roleOptions($input);
        ResultCode::success('ok',$res);
    }

    public function updatePermissions()
    {
        $input =  request()->all();
        $res = $this->logic->updatePermissions($input);
        $res['code']==ResultCode::SUCCESS ?ResultCode::success('OK',$res)
            : ResultCode::error($res['code'],$res['msg'],$res['data']);
    }

    public function permissionOptions()
    {
        $input =  request()->all();
        $res = $this->logic->permissionOptions($input);
        ResultCode::success('ok',$res);
    }


}