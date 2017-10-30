# 产品部分截图


### 首页加载

<img src="https://github.com/xinghongxi/vue-juejin/blob/master/vue/screen%20capture/home.png" width="365" height="619"/> <img src="https://github.com/xinghongxi/vue-juejin/blob/master/vue/screen%20capture/home.gif" height="619"/>


### 登录|注册

<img src="https://github.com/xinghongxi/vue-juejin/blob/master/vue/screen%20capture/login.png"  height="619"/> <img src="https://github.com/xinghongxi/vue-juejin/blob/master/vue/screen%20capture/login.gif" width="365" height="619"/>


# 掘金网移动端项目设计文档

项目名称：掘金网（移动端）应用的基础功能实现

---

## 项目设计目标
参考 **掘金网 移动端 页面结构及功能**。

1.用户打开网页调整到移动端视口，首页实现登录\注册功能，及其他方式登录跳转页面。

    说明：
    1 首页为（未登录状态）内容 ，即注册登录页面。
    2 点击右上角注册及登录按钮，弹出对应窗口。
    3 实现注册及登录窗口与首页之间业务逻辑。
    4 输入用户信息判断符合条件后页面跳转到已登录状态页面并自动登录。
    5 表单验证按需提示。
    6 点击logo刷新原首页。

2.点击右上角`登录`按钮，弹出登录窗口，输入信息并登录。

    说明：
    1 登录输入用户名和手机号、邮箱和密码需到数据库中进行查找，若有记录该条数据，则登录并访问首页。
    2 若无记录该条数据，根据数据库的信息选择性提示用户邮箱不存在 或 密码错误。
    3 若输入信息格式错误，提示邮箱或手机格式错误。
    4 以上三条无误时，用户注册成功，自动登录页面，访问首页。
    5 点击关闭按钮，关闭该注册窗口。
    6 点击注册按钮，直接关闭当前注册窗口，显示登录窗口。

3.**用户登录成功**，用户可点击右上角头像查看关于用户的所有数据：`我的主页`、`我的喜欢的`，`我的收藏集`并实现页面跳转。

3.点击`首页`扩展菜单，展开`首页``专栏``搜藏集`等页面，点击后实现切换页面效果。

4.`收藏集`中收藏文章内容实现关注功能。

**注：本设计要实现类似单页应用的效果，不出现停顿、刷新等问题。**

4.点击`首页`扩展菜单中切换到`专栏`页面，默认访问`全部`页面。

    说明：
    1 点击全部加载所有文章数据。
    2 点击前端加载前端相关文章数据。
    3 每个页面的文章点击阅读全文可展开内容，点击收起回到原始状态。
    4 点击文章显示收藏按钮，和喜欢的功能实现。
    5 获取文章发布时间数据并更新。

## 项目设计思路

以 **用户需求** 为中心，将用户的需求功能化，再将功能细化处理，通过数据驱动视图，实现相关功能，最终构建符合用户需求。

1.明确**设计目标**。

2.实现用户需求的基础。用户打开移动端时登录注册页面，用户已登录页面及标签文章等，都要通过后台从数据库获取数据，用数据驱动视图，实现页面效果。

3.对前端和后端的功能进行解构，实现前端和后端分离。

    说明：
    （1）vue.js 创建前端模板和构建框架，对页面进行组件拆分；vue-router 实现单页应用的效果。
    （2）后端使用express生成，用于端口设置、访问数据库等。根据不同的请求获取数据，分发给不同的前端页面（元素）。
    （3）用户登录、退出时，ajax发送请求，访问数据库，返回json数据，更新页面内容。

<mark>	<b>搭建开发环境：</b>使用 Vue 开启一个正式的项目：（生成前端模板)</mark>

	· $ vue init webpack（新创建一个项目文件）
	· 是否在当前目录下创建工程？y
	· 项目名称？
	· 项目描述？
	· 开发作者？
	· standalone 选择第一个模板 (第二个模板不能使用.vue 只能使用.html)
	· 是否安装vue-router?y
	· 是否检验es6代码？n
	· 是否建立单元测试？n
	· 是否建立e2e测试？n
	· npm install
	· npm run dev

  ---
<mark> 详：使用 Express (生成后端模板）</mark>

	· express --ejs backstage   ———— 使用ejs模板，后面跟后台文件目录
	· 生成模板后在后台文件目录下新建model文件，在该文件内部新建一个db.js文件，该文件为引入数据库模块工具文件。
	· routes文件中的js文件中引入数据库模块。
	· 该项目涉及到跨域，在后台文件app.js中进行配置（CORS on ExpressJS）
	· 启动 ：npm start   或   node ./bin/www
---
**db.js**

	var mysql = require('mysql');   //获取数据库中的数据 必须先引入数据库模块工具
	 var con = mysql.createConnection({ //创建链接
      host:'localhost',
      user:'root',
      password:'root',
      port:'8889',
      database:'vue-jj'   //数据库名
	})
	module.exports = con

**APP.JS**

	app.use(function(req, res, next) {
  		res.setHeader("Access-Control-Allow-Origin", "*");
  		res.setHeader("Cache-Control", "no-cache");
  		next();
	});
**跨域资源共享解决方案参考文档：(https://enable-cors.org/server_expressjs.html)**

<mark>详：创建数据库</mark>

    说明：
    （1）数据库：vue-jj。
    （2）表：article: 推送文章。
    （3）collection：收藏数据。
    （4）menu：副导航。
    （5）user：用户信息。
    （6）user_collection：用户相关数据（收藏文章、喜欢）
    （7）根据数据类型形成表结构关联视图，建立外键约束，使用inner join联表查询。


<mark>**首页：** 下拉按钮`首页`事件触发后交互到对应路由。</mark>

    说明：
    （1）由于首页按钮的值由下拉菜单事件值及cookie决定，故选择{{插值}}方式引入。
    （2）由于多个组件依赖于首页标签的同一状态,先在main.js中引入vuex,并初始化对象tagname=‘首页’。
    （3）到入口文件中（公共数据）将首页状态值动态返回并引入到标签。
    （4）定义一个开关用来判断首页按钮及下拉菜单点击事件触发后下拉菜单的显示/隐藏（布局时首页按钮与下拉菜单由同一个父级包裹）。
    （5）data中将下拉菜单数据（路由及标题）初始化并返回,将数据遍历至下拉菜单router-link中，渲染前在mounted函数中进行数据筛选。
    （6）index.js中引入vue/vue-router及所有路由。

    （7）判断用户登录后 要替换首页路由：
    （7.1）到公共状态值中初始化id:[],用于存放用户id,getCookie判断有值，即对公共id赋值。
    （7.2）再判断若拿到id值则将data中下拉菜单数据赋值到公共状态在切割，反之原理亦然。

    （8）下拉点击事件触发后获取到当前text()并将值绑定到首页标签。


<mark>**首页：** 点击下拉菜单以外区域后使其消失。</mark>

    说明：
    （1）document绑定click事件，获取当前事件状态及事件对象。
    （2）循环判断至跟节点，防止点击的是div子元素。
    （3）开关赋值为true,始终保持开关为最初的逻辑状态。
    （4）阻止事件冒泡到父元素。

<mark>**首页：** 登录/注册功能实现。</mark>

    说明：
    （1）创建登录、注册组件并将其引入至App.vue。
    （2）公共状态定义开关用于实现登录注册窗口关闭隐藏的业务逻辑。

    （3）获取form表单输入框中val()值并赋值给变量,进行表单数据验证判断。
    （3.1）若变量未赋值，则操作DOM显示提示性文字并阻止对表单的提交事件。
    （3.2）正则匹配数据后提交表单将数据提交至数据库。
    （3.3）数据返回到后台数据库中，sql查找是否有已被注册的账号，若results.length != 0 则弹出提示并清空表单。
    （3.4）条件符合则将用户信息添加到表中注册成功并显示登录窗口;且将值通过公共仓库传递给登录窗口表单。

    （4）登录窗口中获取到输入框中val()值并提交至数据库对结果进行查找，若表内未查找到传递过来的参数则按需提示。
    （5）条件符合则将数据（id和账号）返回至客户端setCookie。
    （6）将登录的用户数据交由仓库备份，为了每次用户刷新页面时始终保持登录状态。
    （7）当用户登录后 原登录首页路由需更换为登录后的首页路由（window.location.href='/main';）
    （8）因仓库刷新页面后会清空数据，所以mounted中要判断getCookie。
    （9）getCookie每次满足条件后都会将公共状态计算更新.
    （10）个人中心部分由公共状态值判断（v-if）显示和隐藏,所以刷新页面后仍为登录状态。



<mark>**专栏：** `专栏`页面下重定向实现。</mark>

    说明：
    （1）因不同副导航页面下内容不同，后期需根据导航类目进行页面数据筛选，所以副导航菜单需放到数据库中。
    （2）考虑到不同副导航类目下文章样式相同仅是数据不同，所以单独创建组件用于文章公共样式并插值。
    （3）获取数据库中文章数据并将拿到的数据定义两个值传送到公共状态：一个用来加载全部数据，另一个根据副导航类目筛选数据再渲染。
    （4）将仓库中文章数据返回并插值到标签中，遍历并计算数据。
    （5）(统一文章样式中是否显示图片)当没有计算到img.src时 v-if='article.img' 不显示。
    （6）加载页面时首先（App.vue中）要提前拿到专栏下面的导航菜单数据并给公共状态赋值，否则在访问专栏路由下页面时渲染副导航会延迟降低体验度。
    （7）返回公共状态中副导航类目至专栏组件中。
    （8）专栏组件中引入副导航组件,自定义一个属性绑定到副导航组件中再从仓库中拿到数据并赋值给该属性，再通过props验证数据类型后传给子组件并将数据循环。
    （9）副导航组件中, router-link 属性绑定后 计算由父组件循环后的数据。
    （10）仓库中初始化一个数字对象，在父组件中返回该对象并将下标赋值给该对象，:class='{blue1:isBlues===index}'绑定类名属性，动态切换类名实现被点击元素样式改变。

    （11）副导航不同类目下数据筛选：
    （11.1）专栏组件中引入的副导航组件中绑定click事件并传递下标。
    （11.2）当该事件被触发后将下标赋值给公共状态的数字对象（isBlue）,并动态返回该值切换class.
    （11.3）判断下标为0时，即不传index值,且将该函数commit到main.js中。反之传参。
    （11.4）到main.js中通过mutations修改store状态。
    （11.5）当该事件被触发后,将状态值（state）和（id）下标引入。
    （11.6）为保证每次进入循环后筛选后的数据都能被push到一个新数组中，so 进入循环前先定义一个空数组arr,再循环仓库中文章数据。（article）。
    （11.7）仓库中为了便于筛选数据,已经初始化了两个用于存储文章数据的数组对象:article和articles.一个用来循环，一个用来赋值。
    （11.8）进入循环:判断id为未定义(副导航：全部)则将所有文章数据push到空数组中并同步仓库中的值。
    （11.9）（数据库中每篇文章都有与下标对应的值，已提前存入）筛选：点击当前元素获取下标值查找与文章下标值对等的所有文章数据，再push到数组arr中并同步到仓库状态值。

    （12）专栏路由下包含的子路由中，默认用户第一次访问专栏页面重定向到“全部”子路由中，
    	{
      		path: '/zhuanlan',
      		redirect:'/zhuanlan/all' //---  重定向  实际访问的是zhuanlan路由，Url中更改为/zhuanlan/all
    	},
    （13）同时点击事件后会动态分配路由记录及状态：
    	{
      		path:'/zhuanlan',
      		name: 'Vzhuanlan',
      		component: Vzhuanlan,
      		children: [
        		{path:':id',component:Vcommon}//自由分配路径
      		],
    	}

<mark>实现页面刷新 保留原浏览记录。</mark>





## 项目基础技术

*  MySQL：存储数据信息
*  vue：生成前端模板，构建前端页面
*  vue-router：页面跳转
*  exrepss：生成后台模板
*  ajax：向服务器发送请求
*  jQuery：dom操作前端页面
*  WebPack：监听前端页面


## 项目目录结构

```bash
|--vue-juejin/   # 项目总文件夹
	|--vue/	   # 前端工程总文件夹（开发版）
		|--build/  			# webpack配置文件
		|--config/ 			# path位置文件
		|--node_modules/    # npm加载的第三方依赖模块

		|--src/	            # 开发的目录文件
				|--assets/      # 外部框架文件夹,放置一些图片，如logo等
				|--components/  # 组件文件夹
				|--router/      # vue-router设置文件夹
						   |--cookie.js     # 用户存值cookie文件
						   |--index.js      # 引入的所有组件
				|--App.vue      # 入口文件
				|--main.js      # 核心文件

		|--static/      		# 静态资源目录，如图片、字体等。
		|--dist/         		# 存放打包文件的文件夹
		|--index.html		  	# 首页文件,你可以添加一些meta信息
		|--package.json    		# 配置文件
		|--README.md	   		# 说明文档，markdown 格式

	|--service/   # 后端工程总文件夹
		|-bin/                  # 端口设置文件夹
		|-model/                # 数据库配置文件夹
		|--node_modules/        # 模块文件夹
		|--public/			    # 静态文件夹（发布版静态文件）
		|--routes/			    # 路由文件夹
		|--app.js				# 入口文件
		|--package.json         # 模块json文件
```



