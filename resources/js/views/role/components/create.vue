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
              <el-form-item label="角色" prop="name">
                <el-input v-model="defaultForm.name" placeholder="请输入角色名" />
              </el-form-item>
            </el-col>

            <el-col :xs="24" :sm="24" :md="24" :lg="12" :xl="24">
              <el-form-item label="公司">
                <el-select v-model="defaultForm.company_id" filterable clearable placeholder="请选择" >
                  <el-option
                    v-for="item in companyOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  />
                </el-select>
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
  import {storeOrUpdate} from '@/api/user/role';

  export default {
    name: 'RoleCreate',
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
        },
        rules: {
          name: [{ required: true, message: '名称必填', trigger: 'blur' }],
          company_id: [{ required: true, message: '公司必选', trigger: 'blur' }],
        },
        formLabelWidth: '100px',
        companyOptions:[],
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
        }
      } else {
        this.title = '新增'
        this.editOrCreate = 'create'

      }
      this.getCompanyOptions();
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
