-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: 2017-10-30 02:03:19
-- 服务器版本： 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `vue.jj`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(20) NOT NULL COMMENT '文章ID',
  `menu_ID` int(20) NOT NULL COMMENT '菜单ID',
  `title` tinytext NOT NULL COMMENT '文章标题',
  `text` text NOT NULL COMMENT '文章内容',
  `img` tinytext NOT NULL COMMENT '文章图片',
  `user_ID` int(20) NOT NULL COMMENT '用户ID',
  `article_src` tinytext NOT NULL COMMENT '文章链接',
  `time` datetime(6) NOT NULL,
  `index_number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `menu_ID`, `title`, `text`, `img`, `user_ID`, `article_src`, `time`, `index_number`) VALUES
(3, 2, '从贺老微博引出的“遍历器（Iterators）加速那些奥秘”', '我关注的贺老—贺师俊前辈@johnhax 最近发表个这样一条微博：虽然这条微博没有引起大范围的关注和讨论，但是作为新人，我陷入了思考。究竟 V8 引擎做了哪些魔法，达到了极大限度的优化呢？', '../../static/img/1_1.jpg', 1, 'https://juejin.im/post/59805d206fb9a03c4d644464', '2017-08-03 12:15:20.000000', 4),
(4, 4, '腾讯 AlloyCrop 1.0 发布', '写在前面 AlloyCrop 这个项目是8个月前发布的，作为AlloyFinger 的典型案例，发布之后被BAT等其他公司广泛使用。但是发布之后，有两个问题一直没有抽出时间去解决: 裁剪图像的分辨率太小，是否可配？ pinch双指放大的时候，放大的中心不是双指中心，是否可以优化?', '', 1, 'https://juejin.im/post/5981433f6fb9a03c5022783a', '2017-08-02 00:00:00.000000', 0),
(5, 4, 'TiDB 应用实例：弹性水平扩展，支撑猿辅导数据快速增长需求', '猿辅导是国内拥有最多中小学生用户的在线教育机构，旗下有猿题库、小猿搜题、猿辅导三款在线教育 APP，为用户提供在线题库、拍照搜题、名师在线辅导相关的服务。其中，猿辅导APP已经有超过116万付费用户，提供小学英语、奥数，和初中高中全学科的直播辅导课程，全国任何地区的中小学生，都…', '', 1, 'https://juejin.im/post/59814d62f265da3e220520b5', '2017-08-02 00:00:00.000000', 1),
(6, 2, 'XpmJS —— 小程序后端开发思考和实践', ' 内容来源：2017年3月19日，团队猫创始人兼CEO王伟平在“OSC源创会深圳站”进行《XpmJS——小程序后端开发思考和实践》演讲分享。IT大咖说作为独家视频合作方，经主办方和讲者审阅授权发布。 阅读字数：1759 | 4分钟阅读 摘要Linux容器技术很早就有，LXC的容器…', '../../static/img/weixin.jpg', 1, 'https://juejin.im/post/598093bc6fb9a03c5c6feb95', '2017-08-02 00:00:00.000000', 2),
(7, 2, '数据库中间件 MyCAT源码分析：【单库单表】插入【推荐阅读】', ' ???关注微信公众号：【芋艿的后端小屋】有福利： RocketMQ / MyCAT / Sharding-JDBC 所有源码分析文章列表 RocketMQ / MyCAT / Sharding-JDBC 中文注释源码 GitHub 地址 您对于源码的疑问每条留言都将得到认…', '../../static/img/1_2.jpg', 1, 'https://juejin.im/post/598092b751882537e0595f5f', '2017-08-02 00:00:00.000000', 2),
(8, 2, '[贝聊科技]iOS 代码架构（一）如何创建一个易复用的组件', '前言 贝聊的移动客户端分别有家长端和老师端，一家公司里同时维护多个业务上有关联性的app这种情况其实很常见，例如一些提供 O2O 服务的公司，经常会分用户端和商家端。这些客户端虽然各自负责着一个业务环里面的不同部分，看似不相关，但其实内在的设计、代码都有很多共同之处。 我们编写代…', '', 1, 'https://juejin.im/post/598034ca6fb9a03c493b55a2', '2017-08-02 00:00:00.000000', 3),
(9, 4, '关于购物车下单-订单跳转及返回问题解决方案', '问题描述： 通过商品或者购物车进入下单页面 下单页面确认信息 提交订单 进入订单页面 在订单页面点击返回按钮 返回至下单页面 导致的问题： 在下单页面 如果是购物车中的商品 因为购物车中商品已经提交订单了，所以会提示购物车信息无效 解决方案： 第一种解决方案： 如果是通过下单页进…', '', 1, 'https://juejin.im/post/59805735f265da3e1f54a14c', '2017-08-02 00:00:00.000000', 2);

-- --------------------------------------------------------

--
-- 表的结构 `collection`
--

CREATE TABLE `collection` (
  `id` int(20) NOT NULL COMMENT '收藏ID',
  `title` tinytext NOT NULL COMMENT '收藏标题',
  `user_ID` int(20) NOT NULL COMMENT '用户ID',
  `author` tinytext NOT NULL,
  `img_src` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `collection`
--

INSERT INTO `collection` (`id`, `title`, `user_ID`, `author`, `img_src`) VALUES
(1, '关于vue的一切', 56, 'MrDream24', '../../static/img/bg1.jpg'),
(2, 'Java进阶之路', 56, '头号粉丝', '../../static/img/bg2.jpg'),
(3, '大厂前端面试题', 56, '彷梓', '../../static/img/bg4.jpg'),
(4, '掘金日报', 56, '稀土君', '../../static/img/bg5.jpg'),
(5, '前端开发-从入门到Offer', 56, '余博伦是讨厌鬼', '../../static/img/bg6.jpg'),
(6, '计算机程序的思维逻辑', 56, 'swiftma', '../../static/img/bg7.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(20) NOT NULL COMMENT '菜单ID',
  `menu` tinytext NOT NULL COMMENT '菜单名',
  `index_number` int(20) NOT NULL,
  `url` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `menu`, `index_number`, `url`) VALUES
(0, '全部', 0, '/zhuanlan/all'),
(1, 'Android', 1, '/zhuanlan/Android'),
(2, '前端', 2, '/zhuanlan/qianduan'),
(3, 'IOS', 3, '/zhuanlan/IOS'),
(4, '后端', 4, '/zhuanlan/houduan'),
(5, '设计', 5, '/zhuanlan/sheji'),
(6, '产品', 6, '/zhuanlan/chanpin'),
(7, '工具资源', 7, '/zhuanlan/ziyuan'),
(8, '阅读', 8, '/zhuanlan/yuedu'),
(9, '人工智能', 9, '/zhuanlan/zhineng');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL COMMENT '用户ID',
  `username` tinytext NOT NULL COMMENT '用户名',
  `password` tinytext NOT NULL COMMENT '密码',
  `email_or_tel` varchar(50) NOT NULL COMMENT '注册账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email_or_tel`) VALUES
(56, '邢红喜', '123', '13718201647');

-- --------------------------------------------------------

--
-- 表的结构 `user_collection`
--

CREATE TABLE `user_collection` (
  `id` int(20) NOT NULL COMMENT '用户收藏ID',
  `collection_ID` int(20) DEFAULT NULL COMMENT '收藏ID',
  `user_ID` int(20) NOT NULL COMMENT '用户ID',
  `article_ID` int(20) DEFAULT NULL COMMENT '文章ID',
  `class` tinytext NOT NULL COMMENT '类型：A:收藏，B点赞',
  `isno` int(20) NOT NULL COMMENT '是否有收藏？'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_collection`
--

INSERT INTO `user_collection` (`id`, `collection_ID`, `user_ID`, `article_ID`, `class`, `isno`) VALUES
(1, 1, 56, NULL, 'A', 1),
(2, 2, 56, NULL, 'A', 1),
(3, 3, 56, NULL, 'A', 1),
(4, 1, 60, NULL, 'A', 0),
(5, 1, 61, NULL, 'A', 0),
(6, 1, 63, NULL, 'A', 1),
(7, 2, 63, NULL, 'A', 1),
(8, 3, 63, NULL, 'A', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_ID` (`menu_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_collection`
--
ALTER TABLE `user_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_ID` (`collection_ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `article_ID` (`article_ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '收藏ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=65;
--
-- 使用表AUTO_INCREMENT `user_collection`
--
ALTER TABLE `user_collection`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户收藏ID', AUTO_INCREMENT=9;