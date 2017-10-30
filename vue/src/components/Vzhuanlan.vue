<template>
      <div>
            <nav>
                  <ul class="nav">
                      <Vzhuanlannav v-for='(nav,index) in getNav' :nav='nav' :class='{blue1:isBlues===index}' @click.native='color(index)' class='id'>
                      </Vzhuanlannav>
                  </ul>
            </nav>
            <section>
                  <ul class="head clearFix">
                        <ol class="fl black">原创文章</ol>
                        <ol class="fr con">
                              <ul class="clearFix con">
                                    <ol class="fl color1">热门<span>|</span></ol>
                                    <ol class="fl">最新<span>|</span></ol>
                                    <ol class="fl">评论</ol>
                              </ul>
                        </ol>
                  </ul>
            </section>
            <router-view></router-view>
      </div>
</template>
<script>

import $ from 'jquery'
import Vzhuanlannav from './Vzhuanlannav.vue'

export default {
  name: 'Vzhuanlan',
  data () {
    return {
    }
  },
  methods:{
      color(index){
        this.$store.state.isBlue=index;
        if(index === 0){
          this.$store.commit('getQianduan');
        }else{
          this.$store.commit('getQianduan',index);
        }
      }
  },
  components:{
      Vzhuanlannav
  },
  computed:{
      getNav(){
        return this.$store.state.nav
      },
      isBlues(){
        return this.$store.state.isBlue
      }
  },
  created(){
    this.$store.commit('zhuanlan','专栏')
  }
}
</script>

<style scoped>
      .clearFix:after{ content:''; display:block; clear:both; }
      nav{height: 46px;background: #fff;margin-top: 60px;margin-bottom: 20px;width: 100%;position: fixed;}
      .nav{background: #fff;box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);width: auto;align-items: center; display: flex;overflow-x:scroll;overflow-y:hidden;height: 100%;}
      .fl{float: left;}
      .fr{float: right;}
      li{list-style: none;flex-shrink: 0;}
      .nav li{list-style: none;line-height: 46px;padding: 0 16px;}
      ol{line-height: 46px}
      span{padding: 0 10px;color: hsla(0,0%,59%,.2)}
      *{margin: 0;padding: 0;font-size: 14px;color: #909090}
      .head{height: 46px;background: #fff;border-bottom: 1px solid hsla(0,0%,59%,.2);width: 100%;}
      .color{color:#b71ed7;font-weight: 700}
      .color1{color:#007fff;}
      .black{color: #000;font-size: 16px;padding-left: 26px}
      .con{padding-right: 10px}
      section{margin-bottom: 80px}
</style>
