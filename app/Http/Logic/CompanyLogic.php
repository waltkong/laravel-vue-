<?php
namespace App\Http\Logic;

use App\Http\Models\CompanyModel;
use App\Http\Models\PermissionsModel;
use App\Utils\ResultCode;
use Illuminate\Support\Facades\DB;
use Mockery\Exception;

class CompanyLogic extends BaseLogic
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
        $default['data'] = $this->indexQs($input)->orderBy('id', 'desc')
            ->offset(($page -1) * $limit)->limit($limit)->get()->toArray();

        $default['total'] =  $this->indexQs($input)->count();

        return $default;
    }

    protected function indexQs($input){
        $qs = new CompanyModel;
        if(!empty($input['keyword'])){
            $qs = $qs->where('name','like',"%{$input['keyword']}%");
        }
        return $qs;
    }

    public function store($input){
        $data = [
            "name" => $input['name'] ?? '',
            "logo" => $input['logo'] ?? '',
            "phone" => $input['phone'] ?? '',
            "address" => $input['address'] ?? '',
            "super_status" => $input['super_status'] ?? 0,
        ];
        try{
            $row = CompanyModel::where('name',$data['name'])->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            CompanyModel::insert($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function update($id,$input){
        $data = [
            "name" => $input['name'] ?? '',
            "logo" => $input['logo'] ?? '',
            "phone" => $input['phone'] ?? '',
            "address" => $input['address'] ?? '',
            "super_status" => $input['super_status'] ?? 0,
        ];
        try{
            $row = CompanyModel::where('name',$data['name'])->where('id','<>',$id)->first();
            if(!is_null($row)){
                throw new \Exception("数据已存在");
            }
            CompanyModel::where('id',$id)->update($data);
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function destroy($id){
        try{
            CompanyModel::where('id',$id)->delete();
            return parent::success();
        }catch (\Exception $e){
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function companyOptions()
    {
        $where = [];
        $superStatus = CompanyModel::where('id',parent::$companyId)->value("super_status");
        if($superStatus != 1){
            $where[] = ['id','=',parent::$companyId];
        }
        $res = CompanyModel::where($where)->select(["id","name"])->get()->toArray();
        $ret = [];
        foreach ($res as $k => $re){
            $ret[] = [
                'value' => $re['id'],
                'label' => $re['name'],
            ];
        }
        return $ret;
    }

    public function updateCompanyPermissions($input)
    {
        $data = [
            'company_id' => $input['company_id'],
            //has_permissions  直接为name  而不是id
            'names' => is_array($input['has_permissions']) ? $input['has_permissions'] :
                \GuzzleHttp\json_decode($input['has_permissions'],true),
        ];
        DB::beginTransaction();
        try{
            if($input['company_id'] > 1){
                PermissionsModel::where('company_id', $input['company_id'])->delete();
                foreach ($data['names'] as $name){
                    PermissionsModel::insert([
                        'name' => $name,
                        'company_id' => $input['company_id'],
                        'guard_name' => 'api',
                    ]);
                }
            }
            DB::commit();
            return parent::success();
        }catch (\Exception $e){
            DB::rollBack();
            return parent::error(ResultCode::ERROR,$e->getMessage(),[]);
        }
    }

    public function companyPermissionOptions($input)
    {
        //返回company_id为1的所有选项
        $where = [
            ['company_id','=',1]
        ];
        $res = PermissionsModel::where($where)->select(["id","name"])->get()->toArray();
        $permissionOptions = [];
        foreach ($res as $k => $re){
            $permissionOptions[] = [
                'value' => $re['name'],   //都改为name
                'label' => $re['name'],
            ];
        }
        $hasPermissions = PermissionsModel::where('company_id',$input['company_id'])->pluck('name');
        return [
            'permission_options' => $permissionOptions,
            'has_permissions' => $hasPermissions,
        ];
    }



}