/** When your routing table is too long, you can split it into small modules**/
import Layout from '@/layout';

const adminRoutes = {
  path: '/administrator',
  component: Layout,
  redirect: '/administrator/users',
  name: 'Administrator',
  alwaysShow: true,
  meta: {
    title: '用户管理',
    icon: 'admin',
    permissions: ['管理员管理'],
  },
  children: [
    /** User managements */
    // {
    //   path: 'users/edit/:id(\\d+)',
    //   component: () => import('@/views/users/Profile'),
    //   name: 'UserProfile',
    //   meta: { title: '用户信息', noCache: true, permissions: ['用户管理'] },
    //   hidden: true,
    // },
    // {
    //   path: 'users',
    //   component: () => import('@/views/users/List'),
    //   name: 'UserLists',
    //   meta: { title: '用户列表', icon: 'user', permissions: ['用户管理'] },
    // },
    /** Role and permission */
    // {
    //   path: 'roles',
    //   component: () => import('@/views/role-permission/List'),
    //   name: 'RoleList',
    //   meta: { title: '权限管理', icon: 'role', permissions: ['权限管理'] },
    // },
    {
      path: 'companies',
      component: () => import('@/views/companies/List'),
      name: 'CompanyList',
      meta: { title: '公司管理', icon: 'list', permissions: ['公司管理'] },
    },
    {
      path: 'user',
      component: () => import('@/views/user/List'),
      name: 'UserList',
      meta: { title: '用户管理', icon: 'list', permissions: ['用户管理'] },
    },
    {
      path: 'role',
      component: () => import('@/views/role/List'),
      name: 'RoleLists',
      meta: { title: '角色管理', icon: 'list', permissions: ['角色管理'] },
    },
    // {
    //   path: 'articles/create',
    //   component: () => import('@/views/articles/Create'),
    //   name: 'CreateArticle',
    //   meta: { title: 'createArticle', icon: 'edit', permissions: ['manage article'] },
    //   hidden: true,
    // },
    // {
    //   path: 'articles/edit/:id(\\d+)',
    //   component: () => import('@/views/articles/Edit'),
    //   name: 'EditArticle',
    //   meta: { title: 'editArticle', noCache: true, permissions: ['manage article'] },
    //   hidden: true,
    // },
    // {
    //   path: 'articles',
    //   component: () => import('@/views/articles/List'),
    //   name: 'ArticleList',
    //   meta: { title: 'articleList', icon: 'list', permissions: ['manage article'] },
    // },
  ],
};

export default adminRoutes;
