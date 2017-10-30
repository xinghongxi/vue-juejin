// 引入的所有组件,也就是我当前的路由.文件中的import Hello from '@/components/Hello'
// @代表在当前根目录下 : src

import Vue from 'vue'
import Router from 'vue-router'
import Vlog from '@/components/Vlog'
import Vmain from '@/components/Vmain'
import Vshoucangji from '@/components/Vshoucangji'
import Vzhuanlan from '@/components/Vzhuanlan'
import Vcommon from '@/components/Vcommon'


Vue.use(Router)

export default new Router({
  mode:'history',
  routes: [
    {
      path: '/',
      name: 'Vlog',
      component: Vlog
    },
    {
      path: '/main',
      name: 'Vmain',
      component: Vmain
    },
    {
      path: '/shoucangji',
      name: 'Vshoucangji',
      component: Vshoucangji
    },
    {
      path: '/zhuanlan',
      redirect:'/zhuanlan/all' //---  重定向  实际访问的是zhuanlan路由，Url中更改为/zhuanlan/all
    },
    {
      path:'/zhuanlan',
      name: 'Vzhuanlan',
      component: Vzhuanlan,
      children: [
        // {path:'',Vzhuanlan},
        {path: ':id', component: Vcommon }   //------:id  ----自由分配路径 动态路由匹配
        // {path: '/abc', component: Vabc }
        // ...其他子路由
      ],

    }

  ]
})
