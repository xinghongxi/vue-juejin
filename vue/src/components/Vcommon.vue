<template>
      <div>
            <ul>
                  <li v-for='(article,i) in getArticle'>
                        <div class="one">
                              <img class="img1" src='../assets/1.jpg' height="30"  alt="" />
                              <span class="span">LucasHC · </span>
                              <span>{{article.time}}</span>
                        </div>
                        <div class="over" v-if='article.img'>
                              <img class="img2" :src='article.img' width="354"  alt="" />
                        </div>
                        <h3>{{article.title}}</h3>
                        <p>{{article.text}}</p>
                        <table class="fl" @click='cs'>
                              <tr >
                                    <td><a href=""><img src="../assets/like.svg" alt="" width="16">22</a></td>
                                    <td><a href=""><img src="../assets/comment.svg" alt="" width="16">1</a></td>
                              </tr>
                        </table>
                        <table class="fl table2" @click='cs'>
                              <tr>
                                    <td><a href="" ><img src="../assets/collection.svg" alt="" width="16">收藏</a></td>
                              </tr>
                        </table>
                        <span class="fr dep" @click='dep(i)'>阅读全文</span>
                  </li>

            </ul>
      </div>
</template>
<script>

import $ from 'jquery'

      export default{
            data(){
                  return {
                        isOK:true
                  }
            },
            mounted(){
                  var _this = this;
                  $.ajax({
                        url:'http://127.0.0.1:3000/zhuanlan_all',
                        type:'get',
                        success:function(data){
                              for(var i=0;i<data.length; i++){
                                    data[i].time = (data[i].time.substring(0,10) + ' ' + data[i].time.substring(11,19)).replace(/(\d{4}).(\d{1,2}).(\d{1,2})./g,'$1年$2月$3日 ');;
                              }
                              _this.$store.state.article = data;
                              _this.$store.state.articles = data;
                        }
                  })
            },
            methods:{
                  dep(i){
                        if (this.isOK) {
                              $('p:eq('+i+')').css('max-height','150px');
                              $('.dep:eq('+i+')').html('收起')

                        }else{
                              $('p').css('max-height','');
                              $('.dep:eq('+i+')').html('阅读全文')
                        }
                              this.isOK = !this.isOK;
                  },
                  cs(e){
                        e.preventDefault();
                  }
            },
            computed:{
                  getArticle(){
                        return this.$store.state.articles
                  }
            }
      };
</script>

<style scoped>
      .fl{float: left;}
      .fr{float: right;}
      .img1{border-radius: 50%;vertical-align: middle;}
      .span{margin-left: 10px}
      li{list-style: none;margin-top: 22px;width:354px;margin: 0 auto;text-overflow: clip;padding-bottom: 70px;border-bottom: 1px solid hsla(0,0%,59%,.1);}
      *{margin: 0 ;padding: 0}
      ul{background: #fff}
      .one{line-height: 60px}
      h3{color: #000;font-size: 24px;padding-bottom: 10px}
      p{font-size: 16px;max-height: 24px;overflow: hidden;}
      table{border-collapse:collapse; line-height: 22px;margin-top: 14px;}
      td{border: 1px solid hsla(0,0%,59%,.2);font-size: 12px;text-align: center;}
      td img{margin-right: 6px;vertical-align: middle;margin-bottom:2px }
      td a{text-decoration: none;font-size: 12px;padding:0 10px;color:  rgba(24,37,50,.3)}
      .table2{margin-left: 10px}
      .dep{color:  rgba(24,37,50,.3);font-size: 12px;margin-top: 14px;}
      .over{width: 354px;height: 118px ;overflow: hidden;margin-bottom: 20px;border-radius: 3px;}
</style>