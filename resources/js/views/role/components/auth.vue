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
              <el-form-item label="权限">
                <el-checkbox-group v-model="defaultForm.has_permissions">
                  <el-checkbox v-model="checkedAll" label="" name="" @change="checkedAllChange" > 全选 </el-checkbox>

                  <template v-for="item in permissionOptions">
                  <el-checkbox :label="item.value" name="has_permissions">{{item.label}}</el-checkbox>
                  </template>
                </el-checkbox-group>
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
  import {updatePermissions, permissionOptions} from '@/api/user/role';

  export default {
    name: 'UpdatePermissions',
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
        defaultForm: {
          role_id: '',
          has_permissions: [],
        },
        rules: {

        },
        formLabelWidth: '100px',
        permissionOptions:[],
        checkedAll: true,
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
        this.title = '权限分配'
        this.editOrCreate = 'edit'
        this.defaultForm.role_id = this.editRow.id
        this.getPermissionOptions();
      } else {
        alert('非法访问');
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
        const response = await updatePermissions(this.defaultForm)
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
      async getPermissionOptions(){
        const  response = await permissionOptions({role_id:this.defaultForm.role_id});
        if(response.code.toString() === '1'){
          //permission_options选项 和 has-permissions
          this.permissionOptions = response.data.permission_options;
          this.defaultForm.has_permissions = response.data.has_permissions.map(item => {
            return Number(item)
          });

          console.log(this.permissionOptions)
          console.log(this.defaultForm)
        }
      },
      checkedAllChange(){
        this.checkedAll = !this.checkedAll;
        this.defaultForm.has_permissions = [];
        if(this.checkedAll){
          this.permissionOptions.map(item => {
            this.defaultForm.has_permissions.push(item.value)
          });
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

