var mysql = require('mysql');   //我要想拿我数据库中的数据 必须先引入数据库模块工具

var con = mysql.createConnection({  //首先要创建链接
      host:'localhost',
      user:'root',
      password:'root',
      port:'8889',
      database:'vue-jj'   //数据库名字
})



module.exports = con;