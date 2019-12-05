<?php
namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class RolesModel extends Model
{
    public $table = 'roles';  //角色表

    protected $primaryKey = 'id';

    public $timestamps = true;

    /**
     * 所属公司
     */
    public function belongCompany(){
        return $this->belongsTo('App\Http\Models\CompanyModel','company_id','id');
    }

}