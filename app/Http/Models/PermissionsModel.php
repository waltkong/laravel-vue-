<?php
namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class PermissionsModel extends Model
{
    public $table = 'permissions';  //权限

    protected $primaryKey = 'id';

    public $timestamps = true;

}