<?php
namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class RoleHasPermissionsModel extends Model
{
    public $table = 'role_has_permissions';  //角色拥有的权限

    protected $primaryKey = 'id';

    public $timestamps = false;

}