<?php

namespace App\Http\Middleware;

use App\Http\Models\PermissionsModel;
use App\Http\Models\RoleHasPermissionsModel;
use Closure;
use Spatie\Permission\Exceptions\UnauthorizedException;

class MyPermission
{
    public function handle($request, Closure $next, $permission)
    {
        if (app('auth')->guest()) {
            throw UnauthorizedException::notLoggedIn();
        }
        $permissions = is_array($permission)
            ? $permission
            : explode('|', $permission);

        $user = app('auth')->user();
        $permissionIds = RoleHasPermissionsModel::where('role_id',$user->role_id)->pluck('permission_id');
        $permissionNames = PermissionsModel::whereIn('id',$permissionIds)->pluck('name')->toArray();

        foreach ($permissions as $permission) {
            if (in_array($permission,$permissionNames)) {
                return $next($request);
            }
        }
        throw UnauthorizedException::forPermissions($permissions);
    }
}
