<template>
      <div class="all1">
            <nav>
                  <ul class="nav clearFix">
                        <li  class="fl color1">编辑推荐</li>
                        <li  class="fl">全部</li>
                  </ul>
            </nav>
            <section >
                  <ul class="head clearFix">
                        <ol class="fl color1">热门<span>|</span></ol>
                        <ol class="fl">最新</ol>
                  </ul>
            </section>

            <ul class="for">
                  <li class="content" v-for='(collection,index) in getCollection'>
                      <div class="img">
                          <img :src='collection.img_src' height="159" width="354" alt="">
                          <div class="cover">
                            <div class="fff">
                                <h3>{{collection.title}}</h3>
                                <span>{{collection.username}} </span> · <span>29 篇文章 </span>· <span>{{collection.COUNT}} 人关注</span>
                                <button class="button" :class="{'changeColor':collection.userid == 1}">
                                  <span v-if="collection.userid==0">关注</span>
                                  <span v-else>已关注</span>
                                </button>
                            </div>
                          </div>
                      </div>
                  </li>

            </ul>
      </div>
</template>

<script>
import $ from 'jquery'

export default {
  name: 'Vshoucangji',
  data () {
    return {
          isOK:true
    }
  },
  mounted(){
    //页面加载时要获取收藏集数据
      this.init()
  },
  methods:{
    init(){
          var _this = this
          $.ajax({
                url:'http://127.0.0.1:3000/selectAll',
                type:'get',
                success:function(data){
                      for(var i=0;i<data.length;i++){
                          if(data[i].userid != null){
                              var userId = data[i].userid.split(';');
                                  for(var j=0;j<userId.length;j++){
                                        if(userId[j] == _this.$store.state.id){
                                              data[i].userid=1;
                                        }else{
                                              data[i].userid=0;
                                        }
                                  }
                          }else{
                              data[i].userid=0;
                          }
                          _this.$store.state.collection = data;
                      }
                },

                error:function(error){
                      console.log(error)
                }
          })
    },
  },
  computed:{
        getCollection(){
            return this.$store.state.collection
        }
  },
  created(){
    this.$store.commit('shoucangji','收藏集')
  }
}
</script>

<style scoped>
      .clearFix:after{ content:''; display:block; clear:both; }
      nav{height: 46px;background: #fff;margin-top: 1px;margin-bottom: 20px;}
      .nav{position: fixed;z-index: 99;width: 100%;background: #fff;box-shadow: 0 1px 2px 0 rgba(0,0,0,.05)}
      .fl{float: left;}
      li{list-style: none;}
      .nav li{list-style: none;line-height: 46px;padding: 0 16px;}
      ol{line-height: 46px}
      span{padding: 0 10px;color: hsla(0,0%,59%,.2)}
      *{margin: 0;padding: 0;font-size: 14px;color: #909090}
      .head{height: 46px;background: #fff;border-bottom: 1px solid hsla(0,0%,59%,.2);padding-left: 28px}
      .content{background: #fff;border-top: none;padding: 18px 24px 4px 24px}
      .color{color:#b71ed7;font-weight: 700}
      .color1{color:#007fff;}
      .black{color: #000;font-size: 16px;padding-left: 26px}
      h4{color: #000;margin-top: 6px;margin-bottom: 12px}
      .all1{margin-top: 60px}
      .for{background: #fff;padding-top: 14px;}
      .content img{border-radius: 2px;width: 100%}
      .content .img{background: url(../../static/img/bg1.jpg) no-repeat;background-size: cover;height: 159px;/*width: 354px;*/ width: 98%;margin:0 auto;border-radius: 2px;position: relative;}
      .cover{/*width: 354px;*/width: 100%;height: 159px;background-image: linear-gradient(hsla(0,0%,56%,.3),rgba(70,70,70,.6));border-radius: 2px;position: absolute;left: 0;top: 0;}
      .fff{/*width: 320px;*/width: 90%;height: 130px;margin:0 auto;margin-top: 14px;}
      .fff h3,.fff span,.cover .fff,button{ color: #fff;}
      .fff h3{padding-top: 70px;padding-bottom: 14px;font-size: 18px;}
      .fff span,.cover .fff,button{font-size: 12px;padding: 0}
      button{border:1px solid #fff;background: none;width: 56px;position: absolute;right: 20px;bottom: 18px;padding: 3px 0}
      .changeColor{background: rgba(0,0,0,0.2);}
      .fff span:nth-child(2){display: inline-block;max-width: 70px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;vertical-align: bottom;}
</style>

