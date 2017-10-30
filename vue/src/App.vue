<!--导航部分 -->
<template>
  <div>
  <!-- 登录 窗口   注册窗口 -->
    <Vregister class='Vregister'  v-if='this.$store.state.showR'></Vregister>
    <Vloading class='Vloading'  v-if='this.$store.state.showL' ></Vloading>
    <div class="all clearFix fix">
      <div class="img fl">
        <router-link  :to='lists[0].url' @click.native="goshouye"><img src="./assets/logo.svg" alt="掘金"></router-link>
      </div>
<!--首页-->
      <ul class="fr aa clearFix">
        <li class="clearFix fl clickblock"   @click='shouye' >
          <div>
            <div class="fl home_page">{{tagNames}}</div>
            <a class="li2 fl">
                <div class="li2_1"></div>
            </a>
          </div>
<!--扩展菜单 -->
          <div class="lists owns" >
              <div v-for='(list,index) in listLi' class="list" >
              <router-link :to='list.url' style='width: 96px;height: 50px;display: block;'>{{list.title}}</router-link>
              </div>
          </div>
        </li>
        <!--个人中心 -->
        <li class="fr touxiang" @click='own' v-if="this.$store.state.id != '' ">
            <img src="./assets/touxiang.svg" alt="" width="30" class="touxiang_img">
            <div class="owns2">
                <div v-for='(own,i) in owns' class="height clearFix" @click='goout(i)'>
                  <img :src='own.img' alt="" width="18" class="fl">
                  <router-link :to='own.url' class="fl text_my">{{own.title}}</router-link>
                </div>
            </div>
        </li>
         <!--登录 注册 -->
        <li class="denglu_zhuce" v-else>
          <ol>
            <li class="fr log" @click='register' v-if='this.$store.state.zhuce'>&nbsp注册</li>
            <li class="fr denglu" @click='loading' v-if='this.$store.state.denglu'>登录 · </li>
          </ol>
        </li>

        <li class="fr icon"><img src="./assets/屏幕快照 2017-07-30 下午4.23.32.png" width="18" alt="" ></li>
      </ul>
        </div>
        <router-view></router-view>
  </div>
</template>

<script>
import axios from 'axios'
import Vuex from 'vuex'
import Vregister from './components/Vregister.vue'
import Vloading from './components/Vloading.vue'
import $ from 'jquery'
import {setCookie,getCookie,removeCookie} from './router/cookie.js'

export default {
  name: 'app',
  data(){
    return{
  isBlue:0,
  beOK:true,
      lists:[
        {url:'/',title:'首页'},
        {url:'/main',title:'首页'},
        {url:'/zhuanlan',title:'专栏'},
        {url:'/shoucangji',title:'收藏集'},
        {url:'/faxian',title:'发现'},
      ],
      owns:[
        {url:'',title:'我的主页',img:'../static/img/wodezhuye.png'},
        {url:'',title:'我喜欢的',img:'../static/img/woxihuande.png'},
        {url:'',title:'我的收藏集',img:'../static/img/wodeshoucangji.png'},
        {url:'',title:'标签管理',img:'../static/img/biaoqianguanli.png'},
        {url:'',title:'设置',img:'../static/img/shezhi.png'},
        {url:'',title:'关于',img:'../static/img/guanyu.png'},
        {url:'',title:'登出',img:'../static/img/dengchu.png'}
      ]
    }
  },
  created(){
          var _this = this;
          setTimeout(function(){
              for(var i=0;i<_this.$store.state.listes.length;i++){
                for(var j=0;j<_this.$store.state.nav.length;j++){
                  if(_this.$route.path == _this.$store.state.listes[i].url){ //循环大路由
                      //判断如果我当前大路由 和 我第几个大路由路径相同，就给菜单title赋值
                      _this.$store.state.tagname = _this.$store.state.listes[i].title;
                  }else if(_this.$route.path == '/zhuanlan/all'){//判断小路由，如果我进入了专栏菜单all中
                      _this.$store.state.tagname = _this.$store.state.listes[1].title;
                      _this.$store.state.isBlue = 0;
                                _this.$store.commit('getQianduan');  //把方法给仓库
                  }else if(_this.$route.path == _this.$store.state.nav[j].url){
                      _this.$store.state.tagname = _this.$store.state.listes[1].title;
                      _this.$store.commit('getQianduan',j);  //把方法给仓库
                      _this.$store.state.isBlue = _this.$store.state.nav[j].id;
                  }
                }
              }
          },10);

},
  mounted(){
      var _this=this;
     if(getCookie('email_or_tel')){
          this.$store.state.email_or_tel = getCookie('email_or_tel')
          this.$store.state.password = getCookie('password')
          this.$store.state.id = getCookie('id')

    };

    $.ajax({
        url:'http://127.0.0.1:3000/zhuanlan',
        type:'get',
        success:function(data){
              _this.$store.state.nav=data;
        }
    });

//判断用户登录后 要替换首页路由，如果我拿到用户信息了(不要判断cookie，因为cookie只能在刷新时判断)
    for(var i=0;i<_this.lists.length;i++){
            if(_this.$store.state.id == ''){
                _this.$store.state.listes = _this.lists;
                _this.$store.state.listes.splice(1,1);
                return
            }else{
                _this.$store.state.listes = _this.lists;
                _this.$store.state.listes.splice(0,1);
                return
            }
          };
  },

  methods:{

    register(){
      this.$store.state.showR = true;
    },
    loading(){
      this.$store.state.showL = true;
    },
    own(){
      if(this.beOK){
          $('.owns2').css('display','block')
      }else{
          $('.owns2').css('display','none')
      }
      this.beOK = !this.beOK
    },
    goout(i){  //用户登出
        if(i === 6){
              removeCookie('email_or_tel')
              removeCookie('password')
              removeCookie('id')
              this.$store.state.email_or_tel = [];
              this.$store.state.password = [];
              this.$store.state.id = [];
              window.location.href = '/'  //清除完Cookie 刷新回到当前路由
        }
    },
    shouye(e){
          e.stopPropagation()
          if(isKAI){
                      $('.lists').css('display','block')
                }else{
                      $('.lists').css('display','none')
                };
                isKAI = !isKAI;
    },
    goshouye(){
      this.$store.commit('goshouye','首页')
      $('.home_page').html('首页')
    }
  },
  computed:{
    tagNames:function(){
      return this.$store.state.tagname
    },
    listLi:function(){
      return this.$store.state.listes

    }
  },
  components:{
      Vregister,
      Vloading
  }
}

var isKAI = true;
$(function (){
        $('.list').click(function(){
                $('.home_page').html( $(this).text() )
        });
        $(document).bind('click',function(e){   //----------？点击lists以外的地方让lists消失
                var e = e || window.event; //事件对象的状态 考虑浏览器兼容性 W3C DOM 和IE DOM
                var elem = e.target || e.srcElement; //发生点击事件的元素
                while (elem) { //循环判断至跟节点，防止点击的是div子元素
                        if (elem.class && elem.class=='lists') {
                              return;
                        }
                        elem = elem.parentNode;
                }
                isKAI = true;
                $('.lists').css('display','none');
        });
});




</script>
<style scoped>
  .clearFix:after{ content:''; display:block; clear:both; }
  .fl{float: left}
  .fr{float: right}
  .all{height: 60px;line-height: 60px;background: #fff;border-bottom: 1px solid #f1f1f1;width: 100%;}
  li{list-style: none;color: #007fff}
  .img{margin: 0 22px 0 8px;}
  .img img,.icon img,.touxiang_img{margin-top: 10px}
  .li2{padding: 27px 10px 21px 7px}
  .li2_1{line-height: 1vh;border-width: 6px;border-color:#007fff transparent transparent  transparent;border-style: dashed dashed solid dashed;}
  a{text-decoration: none;color: #71777c;}
  .lists{border:1px solid hsla(217,5%,71%,.45);position: absolute;top: 60px;background: #fff;left: 126px;border-radius: 4px;box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);}
  .owns{border:1px solid hsla(217,5%,71%,.45);position: absolute;top: 60px;background: #fff;box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);border-radius: 4px;}
  .owns2{border:1px solid hsla(217,5%,71%,.45);position: absolute;top: 60px;background: #fff;box-shadow: 0 1px 2px 0 rgba(0,0,0,.1);border-radius: 4px;right: 10px}
  .list{text-align: center;line-height: 50px;}
  .owns2 .height img{margin-top: 10px;margin-right: 10px}
  .icon{display: none;margin-top: 6px;margin-right: 30px}
  .log,.touxiang{margin-right:10px;cursor: pointer;}
  .touxiang .touxiang_img{border-radius: 50%;vertical-align: middle;margin-bottom: 12px;}
  .fix{position: fixed;top: -1px;z-index: 999}
  .aa{width: 60%}
  .height{height: 40px;padding: 0 10px;line-height: 40px;}
  .text_my{padding-right: 28px}
  .owns{display: none;}
  .owns2{display: none;}
</style>

