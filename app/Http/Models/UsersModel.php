<?php
namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class UsersModel extends Model
{
    public $table = 'users';  //管理员表

    protected $primaryKey = 'id';

    public $timestamps = true;

    /**
     * 用户所属公司
     */
    public function belongCompany(){
        return $this->belongsTo('App\Http\Models\CompanyModel','company_id','id');
    }

    /**
     * 用户所属角色
     */
    public function belongRole(){
        return $this->belongsTo('App\Http\Models\RolesModel','role_id','id');
    }


}