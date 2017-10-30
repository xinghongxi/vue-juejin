var express = require('express');
var router = express.Router();
var con = require('../model/db.js');

/* GET home page. */
router.get('/zhuanlan', function(req, res, next) {  //获取数据库中所有的列表  -----加载时获取数据
      var sql = 'SELECT * FROM menu';
      con.query(sql,function(err,results,f){

            res.send(results);
      })
});

router.get('/zhuanlan_all', function(req, res, next) {  //获取数据库中所有的列表  -----加载时获取数据
      var sql = 'SELECT * FROM article';
      con.query(sql,function(err,results,f){
            res.send(results);
      })
});

router.get('/shoucangji', function(req, res, next) {  //获取数据库中所有的列表  -----加载时获取数据
      var sql = 'SELECT * FROM `collection` ';
      con.query(sql,function(err,results,f){
            res.send(results);
      })
});

// 注册
router.post('/register',function(req, res, next){

      var username = req.body.user;
      var email_or_tel = req.body.telandemail;
      var password = req.body.password;
      var sql = `SELECT email_or_tel FROM user WHERE email_or_tel='${email_or_tel}'`;
      // 查找数据库中是否有已被注册的账号
      var sql1 = 'INSERT INTO `user`(`username`,`password`,`email_or_tel`) VALUES (?,?,?)';
      con.query(sql,function(err,results,f){
            if(err)throw err
            console.log(results)
            if(results.length != 0){
                  res.send({state:'该账号已被注册'})
            }else{
                  con.query(sql1,[username,password,email_or_tel],function(err,results,f){
                        if(err)throw err;
                        res.send({state1:'注册成功'})
                  })
            }
      })
});

// 登录
router.post('/loading',function(req, res, next){
      var tel = req.body.tel;
      var password = req.body.password;
      con.query('select email_or_tel,password,id from user where email_or_tel=? and password=?',[tel,password],function(err,results,f){
            // 若表内未查找到传递过来的参数则 结果长度 = 0
            if(err)throw err;
            if(results.length != 0){
                  res.send({stateTRUE:'登录成功',message:results})
            }else{
                  res.send({stateFALSE:'账号或密码不正确'})
            }

      })
});

router.post('/guanzhu',function(req, res, next){
      var people = req.body.people;
      var sql = 'SELECT * FROM `collection` ';
      con.query(sql,function(err,results,f){
            res.send(results);
      })
});











//添加【收藏】评论，点赞
router.post('/insert',function(req,res,next){
      var uId = req.body.user_id;
      var cId = req.body.collection_ID;
      var aId = req.body.aid;
      var type = req.body.type;
      var ispraise = req.body.ispraise;
      // if(aId != '' && aId != undefined){
      //       connect.query('select id from user_collection uc where uc.user_ID=? and uc.class="C" and  uc.article_ID=?',[uId,aId],function(error,results,f){
      //             if(results.length !=0){
      //                   connect.query('update user_collection set isno=? where article_ID=? and class=? and user_ID=?',[ispraise,aId,type,uId],function(error,results,f){
      //                         if(error)throw error;
      //                         res.send({message:'ok'});
      //                   })
      //             }else{
      //                   connect.query('insert into user_collection (user_ID,article_ID,class,isno) value (?,?,?,?)',[uId,aId,type,ispraise],function(error,results,f){
      //                         if(error)throw error;
      //                         res.send({message:'ok'});
      //                   })
      //             }
      //       })
      // }else{
            con.query('select id from user_collection uc where uc.user_ID=? and uc.class="A" and uc.collection_ID=?',[uId,cId],function(error,results,f){
                  if(results.length != 0){
                        con.query(`update user_collection set isno=? where collection_ID=? and class=? and user_ID=?`,[ispraise,cId,type,uId],function(error,results,f){
                              if(error)throw error;
                              res.send({message:'ok'});
                        })
                  }else{
                        con.query('insert into user_collection (user_ID,collection_ID,class,isno) values (?,?,?,?)',[uId,cId,type,ispraise],function(error,results,f){
                              if(error)throw error;
                              res.send({message:'ok'});
                        })
                  }
            })
      // }
})




//get所有收藏集的文章
router.get('/selectAll',function(req,res,next){
      con.query('SELECT c.id, c.title,  u.username,c.img_src, ( SELECT COUNT(uc.id) FROM user_collection AS uc WHERE uc.collection_ID = c.id AND uc.class = "A" AND uc.isno = 1 ) AS COUNT, ( SELECT GROUP_CONCAT(uc.user_ID SEPARATOR ";") FROM user_collection uc WHERE uc.collection_ID = c.id AND uc.isno = 1 ) AS userid FROM collection AS c LEFT JOIN user u ON u.id = c.user_ID',function(error,results,f){
            if(error)throw error;
            res.send(results);
      })
})





//查询所有 article
// router.post('/selectAll',function(req,res,next){
//       if(req.body.mid == 0){
//             connect.query('select a.m_id,u.username,u.img_src uImg,a.id,a.a_src,a.title,a.text,a.img_src aImg,a.time,(select count(uc.id) from usercollection_tb uc where uc.a_id=a.id and uc.type ="C" and uc.is_praise=1) as praise,(select count(uc.id) from usercollection_tb uc where uc.a_id=a.id and uc.type="B" and uc.is_praise=1) as comments,(select GROUP_CONCAT(uc.u_id separator ";") from usercollection_tb uc where uc.a_id=a.id and uc.is_praise=1 and uc.type="C") as userid from article_tb a,users_tb u where a.u_id = u.id order by a.time desc',function(error,results,f){
//                   if(error)throw error;
//                   res.send(results);
//             })
//       }else{
//             connect.query(`select a.m_id,u.username,u.img_src uImg,a.id,a.a_src,a.title,a.text,a.img_src aImg,a.time,(select count(uc.id) from usercollection_tb uc where uc.a_id=a.id and uc.type="C" and uc.is_praise=1) as praise,(select count(uc.id) from usercollection_tb uc where uc.a_id=a.id and uc.type="B" and uc.is_praise=1) as comments,(select GROUP_CONCAT(uc.u_id separator ';') from usercollection_tb uc where uc.a_id=a.id and uc.is_praise=1 and uc.type="C") as userid from article_tb a inner join users_tb u on a.u_id=u.id inner join menu_tb m on a.m_id=m.id where m.id=${req.body.mid} order by a.time desc`,function(error,results,f){
//                   if(error)throw error;
//                   res.send(results);
//             })
//       }
// })






module.exports = router;

