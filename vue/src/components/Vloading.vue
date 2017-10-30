<template>
            <div class="background">
                  <form action="" class="clearFix">
                              <div class="xiongmao">
                                    <img class="img1" src="../assets/xiongmao.png" width="120" alt="">
                                    <img class="img2" src="../assets/xiongmao2.png" width="120" alt="">
                                    <img class="img3" src="../assets/xiongmao3.png" width="100" alt="">
                              </div>
                              <h3 class="fl">登录</h3>
                              <i class="fr" title="关闭" @click='close' >&times</i>
                              <div class="input_box">
                                    <input type="text"  @click='sss' placeholder="请填写手机号或邮箱" class="tel telt" />
                              </div>
                              <div class="input_box">
                                    <input type="password" @click='ssss' placeholder="请输入密码" class="tel password" />
                              </div>
                              <div class="input_box">
                                    <button @click='loading'>登录</button>
                              </div>
                              <div class="input_box clearFix">
                                    <span class="fl">没有账号？ </span><span class="fl" @click='go_register'> 注册</span> <span class="fr">忘记密码</span>
                              </div>
                              <div class="input_box text" id="id">第三方账号登录：
                                    <img src="../assets/weibo.fa758eb.svg" alt="" >
                                    <img src="../assets/wechat.e0ff124.svg" alt="">
                                    <img src="../assets/github.547dd8a.svg" alt="">
                              </div>
                  </form>
            </div>
</template>
<script>

import $ from 'jquery'
import {setCookie,getCookie,removeCookie} from '../../src/router/cookie.js'

      export default{
            name:'Vloading',
            data(){
                  return{
                  }
            },

            mounted(){
                  $('.password').val( this.$store.state.p )
                  $('.telt').val( this.$store.state.e )
            },
            methods:{
                  close(){
                       this.$store.state.showL = false;
                  },
                  go_register(){
                       this.$store.state.showL = false;
                       this.$store.state.showR = true;
                  },
                  sss(){
                        $('.xiongmao img:first').css('display','none')
                        $('.xiongmao img:eq(2)').css('display','none')
                        $('.xiongmao img:eq(1)').css('display','block')
                  },
                  ssss(){
                        $('.xiongmao img:first').css('display','none')
                        $('.xiongmao img:eq(1)').css('display','none')
                        $('.xiongmao img:eq(2)').css('display','block')
                  },
                  loading(e){
                        var _this = this;
                        e.preventDefault();
                        var password = $('.password').val();
                        var tel = $('.telt').val();
                        $.ajax({
                              url:'http://127.0.0.1:3000/loading',
                              data:{password:password,tel:tel},
                              type:'post',
                              success:function(data){
                                    if(data.stateTRUE){
                                          alert(data.stateTRUE);
                                          setCookie('email_or_tel',data.message[0].email_or_tel)
                                          setCookie('id',data.message[0].id)
                                          _this.$store.state.email_or_tel = data.message[0].email_or_tel
                                          _this.$store.state.password = data.message[0].password
                                          _this.$store.state.id = data.message[0].id
                                          _this.$store.state.showL = false;
                                          window.location.href='/main';
                                    }else{
                                          alert(data.stateFALSE);
                                          return
                                    }
                              }
                        })
                  }
            },
            computed:{

            }
      }
</script>

<style scoped>
      .clearFix:after{ content:''; display:block; clear:both; }
      .fl{float:left}
      .fr{float:right}
      .background{background-color: rgba(0,0,0,.3);width: 100%;height: 100%;position: fixed;top: 0;z-index: 9999}
      h3{color: #333;margin-bottom: 20px }
      i{font-size: 20px;font-weight: 700px;color: #333}
      form{background: #fff;width: 66%;height: 40%;margin: 0 auto;margin-top: 40%;padding: 24px;border-radius: 2px;position: relative;}
      i{font-style: normal;}
      input{padding: 14px;border: 1px solid #e9e9e9;width: 100%;font-size: 14px;outline: none;box-sizing: border-box;word-spacing: normal;text-shadow: none;text-indent: 0px;text-align: start;letter-spacing: normal;text-rendering: auto}
      .input_box{margin-bottom: 10px}
      button{background: #007fff;width: 100%;border: none;padding: 14px;height: 46px;color: #fff;font-size: 14px}
      .input_box span{font-size: 14px;padding-bottom: 20px;color: #8b9196}
      .input_box span:nth-child(2),.input_box span:nth-child(3){ color:#007fff ;}
      button,input{border-radius: 2px}
      .text{font-size: 12px;color:#8b9196;line-height: 23px}
      .text img{width: 22.8px;height: 22.8px;vertical-align: middle;margin-left: 10px;}
      .xiongmao img{position: absolute;left: 50%;margin-left: -60px;}
      .xiongmao img:nth-child(1){top: -80px;display: block;}
      .xiongmao img:nth-child(2){top: -86px;}
      .xiongmao img:nth-child(3){top: -60px;}
      .xiongmao .block{display: block;}
      .xiongmao img{display:none;}
</style>