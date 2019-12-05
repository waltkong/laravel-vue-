<?php
namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class CompanyModel extends Model
{
    public $table = 'company';  //公司表

    protected $primaryKey = 'id';

    public $timestamps = true;

}