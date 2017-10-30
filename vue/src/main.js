import Vue from 'vue'
import App from './App'
import router from './router'
import Vuex from 'vuex'

Vue.use(Vuex);
const store = new Vuex.Store({
      state:{
        nav:[],
        article:[],  //专栏all  从所有数据里循环筛选数据
        articles:[],  //专栏路由
        mains:[],
        collection:[],
        showR:false,
        showL:false,
        zhuce:true,
        denglu:true,
        showLIST:false,
        email_or_tel:[],
        password:[],
        id:[],  //用户id
        tagname:'首页',
        isBlue:0,
        listes:[],
        e:'',
        p:''

      },
      mutations:{
        getQianduan:function(state,id) {
          var arr = [];
          state.article.forEach((item,index)=>{
            if(id == undefined){
                arr.push(item);
                state.articles = arr;
            }else if(item.index_number == id){
                arr.push(item);
                state.articles = arr;
            }
          })
        },
        //组件中传给仓库的方法，要用这种方法修改仓库中的值（该方法是为了避免页面刷新时（首先要保留上一次浏览的路由历史）仍然显示上次浏览的路由历史）
        zhuanlan(state,name){
          state.tagname = name;
        },
        shoucangji(state,name){
          state.tagname = name;
        },
        main(state,name){
          state.tagname = name;
        },
        goshouye(state,name){
          state.tagname = name;

        }


      }
})

Vue.config.productionTip = false
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
