<template>
  <div>
      <div class="box">
            <h3>掘金 · 一个帮助开发者成长的社区，立即加入：</h3>
            <ul class="ul">
                  <li>
                    <a href="https://api.weibo.com/oauth2/authorize?client_id=162709412&response_type=code&redirect_uri=https%3a%2f%2fgold.xitu.io%2foauth%2flogin&state=weibo">
                      <button class="li1"><img src="../assets/weibo.svg" alt="">使用微博登录</button>
                    </a>
                  </li>
                  <li>
                    <a href="https://open.weixin.qq.com/connect/qrconnect?appid=wx1f78f78832fc2c16&redirect_uri=https%3a%2f%2fgold.xitu.io%2foauth%2flogin&response_type=code&scope=snsapi_login&state=wechat#wechat_redirect">
                      <button class="li2"><img src="../assets/wechat.svg" alt="">使用微信登录</button>
                    </a>
                  </li>
                  <li>
                    <a href="https://github.com/login/oauth/authorize?client_id=b9c43dc2e807f3b31c38&state=github&redirect_uri=http%3a%2f%2fgold.xitu.io%2foauth%2flogin">
                      <button class="li3"><img src="../assets/github.svg" alt="">使用GitHub登录</button>
                    </a>
                  </li>
                  <li @click='go_register'><button class="li4">邮箱 / 手机注册</button></li>
            </ul>
            <p>这些大厂的工程师也在用掘金</p>
            <a href="" class="a1"><img src="../assets/user-company.png" width="170" alt=""></a>
      </div>

      <div class="box1">
            <h3 class="h3">关注这些标签下的优质文章</h3>
            <ul class="ul1 clearFix">
                <ol class="fl" v-for='(item,index) in items'  >
                  <a :href='item.url' @click='bg(index)' :class='{colors:isGreen===index}'>
                    <span :class='{colors:isGreen===index}'>+ </span>{{item.title}}
                  </a>
                </ol>
            </ul>
      </div>
  </div>


</template>

<script>
export default {
  name: 'Vlog',
  data () {
    return {
      isGreen:100,
      items:[
        {url:'https://juejin.im/tag/GitHub',title:'GitHub'},
        {url:'https://juejin.im/tag/%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F',title:'设计模式'},
        {url:'https://juejin.im/tag/Vue.js',title:'Vue.js'},
        {url:'https://juejin.im/tag/Docker',title:'Docker'},
        {url:'https://juejin.im/tag/Webpack',title:'Webpack'},
        {url:'https://juejin.im/tag/JavaScript',title:'JavaScript'},
        {url:'https://juejin.im/tag/RxJava',title:'RxJava'},
        {url:'https://juejin.im/tag/APP',title:'APP'},
        {url:'https://juejin.im/tag/%E5%BC%80%E6%BA%90',title:'开源'},
        {url:'https://juejin.im/tag/%E9%9D%A2%E8%AF%95',title:'面试'},
        {url:'https://juejin.im/tag/%E7%A8%8B%E5%BA%8F%E5%91%98',title:'程序员'},
        {url:'https://juejin.im/tag/%E7%AE%97%E6%B3%95',title:'算法'},
        {url:'https://juejin.im/tag/%E4%BB%A3%E7%A0%81%E8%A7%84%E8%8C%83',title:'代码规范'},
        {url:'https://juejin.im/tag/Kotlin',title:'Kotlin'},
      ]
    }
  },
  methods:{
    bg(index){
      this.isGreen=index
    },
    go_register(){
      this.$store.state.showR = true;
    }
  }
}
</script>

<style scoped>
      .clearFix:after{ content:''; display:block; clear:both; }
      .box{width: 92%;background: #fff;margin: 0 auto;box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);margin-top: 74px}
      h3{color: #333;font-size: 14px;padding: 16px}
      .ul{margin-left: 20%}
      .fl{float: left;}
      button{font-size: 14px;border: none;color: #fff;border-radius: 3px;padding:12px 20px 12px 20px;width: 80%;text-align: left;}
      .li1{background: #d21a1a}
      .li2{background: #37c700}
      .li3{background: #4c4c4c}
      .li4{color: #007fff;background: #fff;box-shadow: inset 0 -0.2rem 0 0 rgba(0,0,0,.05);border: 1px solid #eaeaea;text-align: center;}
      *{margin: 0;padding: 0}
      li{list-style: none;margin-bottom: 6px;width: 100%;}
      button img{vertical-align: middle;margin-right: 10px;}
      p{text-align: center;color: #909090;font-size: 12px;padding-top: 20px;padding-bottom: 10px}
      .a1 img{margin: 0 auto;display: block;padding-bottom: 20px}
      .h3{font-size: 12px;font-weight: 400;border-bottom: 1px solid #f1f1f1}
      ol{font-size: 12px;width:50%;}
      .box1{width: 92%;background: #fff;margin: 0 auto;margin-top: 18px;box-shadow: 0 1px 2px 0 rgba(0,0,0,.05)}
      .box1 a{text-decoration: none;color: #454645;background: #f4f6f3;border-radius: 16px;padding: 4px 8px}
      .ul1{margin-left: 16px;margin-top: 16px;padding-bottom: 16px;margin-bottom: 180px}
      span{color: #37c700}
      ol{margin-bottom: 20px}
      .colors{background: #37c700 !important ; color: #fff !important}
</style>
