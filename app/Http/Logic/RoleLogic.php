<?php
namespace App\Http\Logic;

use App\Http\Models\PermissionsModel;
use App\Http\Models\RoleHasPermissionsModel;
use App\Http\Models\RolesModel;
use App\Utils\ResultCode;
use Illuminate\Support\Facades\DB;
use Mockery\Exception;

class RoleLogic extends BaseLogic
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
        $data = $this->indexQs($input)->orderBy('id', 'desc')
            ->offset(($page -1) * $limit)->limit($limit)->get();

        foreach ($data as $k => $datum){
            $data[$k]->company = $datum->belongCompany->name ;
        }

        $default['data'] = $data;
        $default['total'] =  $this->indexQs($input)->count();

        return $default;
    }

    protected function indexQs($input){
        $qs = new RolesModel;
        if(!empty($input['company_id'])){
            $qs = $qs->where('company_id','=',"{$input['company_id']}");
        }
        if(!empty($input['keyword'])){
            $qs = $qs->where('name','like',"%{$input['keyword']}%");
        }
        return $qs;
    }

    public function store($input){
        $data = [
            "company_id" => $input['company_id'] ?? '',
            "name" => $input['name'] ?? '',
            "guard_name" => 'api',
        ];
        try{
            $where = [
                ['name',"=",$data['name']],
                ['company_id',"=",$data['company_id']],
            ];
            $row = RolesModel::where($where)->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            RolesModel::insert($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function update($id,$input){
        $data = [
            "company_id" => $input['company_id'] ?? '',
            "name" => $input['name'] ?? '',
            "guard_name" => 'api',
        ];
        try{
            $where = [
                ['name',"=",$data['name']],
                ['company_id',"=",$data['company_id']],
                ['id',"<>",$id],
            ];
            $row = RolesModel::where($where)->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            RolesModel::where('id',$id)->update($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function destroy($id){
        try{
            RolesModel::where('id',$id)->delete();
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function roleOptions($input)
    {
        $where = [];
        if(!empty($input['company_id'])){
            $where[] = ['company_id','=',$input['company_id']];
        }
        $res = RolesModel::where($where)->select(["id","name"])->get()->toArray();
        $ret = [];
        foreach ($res as $k => $re){
            $ret[] = [
                'value' => $re['id'],
                'label' => $re['name'],
            ];
        }
        return $ret;
    }

    public function updatePermissions($input)
    {
        $where = [];
        $where[] = ['role_id','=',$input['role_id']];
        $companyId = RolesModel::where('id','=',$input['role_id'])->value('company_id');

        DB::beginTransaction();
        try{
            RoleHasPermissionsModel::where('role_id',$input['role_id'])
                ->where('company_id',$companyId)->delete();
            $hasPermissions = is_array($input['has_permissions']) ? $input['has_permissions'] : \GuzzleHttp\json_decode($input['has_permissions'],true);
            foreach ($hasPermissions as $k => $hasPermission){
                RoleHasPermissionsModel::insert([
                    'role_id' => $input['role_id'],
                    'permission_id' => $hasPermission,
                    'company_id' => $companyId
                ]);
            }
            DB::commit();
            return parent::success();
        }catch (\Exception $e){
            DB::rollBack();
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function permissionOptions(array $input)
    {
        //查出这个角色所在公司
        $companyId = RolesModel::where('id','=',$input['role_id'])->value('company_id');
        //该公司所有权限
        $res = PermissionsModel::where('company_id',$companyId)->get()->toArray();
        $permissionOptions = [];
        foreach ($res as $k => $re){
            $permissionOptions[] = [
                'value' => $re['id'],
                'label' => $re['name'],
            ];
        }

        $hasPermissions = RoleHasPermissionsModel::where('role_id',$input['role_id'])
            ->where('company_id',$companyId)->pluck('permission_id');

        return [
            'permission_options' => $permissionOptions,
            'has_permissions'  => $hasPermissions,
        ];
    }



}