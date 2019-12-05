<?php

use Illuminate\Http\Request;
use \App\Laravue\Faker;
use \App\Laravue\JsonResponse;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'api'], function () {
    Route::post('auth/login', 'AuthController@login');
    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('auth/user', 'AuthController@user');
        Route::post('auth/logout', 'AuthController@logout');
    });

    Route::post('company/index', 'User\CompanyController@index')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_COMPANY_MANAGE);
    Route::post('company/storeOrUpdate', 'User\CompanyController@storeOrUpdate')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_COMPANY_MANAGE);
    Route::post('company/destroy', 'User\CompanyController@destroy')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_COMPANY_MANAGE);
    Route::post('company/companyOptions', 'User\CompanyController@companyOptions');
    Route::post('company/updateCompanyPermissions', 'User\CompanyController@updateCompanyPermissions')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_COMPANY_MANAGE);
    Route::post('company/companyPermissionOptions', 'User\CompanyController@companyPermissionOptions');


    Route::post('role/index', 'User\RoleController@index')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_ROLE_MANAGE);
    Route::post('role/storeOrUpdate', 'User\RoleController@storeOrUpdate')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_ROLE_MANAGE);
    Route::post('role/destroy', 'User\RoleController@destroy')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_ROLE_MANAGE);
    Route::post('role/roleOptions', 'User\RoleController@roleOptions');
    Route::post('role/updatePermissions', 'User\RoleController@updatePermissions')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_ROLE_MANAGE);
    Route::post('role/permissionOptions', 'User\RoleController@permissionOptions');



    Route::post('user/index', 'User\UserController@index')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_USER_MANAGE);
    Route::post('user/storeOrUpdate', 'User\UserController@storeOrUpdate')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_USER_MANAGE);
    Route::post('user/destroy', 'User\UserController@destroy')
        ->middleware('mypermission:'.\App\Laravue\Acl::PERMISSION_USER_MANAGE);





    Route::apiResource('users', 'UserController');
    Route::get('users/{user}/permissions', 'UserController@permissions');
    Route::put('users/{user}/permissions', 'UserController@updatePermissions');
    Route::apiResource('roles', 'RoleController');
    Route::get('roles/{role}/permissions', 'RoleController@permissions');
    Route::apiResource('permissions', 'PermissionController');


    // Fake APIs
    Route::get('/table/list', function () {
        $rowsNumber = mt_rand(20, 30);
        $data = [];
        for ($rowIndex = 0; $rowIndex < $rowsNumber; $rowIndex++) {
            $row = [
                'author' => Faker::randomString(mt_rand(5, 10)),
                'display_time' => Faker::randomDateTime()->format('Y-m-d H:i:s'),
                'id' => mt_rand(100000, 100000000),
                'pageviews' => mt_rand(100, 10000),
                'status' => Faker::randomInArray(['deleted', 'published', 'draft']),
                'title' => Faker::randomString(mt_rand(20, 50)),
            ];

            $data[] = $row;
        }

        return response()->json(new JsonResponse(['items' => $data]));
    });

    Route::get('/orders', function () {
        $rowsNumber = 8;
        $data = [];
        for ($rowIndex = 0; $rowIndex < $rowsNumber; $rowIndex++) {
            $row = [
                'order_no' => 'LARAVUE' . mt_rand(1000000, 9999999),
                'price' => mt_rand(10000, 999999),
                'status' => Faker::randomInArray(['success', 'pending']),
            ];

            $data[] = $row;
        }

        return response()->json(new JsonResponse(['items' => $data]));
    });

    Route::get('/articles', function () {
        $rowsNumber = 10;
        $data = [];
        for ($rowIndex = 0; $rowIndex < $rowsNumber; $rowIndex++) {
            $row = [
                'id' => mt_rand(100, 10000),
                'display_time' => Faker::randomDateTime()->format('Y-m-d H:i:s'),
                'title' => Faker::randomString(mt_rand(20, 50)),
                'author' => Faker::randomString(mt_rand(5, 10)),
                'comment_disabled' => Faker::randomBoolean(),
                'content' => Faker::randomString(mt_rand(100, 300)),
                'content_short' => Faker::randomString(mt_rand(30, 50)),
                'status' => Faker::randomInArray(['deleted', 'published', 'draft']),
                'forecast' => mt_rand(100, 9999) / 100,
                'image_uri' => 'https://via.placeholder.com/400x300',
                'importance' => mt_rand(1, 3),
                'pageviews' => mt_rand(10000, 999999),
                'reviewer' => Faker::randomString(mt_rand(5, 10)),
                'timestamp' => Faker::randomDateTime()->getTimestamp(),
                'type' => Faker::randomInArray(['US', 'VI', 'JA']),

            ];

            $data[] = $row;
        }

        return response()->json(new JsonResponse(['items' => $data, 'total' => mt_rand(1000, 10000)]));
    });

    Route::get('articles/{id}', function ($id) {
        $article = [
            'id' => $id,
            'display_time' => Faker::randomDateTime()->format('Y-m-d H:i:s'),
            'title' => Faker::randomString(mt_rand(20, 50)),
            'author' => Faker::randomString(mt_rand(5, 10)),
            'comment_disabled' => Faker::randomBoolean(),
            'content' => Faker::randomString(mt_rand(100, 300)),
            'content_short' => Faker::randomString(mt_rand(30, 50)),
            'status' => Faker::randomInArray(['deleted', 'published', 'draft']),
            'forecast' => mt_rand(100, 9999) / 100,
            'image_uri' => 'https://via.placeholder.com/400x300',
            'importance' => mt_rand(1, 3),
            'pageviews' => mt_rand(10000, 999999),
            'reviewer' => Faker::randomString(mt_rand(5, 10)),
            'timestamp' => Faker::randomDateTime()->getTimestamp(),
            'type' => Faker::randomInArray(['US', 'VI', 'JA']),

        ];

        return response()->json(new JsonResponse($article));
    });

    Route::get('articles/{id}/pageviews', function ($id) {
        $pageviews = [
            'PC' => mt_rand(10000, 999999),
            'Mobile' => mt_rand(10000, 999999),
            'iOS' => mt_rand(10000, 999999),
            'android' => mt_rand(10000, 999999),
        ];
        $data = [];
        foreach ($pageviews as $device => $pageview) {
            $data[] = [
                'key' => $device,
                'pv' => $pageview,
            ];
        }

        return response()->json(new JsonResponse(['pvData' => $data]));
    });

});
