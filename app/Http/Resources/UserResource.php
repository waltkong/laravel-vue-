<?php

namespace App\Http\Resources;

use App\Http\Models\CompanyModel;
use App\Http\Models\PermissionsModel;
use App\Http\Models\RoleHasPermissionsModel;
use App\Http\Models\RolesModel;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $role = !empty($this->role_id) ? RolesModel::where('id',$this->role_id)->value('name') : "";
        $permissionIds = !empty($this->company_id) && !empty($this->role_id) ?
            RoleHasPermissionsModel::where('company_id',$this->company_id)->where('role_id',$this->role_id)->pluck('permission_id'): [] ;
        $permissions = !empty($permissionIds) ? PermissionsModel::whereIn('id',$permissionIds)->pluck('name'):[];

        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'company_id' => $this->company_id,
            'company' => !empty($this->company_id) ? CompanyModel::where('id',$this->company_id)->value('name') : '',
            'role_id' => $this->role_id,
            'role' => $role,
            'roles' => [$role],
            'permissions' => $permissions,
            'avatar' => 'https://i.pravatar.cc',
        ];
    }


}
