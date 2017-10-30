<template>
            <div class="background">
                  <form action="" class="clearFix">
                  <div class="inform">用户名不能为空</div>
                              <h3 class="fl">注册</h3>
                              <i class="fr" title="关闭" @click='close' >&times</i>
                              <div class="input_box">
                                    <input type="text" placeholder="请输入用户名" class="user" />
                              </div>
                              <div class="input_box">
                                    <input type="text" placeholder="请填写手机号或邮箱" class="tel telandemail" id="telandemail" />
                              </div>
                              <div class="input_box span1 none" >
                                    <input type="text" placeholder="" class="tel telandemail place" />
                                    <span class="span">获取验证码</span>
                              </div>
                              <div class="input_box">
                                    <input type="password" placeholder="请输入密码" class="tel password" />
                              </div>
                              <div class="input_box">
                                    <button @click='aa'>注册</button>
                              </div>
                              <div class="input_box">
                                    <span @click='goloading'>已有账号登录</span>
                              </div>
                              <div class="input_box text">第三方账号登录：
                                    <img src="../assets/weibo.fa758eb.svg" alt="" >
                                    <img src="../assets/wechat.e0ff124.svg" alt="">
                                    <img src="../assets/github.547dd8a.svg" alt="">
                              </div>
                  </form>
            </div>
</template>
<script>

import $ from 'jquery'

      export default{
            name:'Vregister',
            data(){
                  return{
                  }
            },
            methods:{
                  close(){
                       this.$store.state.showR = false;
                  },
                  goloading(){
                        this.$store.state.showL = true;
                        this.$store.state.showR = false;
                  },
                  aa(e){
                        var user = $('.user').val();
                        var telandemail = $('.telandemail').val();
                        var password = $('.password').val();
                        if(user == ''){
                              $('.inform').css('display','block');
                              setTimeout(function(){
                                    $('.inform').css('display','none')
                              },1500)
                              e.preventDefault();
                              return;
                        }else if(telandemail == ''){
                              $('.inform').css('display','block');
                              $('.inform').text('手机或邮箱不能为空');
                              e.preventDefault();
                              setTimeout(function(){
                                    $('.inform').css('display','none')
                              },1500)
                              return;
                        }else {
                              var number = /^[0-9]*$/;
                              var phone = /^(1(3[0-9]|4[0-9]|5[0-9]|8[0-9]|7[0-9]))\d{8}$/;
                              var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                              var name = $('#telandemail').val();
                              if($('#telandemail').val() == '' || $('#telandemail').val() == null){
                                          $('.inform').css('display','block');
                                          $('.inform').text('请输入邮箱或手机');
                                          setTimeout(function(){
                                                $('.inform').css('display','none');
                                          },1500)
                                          e.preventDefault();
                                          return false;
                              }else{
                                    if(number.exec(name)){
                                          if(!phone.exec(name)){
                                                $('.inform').css('display','block');
                                                $('.inform').text('手机格式不正确');
                                                $('#telandemail').val('');
                                                      setTimeout(function(){
                                                            $('.inform').css('display','none');
                                                      },1500)
                                                e.preventDefault();
                                                return false;
                                          }
                                    }else{
                                          if(name.indexOf('@')){
                                                if(!email.exec(name)){
                                                      $('.inform').css('display','block');
                                                      $('.inform').text('手机格式不正确');
                                                      $('#telandemail').val('');
                                                            setTimeout(function(){
                                                                  $('.inform').css('display','none');
                                                            },1500)
                                                      e.preventDefault();
                                                      return false;
                                                }
                                          }
                                    }
                              }
                              if(password == ''){
                                    $('.inform').css('display','block');
                                    $('.inform').text('密码不能为空');
                                    e.preventDefault();
                                    setTimeout(function(){
                                          $('.inform').css('display','none');
                                    },1500);
                              }else{
                                    var _this = this;
                                    $.ajax({
                                          url:'http://127.0.0.1:3000/register',
                                          type:'post',
                                          data:{user:user,telandemail:telandemail,password:password},
                                          success:function(data){
                                                if(data.state){
                                                      alert(data.state);
                                                      $('.user').val('') ;
                                                      $('.telandemail').val('');
                                                      $('.password').val('');
                                                      return;

                                                }else if(data.state1){
                                                      alert(data.state1)
                                                      // console.log($('.telandemail').val())
                                                _this.$store.state.e=$('.telandemail').val();
                                                _this.$store.state.p=$('.password').val();
                                                      $('.background').css('display','none');
                                                      _this.$store.state.showL = true;
                                                      _this.$store.state.showR = false;
                                                }
                                          }
                                    })
                              }
                              e.preventDefault();
                        }
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
      form{background: #fff;width: 66%;height: 55%;margin: 0 auto;margin-top: 34%;padding: 24px;border-radius: 2px}
      i{font-style: normal;}
      input{padding: 14px;border: 1px solid #e9e9e9;width: 100%;font-size: 14px;outline: none;box-sizing: border-box;word-spacing: normal;text-shadow: none;text-indent: 0px;text-align: start;letter-spacing: normal;text-rendering: auto}
      .input_box{margin-bottom: 10px}
      button{background: #007fff;width: 100%;border: none;padding: 14px;height: 46px;color: #fff;font-size: 14px}
      .input_box span{text-align: center;display: block;font-size: 14px;color:#007fff ;padding-bottom: 20px}
      button,input{border-radius: 2px}
      .text{font-size: 12px;color:#8b9196;line-height: 23px}
      img{width: 22.8px;height: 22.8px;vertical-align: middle;margin-left: 10px;}
      .inform{background: #e6f3ff;max-width: 200px;line-height: 38px;color:#007bff;font-size: 14px ;position: absolute;top: 50px;right: 40px;padding:0 18px;border: 1px solid #b3d0ef;display: none;}
      .none{display: none}
      .span1{position: relative;}
      .span{position: absolute;right: 14px;top: 14px}
</style>