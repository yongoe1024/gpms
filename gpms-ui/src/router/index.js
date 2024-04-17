import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'

import initMenu from '@/utils/menus'

Vue.use(Router)

const routes = [
  {
    path: '/login',
    name: '登录',
    component: () => import('@/views/Login2')
  },
  {
    path: '/register',
    name: '注册账号',
    component: () => import('@/views/user/Register2')
  },
  {
    path: '/forget',
    name: '找回密码',
    component: () => import('@/views/user/Forget2'),
  },
  {
    path: '/oauth/qq',
    name: 'QQ',
    component: () => import('@/views/oauth/QQ'),
  },
  {
    path: '',
    name: '',
    component: () => import('@/views/Index'),
    children: [
      {
        path: '/home',
        name: '首页',
        component: () => import('@/views/Home'),
      },
      {
        path: '/userinfo',
        name: '用户信息',
        component: () => import('@/views/user/UserInfo'),
      },
      {
        path: '/password',
        name: '修改密码',
        component: () => import('@/views/user/Password'),
      },
      {
        path: '/letter',
        name: '信件',
        component: () => import('@/views/letter/Letter'),
      },
      {
        path: '/letter-info',
        name: '信件详情',
        component: () => import('@/views/letter/LetterInfo'),
      },
      {
        path: '/test',
        name: '测试',
        component: () => import('@/views/Test'),
      },
    ]
  },
]

const router = new Router({
  // mode: 'history',
  mode: 'hash',
  scrollBehavior: () => ({ y: 0 }),
  routes: routes
})
// 路由前置守卫
router.beforeEach((to, from, next) => {
  // startLoading()
  if (window.localStorage.getItem('token')) {
    if (to.path == '/login' || to.path == '/') {
      next('/home')
    } else {
      next()
    }
  }
  else {
    let arr = ['/login*', '/forget', '/register', '/oauth/*']
    for (let i = 0; i < arr.length; i++) {
      if (matchAntPath(arr[i], to.path)) {
        next()
        return
      }
    }
    if (to.path == '/login')
      next('/login')
    else
      next('/login?redirect=' + to.path)
  }
})
router.afterEach((to, from) => {
  // endLoading()
})

function matchAntPath (pattern, path) {
  // 将通配符转换为正则表达式
  const regexPattern = pattern
    .replace(/\*/g, '[^/]*') // 将单个星号转换为匹配任何非斜杠字符的序列
    .replace(/\*\*/g, '.*')  // 将双星号转换为匹配任何字符的序列

  const regex = new RegExp(`^${regexPattern}$`)
  return regex.test(path)
}

// 防止连续点击多次路由报错
let routerPush = Router.prototype.push
let routerReplace = Router.prototype.replace
// push
Router.prototype.push = function push (location) {
  return routerPush.call(this, location).catch(err => err)
}
// replace
Router.prototype.replace = function push (location) {
  return routerReplace.call(this, location).catch(err => err)
}

export default router