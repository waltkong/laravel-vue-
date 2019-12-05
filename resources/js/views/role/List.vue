<template>
  <div class="app-container">

    <div class="filter-container">
      <el-input v-model="query.keyword" placeholder="输入关键词" style="width: 200px;" class="filter-item" @keyup.enter.native="handleFilter" />

      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-plus" @click="handleCreate">
        新增
      </el-button>
      <el-button v-waves :loading="downloading" class="filter-item" type="primary" icon="el-icon-download" @click="handleDownload">
        导出
      </el-button>
    </div>


    <el-table v-loading="loading" :data="list" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="#" width="80">
        <template slot-scope="scope">
          <span>{{ scope.row.index }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="角色名">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="公司">
        <template slot-scope="scope">
          <span>{{ scope.row.company }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="分组">
        <template slot-scope="scope">
          <span>{{ scope.row.guard_name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="创建时间" >
        <template slot-scope="scope">
          <span>{{ scope.row.created_at }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="操作" width="350">
        <template slot-scope="scope">

          <el-button v-permission="['角色管理']" type="primary" size="small" icon="el-icon-edit" @click="handleEdit(scope.row);">
            编辑
          </el-button>

          <el-button v-permission="['角色管理']" type="danger" size="small" icon="el-icon-delete"
                     @click="handleDelete(scope.row);">
            删除
          </el-button>

          <el-button v-permission="['角色管理']" type="primary" size="small" icon="el-icon-edit"
                     @click="handleAuth(scope.row);">
            权限
          </el-button>

        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="query.page" :limit.sync="query.limit" @pagination="getList" />


    <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="10">
      <create-form
        v-if="createVisible"
        ref="createForm"
        :create-visible.sync="createVisible"
        :edit-row="thisEditRow"
        @getList="getList"
      />
    </el-col>

    <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="10">
      <auth-form
        v-if="authVisible"
        ref="authForm"
        :create-visible.sync="authVisible"
        :edit-row="thisEditRow"
        @getList="getList"
      />
    </el-col>

  </div>
</template>


<script>
  import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
  import {getList, destroy} from '@/api/user/role';
  import waves from '@/directive/waves'; // Waves directive
  import permission from '@/directive/permission'; // Permission directive
  import createForm from './components/create'
  import authForm from './components/auth'

  export default {
    name: 'RoleLists',
    components: { Pagination, createForm, authForm },
    directives: { waves, permission },
    data() {
      return {
        list: null,
        total: 0,
        loading: true,
        downloading: false,
        userCreating: false,
        query: {
          page: 1,
          limit: 15,
          keyword: '',
        },
        thisEditRow: {},
        dialogFormVisible: false,
        createVisible: false,
        authVisible:false,
        defaultForm: {},
      };
    },
    computed: {

    },
    created() {
      this.getList();
    },
    methods: {
      async getList() {
        const { limit, page } = this.query;
        this.loading = true;
        const res = await getList(this.query);
        this.list = res.data.data;
        this.list.forEach((element, index) => {
          element['index'] = (page - 1) * limit + index + 1;
        });
        this.total = res.data.total;
        this.loading = false;
      },
      handleFilter() {
        this.query.page = 1;
        this.getList();
      },
      handleCreate() {
        this.thisEditRow = {}
        this.createVisible = true
      },
      handleEdit(row) {
        this.thisEditRow = row
        this.createVisible = true
      },
      handleAuth(row) {
        this.thisEditRow = row
        this.authVisible = true
      },
      handleDelete(row) {
        this.$confirm(`是否确认删除`, '', { confirmButtonText: '确定',
          cancelButtonText: '取消',
          dangerouslyUseHTMLString: true,
          center: true }).then(() => {
          // 手机
          this.deleteApiRequest(row)
        })
        this.getList()
      },
      async deleteApiRequest(row) {
        this.loading = true;
        const ajaxData = {
          id: row.id
        };
        const res = await destroy(ajaxData);
        if(res.code.toString() === "1"){
          this.$message({
            message: '删除成功',
            type: 'success',
            duration: 1500
          })
        }
        this.loading = false
      },
      handleDownload() {
        this.downloading = true;
        import('@/vendor/Export2Excel').then(excel => {
          const tHeader = ['序号', 'id', '角色名', 'company_id'];
          const filterVal = ['index', 'id', 'name', 'company_id'];
          const data = this.formatJson(filterVal, this.list);
          excel.export_json_to_excel({
            header: tHeader,
            data,
            filename: 'user-list',
          });
          this.downloading = false;
        });
      },
      formatJson(filterVal, jsonData) {
        return jsonData.map(v => filterVal.map(j => v[j]));
      },
    },
  };
</script>

<style lang="scss" scoped>
  .edit-input {
    padding-right: 100px;
  }
  .cancel-btn {
    position: absolute;
    right: 15px;
    top: 10px;
  }
  .dialog-footer {
    text-align: left;
    padding-top: 0;
    margin-left: 150px;
  }
  .app-container {
    flex: 1;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
    .block {
      float: left;
      min-width: 250px;
    }
    .clear-left {
      clear: left;
    }
  }
</style>

