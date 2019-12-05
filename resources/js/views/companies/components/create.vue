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
              <el-form-item label="公司名" prop="name">
                <el-input v-model="defaultForm.name" placeholder="请输入公司名" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="logo" prop="logo">
                <el-input v-model="defaultForm.logo" placeholder="请输入logo" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <el-form-item label="电话" prop="phone">
              <el-input v-model="defaultForm.phone" placeholder="请输入公司电话" />
            </el-form-item>
          </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="地址" prop="address">
                <el-input v-model="defaultForm.address" placeholder="请输入公司地址" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
              <el-form-item label="超级管理员">
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
  import {storeOrUpdate} from '@/api/company/company';

  export default {
    name: 'CompaniesCreate',
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
          logo: '',
          phone: '',
          address: '',
          super_status: '0',
        },
        rules: {
          name: [{ required: true, message: '公司必填', trigger: 'blur' }]
        },
        formLabelWidth: '100px'
      }
    },
    watch: {
      dialogVisible(newValue, oldValue) {
        this.$emit('update:createVisible', newValue)
      },
      createVisible(newValue, oldValue) {
        this.dialogVisible = newValue
      }
    },
    created() {
      const editRowKeys = Object.keys(this.editRow)
      if (editRowKeys.length > 0) {
        this.title = '编辑'
        this.editOrCreate = 'edit'
        this.defaultForm = {
          id: this.editRow.id,
          name: this.editRow.name,
          logo: this.editRow.logo,
          phone: this.editRow.phone,
          address: this.editRow.address,
          super_status: this.editRow.super_status.toString(),
        }
      } else {
        this.title = '新增'
        this.editOrCreate = 'create'
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
