<template>
            <li>
            <router-link   class='id_url' :to='nav.url' >
                  {{nav.menu}}
            </router-link>
            </li>
</template>
<script>

import $ from 'jquery'

      export default{
            name:'Vzhuanlannav',
            data(){
                  return{

                  }
            },
            props:{
                  nav:Object
            },
            methods:{

            },
            computed:{

            },
      }
</script>

<style scoped>
      li{list-style: none;}
      *{margin: 0;padding: 0;font-size: 14px;color: #909090}
      .color{color:#b71ed7;font-weight: 700}
      a{text-decoration: none;}
      .blue1 a{color: #007fff}
</style>