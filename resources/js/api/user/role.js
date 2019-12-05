import request from '@/utils/request';

export function getList(data) {
  return request({
    url: '/role/index',
    method: 'post',
    data:data,
  });
}

export function storeOrUpdate(data) {
  return request({
    url: '/role/storeOrUpdate',
    method: 'post',
    data:data,
  });
}

export function destroy(data){
  return request({
    url: '/role/destroy',
    method: 'post',
    data:data,
  });
}

export function roleOptions(data){
  return request({
    url: '/role/roleOptions',
    method: 'post',
    data:data,
  });
}

export function updatePermissions(data){
  return request({
    url: '/role/updatePermissions',
    method: 'post',
    data:data,
  });
}

export function permissionOptions(data){
  return request({
    url: '/role/permissionOptions',
    method: 'post',
    data:data,
  });
}
