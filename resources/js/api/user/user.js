import request from '@/utils/request';

export function getList(data) {
  return request({
    url: '/user/index',
    method: 'post',
    data:data,
  });
}

export function storeOrUpdate(data) {
  return request({
    url: '/user/storeOrUpdate',
    method: 'post',
    data:data,
  });
}

export function destroy(data){
  return request({
    url: '/user/destroy',
    method: 'post',
    data:data,
  });
}
