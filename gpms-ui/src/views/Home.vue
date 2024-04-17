<template>
  <div>
    <top></top>

    <div style="width: 98%;margin: 1% 1% 1% 1%">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card shadow="always">
            <div ref="pieChart"
                 style="width: 100%; height: 400px;"></div>
          </el-card>
        </el-col>

        <el-col :span="12">
          <el-card shadow="always">
            <div ref="lineChart"
                 style="width: 100%; height:400px"></div>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <!-- <div style="width: 98%;margin: 1% 1% 1% 1%">
      <el-card>
        <div slot="header">
          <span><i class="el-icon-monitor"></i> 服务器信息</span>
        </div>
        <div class="el-table el-table--enable-row-hover el-table--medium">
          <table cellspacing="0"
                 style="width: 100%;">
            <tbody>
              <tr>
                <td class="el-table__cell is-leaf">
                  <div class="cell">服务器名称</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell"
                       v-if="server.sys">{{ server.sys.computerName }}</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell">操作系统</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell"
                       v-if="server.sys">{{ server.sys.osName }}</div>
                </td>
              </tr>
              <tr>
                <td class="el-table__cell is-leaf">
                  <div class="cell">服务器IP</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell"
                       v-if="server.sys">{{ server.sys.computerIp }}</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell">系统架构</div>
                </td>
                <td class="el-table__cell is-leaf">
                  <div class="cell"
                       v-if="server.sys">{{ server.sys.osArch }}</div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </el-card>
    </div> -->

  </div>
</template>

<script>
import top from './Top.vue'
import * as echarts from 'echarts'
const animationDuration = 6000
export default {
  components: {
    top
  },
  data () {
    return {
      server: {
        sys: {
          computerName: 'My Computer',
          osName: 'Windows 10',
          computerIp: '127.0.0.1',
          osArch: 'x64',
        },
      },
    }
  },
  mounted () {
    this.axios.get('/home/pie').then(res => {
      // 初始化饼状图 , 传入数据 { name，value } 
      this.initPieChart(res)
    })
    this.axios.get('/home/line').then(res => {
      // 初始化折线图
      this.initLineChart(res)
    })
  },
  methods: {
    initPieChart (list) {
      // 初始化饼状图
      const pieChart = echarts.init(this.$refs.pieChart)
      pieChart.setOption({
        title: {
          text: '技术分布图',
          subtext: 'Technology Data',
          left: 'center'
        },
        tooltip: {
          trigger: 'item',
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        // 配置饼状图的选项
        series: [
          {
            type: 'pie',
            data: list,
            radius: '60%',
          },
        ],
      })
    },
    initLineChart (res) {
      this.chart = echarts.init(this.$refs.lineChart)
      this.chart.setOption({
        title: {
          text: '访问统计',
          left: 'center'
        },
        xAxis: {
          type: 'category',
          data: res.time
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            data: res.value,
            type: 'line',
          }
        ]
      }
      )
    }
  },
};
</script>

<style scoped>
</style>