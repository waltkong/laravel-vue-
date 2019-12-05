import request from '@/utils/request';

export function getList(data) {
  return request({
    url: '/company/index',
    method: 'post',
    data:data,
  });
}

export function storeOrUpdate(data) {
  return request({
    url: '/company/storeOrUpdate',
    method: 'post',
    data:data,
  });
}

export function destroy(data){
  return request({
    url: '/company/destroy',
    method: 'post',
    data:data,
  });
}

export function companyOptions(data){
  return request({
    url: '/company/companyOptions',
    method: 'post',
    data:data,
  });
}

export function updateCompanyPermissions(data){
  return request({
    url: '/company/updateCompanyPermissions',
    method: 'post',
    data:data,
  });
}

export function companyPermissionOptions(data){
  return request({
    url: '/company/companyPermissionOptions',
    method: 'post',
    data:data,
  });
}



