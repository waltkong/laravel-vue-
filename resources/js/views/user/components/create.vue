<template>
  <div>
    <el-col :xs="24" :sm="24" :md="22" :lg="18" :xl="16">
      <el-dialog
        center
        :title="title"
        width="65%"
        :close-on-click-modal="false"
        :visible.sync="dialogVisible"
        :fullscreen="fullscreen"
      >
        <el-row>
          <el-form
            ref="createForm"
            :model="defaultForm"
            :rules.sync="rules"
            :label-width="formLabelWidth"
            class="dataauth-create-form"
          >
            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="用户" prop="name">
                <el-input v-model="defaultForm.name" placeholder="请输入用户名" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="24">
              <el-form-item label="公司">
                <el-select v-model="defaultForm.company_id" filterable clearable placeholder="请选择" @change="companyChange">
                  <el-option
                    v-for="item in companyOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="24">
              <el-form-item label="角色">
                <el-select v-model="defaultForm.role_id" filterable clearable placeholder="请选择">
                  <el-option
                    v-for="item in roleOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="avatar" prop="avatar">
                <el-input v-model="defaultForm.avatar" placeholder="请输入avatar" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="email" prop="email">
                <el-input v-model="defaultForm.email" placeholder="请输入email" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="密码" prop="password">
                <el-input v-model="defaultForm.password" placeholder="请输入密码" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="电话" prop="phone">
                <el-input v-model="defaultForm.phone" placeholder="请输入电话" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="状态">
                <template>
                  <el-radio v-model="defaultForm.status" label="0">禁用</el-radio>
                  <el-radio v-model="defaultForm.status" label="1">启用</el-radio>
                </template>
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="超级管理">
                <template>
                  <el-radio v-model="defaultForm.super_status" label="0">否</el-radio>
                  <el-radio v-model="defaultForm.super_status" label="1">是</el-radio>
                </template>
              </el-form-item>
            </el-col>

          </el-form>
        </el-row>

        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button @click="handleCreate">提 交</el-button>
        </div>
      </el-dialog>
    </el-col>
  </div>
</template>

<script>
  import {companyOptions} from '@/api/company/company';
  import {roleOptions} from '@/api/user/role';
  import {storeOrUpdate} from '@/api/user/user';

  export default {
    name: 'UserCreate',
    components: { },
    props: {
      createVisible: {
        type: Boolean,
        default: false
      },
      editRow: {
        type: Object,
        default: () => {}
      },
    },
    data() {
      return {
        loading: false,
        title: '',
        editOrCreate: 'create',
        dialogVisible: this.createVisible,
        fullscreen: false,
        agentOptions: [],
        defaultForm: {
          id: '',
          name: '',
          company_id: '',
          role_id: '',
          avatar: '',
          phone: '',
          email: '',
          password:'',
          super_status: '0',
          status:'1',
        },
        rules: {
          name: [{ required: true, message: '名称必填', trigger: 'blur' }]
        },
        formLabelWidth: '100px',
        companyOptions:[],
        roleOptions:[],   //角色根据选择的公司而变化
      }
    },
    watch: {
      dialogVisible(newValue, oldValue) {
        this.$emit('update:createVisible', newValue)
      },
      createVisible(newValue, oldValue) {
        this.dialogVisible = newValue
      },
    },
    created() {
      const editRowKeys = Object.keys(this.editRow)
      if (editRowKeys.length > 0) {
        this.title = '编辑'
        this.editOrCreate = 'edit'
        this.defaultForm = {
          id: this.editRow.id,
          name: this.editRow.name,
          company_id: this.editRow.company_id,
          role_id: this.editRow.role_id,
          avatar: this.editRow.avatar,
          phone: this.editRow.phone,
          email: this.editRow.email,
          password:this.editRow.password,
          super_status:this.editRow.super_status.toString() ,
          status:this.editRow.status.toString() ,
        }
        console.log(this.defaultForm)
        this.getCompanyOptions();
        this.getRoleOptions();
      } else {
        this.title = '新增'
        this.editOrCreate = 'create'
        this.getCompanyOptions();
      }

    },
    methods: {
      getList() {
        this.loading = true
        this.loading = false
      },
      // 执行创建
      handleCreate() {
        this.$refs['createForm'].validate(valid => {
          if (valid) {
            this.storeApi();
          } else {
            return false
          }
        })
      },
      async getCompanyOptions(){
        const response = await companyOptions()
        if(response.code.toString() === "1"){
          this.companyOptions = response.data;
        }
      },
      async getRoleOptions(){
        const ajaxData = {
          company_id : this.defaultForm.company_id
        };
        const response = await roleOptions(ajaxData);
        if(response.code.toString() === "1"){
          this.roleOptions = response.data;
        }
      },
      async storeApi(){
        const response = await storeOrUpdate(this.defaultForm)
        if(response.code === 1){
          this.$message({
            message: 'ok',
            type: 'success',
            duration: 1500
          });
          this.dialogVisible = false;
          this.$emit('getList')
        }else{
          this.$message({
            message: response.msg,
            type: 'error',
            duration: 1500
          })
        }
      },
      companyChange(){
        //获取前就将角色清除
        this.defaultForm.role_id = '';
        this.roleOptions = [];
        this.getRoleOptions();
      }
    }
  }
</script>

<style scoped>
  .dialog-footer {
    margin-top: -15px;
  }
  .width {
    width: 50%;
  }
</style>
