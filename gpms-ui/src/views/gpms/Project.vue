<template>
  <div>
    <!-- 搜索 -->
    <div class="head">
      <el-input v-model="queryParam.name"
                size="small"
                prefix-icon="el-icon-search"
                placeholder="请输入项目名"></el-input>
      <el-input v-model="queryParam.projectCode"
                size="small"
                prefix-icon="el-icon-search"
                placeholder="请输入项目代码"></el-input>
      <e-dict v-model="queryParam.runType"
              name="启动方式"
              size="small"
              type="select"
              placeholder="请输入启动方式" />
      <e-dict v-model="queryParam.technology"
              name="技术"
              size="small"
              :multiple="true"
              type="select"
              placeholder="请输入技术" />
      <el-select v-model="queryParam.state"
                 size="small"
                 placeholder="运行状态">
        <el-option label="运行中"
                   :value="true"></el-option>
        <el-option label="停止"
                   :value="false"></el-option>
      </el-select>
    </div>
    <!-- 按钮 -->
    <div class="button">
      <el-button type="primary"
                 size="mini"
                 plain
                 icon="el-icon-search"
                 @click="getList">搜索</el-button>
      <el-button size="mini"
                 plain
                 icon="el-icon-refresh"
                 @click="resetQuery">重置</el-button>
      <el-button type="success"
                 v-auth="'增'"
                 size="mini"
                 plain
                 @click="handleShowAddEdit"
                 icon="el-icon-plus">添加</el-button>

    </div>

    <!-- 表格 -->
    <el-table :data="dataList"
              style="width: 100%"
              :header-cell-style="{background:'#eef1f6'}"
              @selection-change="handleSelectionChange">
      <el-table-column align="center"
                       type="selection"
                       width="55"></el-table-column>
      <el-table-column align="center"
                       type="index"></el-table-column>
      <el-table-column prop="name"
                       label="项目名"
                       width="140"
                       align="center"></el-table-column>
      <el-table-column prop="projectCode"
                       label="项目代码"
                       align="center"></el-table-column>
      <el-table-column prop="runType"
                       label="启动方式"
                       width="140"
                       align="center">
        <template slot-scope="scope">
          <e-dict :value="scope.row.runType"
                  name="启动方式"
                  type="tag" />
        </template>
      </el-table-column>
      <el-table-column prop="technology"
                       label="技术"
                       width="200"
                       align="center">
        <template slot-scope="scope">
          <e-dict :value="scope.row.technology"
                  name="技术"
                  type="checkboxtag" />
        </template>
      </el-table-column>
      <el-table-column prop="details"
                       label="详情"
                       :show-overflow-tooltip="true"
                       width="200"
                       align="center"></el-table-column>
      <el-table-column prop="state"
                       label="运行状态"
                       align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.state"
                  effect="dark"
                  type="success">运行中
          </el-tag>
          <el-tag v-else
                  effect="dark"
                  type="danger">停止
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="url"
                       label="访问地址"
                       align="center">
        <template slot-scope="scope">
          <el-link v-if="scope.row.state"
                   type="success"
                   :href="scope.row.url"
                   target="_blank">访问</el-link>
        </template>
      </el-table-column>
      <el-table-column label="操作"
                       align="center"
                       width="200"
                       fixed="right">
        <template slot-scope="scope">
          <el-button size="mini"
                     type="text"
                     icon="el-icon-edit"
                     @click="handleDetails(scope.row)">详情</el-button>
          <el-button v-auth="'改'"
                     type="text"
                     size="mini"
                     icon="el-icon-edit"
                     @click="handleShowUpdateEdit(scope.row)">编辑</el-button>
          <el-button v-auth="'删'"
                     type="text"
                     size="mini"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 批量删除 -->
    <el-button style="margin-top: 8px"
               v-auth="'删'"
               type="danger"
               size="small"
               :disabled="multipleSelection.length == 0"
               @click="handleDeleteMany">批量删除</el-button>
    <!-- 分页 -->
    <el-pagination background
                   style="display:flex;justify-content:center;"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :page-size="queryParam.size"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total"></el-pagination>

    <el-dialog :visible.sync="dialogVisible"
               :title="dialogTitle"
               :destroy-on-close="true"
               @close="reset"
               :close-on-click-modal="false"
               width="60%">
      <el-form ref="form"
               :model="form"
               label-width="auto"
               style="margin:20px"
               :rules="rules">
        <el-form-item label="项目名"
                      prop="name">
          <el-input v-model="form.name"
                    placeholder="请输入项目名" />
        </el-form-item>
        <el-form-item label="项目代码"
                      prop="projectCode">
          <el-input v-model="form.projectCode"
                    placeholder="请输入项目代码" />
        </el-form-item>
        <el-form-item label="启动方式"
                      prop="runType">
          <e-dict v-model="form.runType"
                  name="启动方式" />
        </el-form-item>
        <el-form-item label="技术"
                      prop="technology">
          <e-dict v-model="form.technology"
                  name="技术"
                  type="checkbox"
                  placeholder="请选择技术" />
        </el-form-item>
        <el-form-item label="详情"
                      prop="details">
          <el-input v-model="form.details"
                    placeholder="请输入详情" />
        </el-form-item>
        <el-form-item label="img"
                      prop="img">
          <e-upload-image v-model="form.img">
          </e-upload-image>
        </el-form-item>
        <el-form-item label="运行状态"
                      prop="state">
          <el-switch v-model="form.state"
                     active-text="启动"
                     inactive-text="停止"
                     active-color="#13ce66"
                     inactive-color="#ff4949"></el-switch>
        </el-form-item>
        <el-form-item label="账号密码"
                      prop="login">
          <el-input v-model="form.login"
                    placeholder="请输入账号密码" />
        </el-form-item>
        <el-form-item label="访问地址"
                      prop="url">
          <el-input v-model="form.url"
                    placeholder="请输入访问地址" />
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button size="medium"
                   @click="dialogVisible = false">取 消</el-button>
        <el-button size="medium"
                   type="primary"
                   @click="handleAddOrUpdate">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import page from '@/mixin/page.js'
import Details from './Details.vue'
export default {
  components: { Details },
  mixins: [page],
  props: {},
  data () {
    return {
      // 多选框数据
      multipleSelection: [],
      dialogVisible: false,
      dialogTitle: '',
      dataList: [],
      form: {
        id: null,
        name: null,
        projectCode: null,
        runType: null,
        technology: null,
        details: null,
        img: null,
        state: false,
        login: null,
        url: null,
      },
      queryParam: {
        id: null,
        name: null,
        projectCode: null,
        runType: null,
        technology: null,
        details: null,
        img: null,
        state: null,
        login: null,
        url: null,
      },
      rules: {
        name: [{ required: true, message: '请输入项目名', trigger: 'blur' }],
        projectCode: [{ required: true, message: '请输入项目代码', trigger: 'blur' }],
        runType: [{ required: true, message: '请输入启动方式', trigger: 'blur' }],
        // technology: [{ required: true, message: '请输入技术', trigger: 'blur' }],
        details: [{ required: true, message: '请输入详情', trigger: 'blur' }],
        // img: [{ required: true, message: '请输入img', trigger: 'blur' }],
        state: [{ required: true, message: '请输入运行状态', trigger: 'blur' }],
        // login: [{ required: true, message: '请输入账号密码', trigger: 'blur' }],
        // url: [{ required: true, message: '请输入访问地址', trigger: 'blur' }],
      },
    }
  },
  mounted () {
    this.getList()
  },
  methods: {
    handleDetails (row) {
      this.$router.push({ path: '/gpms/Details', query: row })
    },
    reset () {
      this.form = this.$options.data().form
    },
    resetQuery () {
      this.queryParam = this.$options.data().queryParam
    },
    handleExport () {
      this.download('/gpms/project/export', this.queryParam)
    },
    // 多选框回调
    handleSelectionChange (val) {
      this.multipleSelection = val.map(item => item.id)
    },
    handleShowAddEdit () {
      this.dialogTitle = '添加'
      this.dialogVisible = true
    },
    handleShowUpdateEdit (row) {
      this.dialogTitle = '修改'
      Object.assign(this.form, row)
      this.dialogVisible = true
    },
    handleAddOrUpdate () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.id) {
            this.axios.post('/gpms/project/update', this.form).then(() => {
              this.getList()
              this.dialogVisible = false
            })
          } else {
            this.axios.post('/gpms/project/add', this.form).then(() => {
              this.getList()
              this.dialogVisible = false
            })
          }
        }
      })
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除这条数据, 是否继续?', '提示', { type: 'warning' }).then(() => {
        this.axios.post('/gpms/project/delete/' + row.id).then(() => this.getList())
      }).catch(e => console.log(e))
    },
    handleDeleteMany () {
      this.$confirm('此操作将永久删除 [' + this.multipleSelection.length + '] 条数据, 是否继续?', '提示', { type: 'warning' }).then(() => {
        this.axios.post('/gpms/project/delete/' + this.multipleSelection).then(() => this.getList())
      }).catch(e => console.log(e))
    },
    // 初始化数据
    getList () {
      this.axios.post(`/gpms/project/page`, this.queryParam).then(data => {
        this.dataList = data.list
        this.total = data.total - 0
      })
    },
  },
}
</script>
<style scoped>
.head {
  display: flex;
  flex-wrap: wrap;
}
.head .el-input {
  width: 200px !important;
}
.head * {
  margin: 0 8px 8px 0;
}
.button {
  margin: 0 0 15px 0;
  display: flex;
}
.button * {
  margin: 0 8px 0 0;
}
</style>