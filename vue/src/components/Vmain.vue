<template>
      <div>
            <nav>
                  <ul class="nav clearFix">
                        <li class="fl color1">我关注的</li>
                        <li class="fl">前端</li>
                  </ul>
            </nav>
            <section>
                  <ul class="head clearFix">
                        <ol class="fl color1">热门<span>|</span></ol>
                        <ol class="fl">最新<span>|</span></ol>
                        <ol class="fl">评论</ol>
                  </ul>
            </section>
            <ul class="for">
                  <li class="content" v-for='(main,index) in getMain'>
                        <ul class="ul clearFix">
                              <li class="fl color">专栏</li>
                              <li class="fl">·</li>
                              <li class="fl">凹凸卿</li>
                              <li class="fl">·</li>
                              <li class="fl">3小时前</li>
                              <li class="fl">·</li>
                              <li class="fl">HTML/前端</li>
                        </ul>
                        <h4>{{main.title}}</h4>
                        <table>
                              <tr>
                                    <td><a href=""><img src="../assets/like.svg" alt="" >12</a></td>
                                    <td><a href=""><img src="../assets/comment.svg" alt="" ></a></td>
                              </tr>
                        </table>
                  </li>
            </ul>
      </div>
</template>

<script>
import $ from 'jquery'

export default {
      name: 'Vmain',
      data(){
            return {
            }
      },
      mounted(){
            var _this = this
            $.ajax({
                  url:'http://127.0.0.1:3000/zhuanlan_all',
                  type:'get',
                  success:function(data){
                       _this.$store.state.mains = data;
                  }
            })
      },
      computed:{
            getMain(){
                  return this.$store.state.mains
            }
      },
      created(){
              this.$store.commit('main','首页')
      }

}
</script>

<style scoped>
      .clearFix:after{ content:''; display:block; clear:both; }
      nav{height: 46px;background: #fff;margin-top: 1px;margin-bottom: 20px}
      .fl{float: left;}
      li{list-style: none;}
      .nav li{list-style: none;line-height: 46px;padding: 0 16px;}
      ol{line-height: 46px}
      span{padding: 0 18px;color: hsla(0,0%,59%,.2)}
      ol:nth-child(1){color:#007fff;padding-left: 26px}
      *{margin: 0;padding: 0;font-size: 14px;color: #909090}
      .head{height: 46px;background: #fff;width: 100%;border-bottom: 1px solid hsla(0,0%,59%,.2)}
      .content{background: #fff;border: 1px solid hsla(0,0%,59%,.2);border-top: none;padding: 18px 24px}
      .content li{font-size: 12px;margin: 0 2px}
      .color{color:#b71ed7;font-weight: 700}
      .color1{color:#007fff;}
      h4{color: #000;margin-top: 6px;margin-bottom: 12px}
      table{border: 1px solid hsla(0,0%,59%,.2);border-collapse:collapse; }
      td{border: 1px solid hsla(0,0%,59%,.2);font-size: 12px;line-height: 18px;text-align: center;}
      td img{vertical-align: middle;}
      td a{text-decoration: none;font-size: 12px;padding:0 10px;}
      div{margin-top: 60px}
</style>
