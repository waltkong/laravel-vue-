<?php
namespace App\Http\Logic;

use App\Http\Models\UsersModel;
use App\Utils\EncryptData;
use App\Utils\ResultCode;
use Illuminate\Support\Facades\DB;

class UserLogic extends BaseLogic
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($input,$page=1,$limit=100){
        $default = [
            'total' => 0,
            'data' => [],
        ];
        $data = $this->indexQs($input)->orderBy('id', 'asc')
            ->offset(($page -1) * $limit)->limit($limit)->get();

        foreach ($data as  $k => $datum){
            $belongCompany = $datum->belongCompany ;
            $data[$k]->company = $belongCompany->name ?? '-';

            $belongRole = $datum->belongRole;
            $data[$k]->role = $belongRole->name ?? '-';
        }

        $default['data'] = $data;
        $default['total'] =  $this->indexQs($input)->count();

        return $default;
    }

    protected function indexQs($input){
        $qs = new UsersModel();
        if(!empty($input['keyword'])){
            $qs = $qs->where('name','like',"%{$input['keyword']}%");
        }
        return $qs;
    }

    public function store($input){
        $data = [
            "company_id" => parent::$companyId,
            "role_id" => $input['role_id'] ?? '',
            "name" => $input['name'] ?? '',
            "avatar" => $input['avatar'] ?? '',
            "email" => $input['email'] ?? '',
            "phone" => $input['phone'] ?? '',
            "password" => EncryptData::encryptPassword($input['password']),
            "status" => $input['status'] ?? '1',
            "super_status" => $input['super_status'] ?? '0',
        ];
        try{
            $row = UsersModel::where('name',$data['name'])->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            UsersModel::insert($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function update($id,$input){
        $data = [
            "company_id" => parent::$companyId,
            "role_id" => $input['role_id'] ?? '',
            "name" => $input['name'] ?? '',
            "avatar" => $input['avatar'] ?? '',
            "email" => $input['email'] ?? '',
            "phone" => $input['phone'] ?? '',
            "status" => $input['status'] ?? '1',
            "super_status" => $input['super_status'] ?? '0',
        ];
        try{
            $row = UsersModel::where('name',$data['name'])->where('id','<>',$id)->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            UsersModel::where('id',$id)->update($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function destroy($id){
        try{
            UsersModel::where('id',$id)->delete();
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }
}