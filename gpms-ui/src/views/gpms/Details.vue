<template>
  <div class="page">
    <el-page-header @back="goBack"
                    content="详情页面">
    </el-page-header>
    <el-form label-width="auto"
             style="margin:40px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="项目名">
            <el-input v-model="form.name"
                      readonly="" />
          </el-form-item>
          <el-form-item label="项目代码">
            <el-input v-model="form.projectCode"
                      readonly="" />
          </el-form-item>
        </el-col>

        <el-col :span="7">
          <el-form-item>
            <el-switch v-model="form.state"
                       @change="changeState"
                       active-text="启动"
                       inactive-text="停止"
                       active-color="#13ce66"
                       inactive-color="#ff4949"></el-switch>
          </el-form-item>
        </el-col>
        <el-col :span="3">
          <el-button>
            <el-link type="success"
                     style="font-size: 30px;"
                     :href="form.url"
                     target="_blank">访问</el-link></el-button>
        </el-col>
      </el-row>
      <el-form-item label="启动方式">
        <e-dict v-model="form.runType"
                type="tag"
                name="启动方式" />
      </el-form-item>
      <el-form-item label="运行状态"
                    prop="state">
        <el-tag v-if="form.state"
                effect="dark"
                type="success">运行中
        </el-tag>
        <el-tag v-else
                effect="dark"
                type="danger">停止
        </el-tag>
      </el-form-item>
      <el-form-item label="技术">
        <e-dict :value="form.technology"
                name="技术"
                type="checkboxtag" />
      </el-form-item>
      <el-form-item label="详情">
        <el-input v-model="form.details"
                  type="textarea"
                  readonly=""
                  :rows="3" />
      </el-form-item>
      <el-form-item label="账号密码">
        <el-input v-model="form.login"
                  type="textarea"
                  readonly=""
                  :rows="3" />
      </el-form-item>
      <el-form-item label="图片">
        <el-image v-for="url in !!form.img?form.img.split(','):[]"
                  :key="url"
                  :src="url"
                  style="width:80%;margin:5px;border: 1px solid #c0bbbb;"
                  lazy></el-image>
      </el-form-item>
    </el-form>
    <el-backtop target=".page"></el-backtop>
  </div>
</template>


<script>
export default {
  data () {
    return {
      form: {
        id: '',
        name: '',
        projectCode: '',
        runType: '',
        technology: '',
        details: '',
        img: '',
        state: false,
        login: '',
        url: '',
      }
    }
  },
  mounted () {
    this.form = this.$route.query
    if (this.form.state === 'true') this.form.state = true
    else this.form.state = false
  },
  methods: {
    changeState (val) {
      this.axios.get(`/gpms/project/docker/${this.form.projectCode}/${val}`).then(() => {
      }).catch(() => {
        this.form.state = !val
      })
    },
    goBack () { this.$router.go(-1) }
  },
}

</script>
<style scoped>
</style>