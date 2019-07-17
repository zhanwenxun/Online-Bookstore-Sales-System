/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-01-16 10:58:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`,`time`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('3', '1', '2019-01-15 21-36-32', '123');
INSERT INTO `evaluation` VALUES ('3', '1', '2019-01-15 21-36-35', '214');
INSERT INTO `evaluation` VALUES ('3', '1', '2019-01-15 21-45-34', '123124');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `key_word` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`),
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'Java编程思想 （第4版）', '本书共22章，包括操作符、控制执行流程、访问权限控制、复用类、多态、接口、通过异常处理错误、字符串、泛型、数组、容器深入研究、Java I/O系统、枚举类型、并发以及图形化用户界面等内容。', 'Java、编程', '108', '91', '2');
INSERT INTO `products` VALUES ('2', 'C??????', '???????????????????????C???????????????C????????Dennis M.Ritchie?????????Brian W.Kernighan???????C?????????????????????C???????????????????????1?????C???????????C????——??C?????????\'hello,World\'???????????????????????????????????????', 'C?????', '30', '82', '2');
INSERT INTO `products` VALUES ('3', '算法导论（原书第3版）', '在有关算法的书中，有一些叙述非常严谨，但不够全面；另一些涉及了大量的题材，但又缺乏严谨性。本书将严谨性和全面性融为一体，深入讨论各类算法，并着力使这些算法的设计和分析能为各个层次的读者接受。全书各章自成体系，可以作为独立的学习单元；算法以英语和伪代码的形式描述，具备初步程序设计经验的人就能看懂；说明和解释力求浅显易懂，不失深度和数学严谨性。', '计算机、算法', '128', '100', '2');
INSERT INTO `products` VALUES ('5', '民法概要', '《民法概要》内容着重于阐释民法的价值理念，分析讨论权利体系、法律行为、债之关系(尤其是契约及侵权行为)、物权、亲属、继承等重要制度的功能，并提供若干相关统计资料，使读者能较宏观地了解攸关个人权益及社会经济发展之私法秩序的理论架构与实际运作。', '律法、民法', '48', '59', '5');
INSERT INTO `products` VALUES ('6', '普通法的精神', '本书深刻阐述了社会法理学说，主要把社会理想注入传说之中，坚持公共福利，蕴含有丰富的哲学和历史意义。', '律法', '13', '100', '5');
INSERT INTO `products` VALUES ('7', '最新中华人民共和国常用法律法规全书', '为了实践党的十六大提出的“坚持物质文明和精神文明两手抓，实行依法治国和以德治国相结合”的治国方略，把最基本、最常用的法律法规交给人民，我社特编 出版《最新中华人民共和国常用法律法规全书(精)》，其目的在于给读者提供一部内容完整准确、查阅使用便利的常用法律工具书。', '律法', '100', '99', '5');
INSERT INTO `products` VALUES ('8', '布局天下', '本书是一本历史军事地理著作。政治兴亡常与军事成败相关，而地理又与军事密切相关，故探讨中国古代军事地理大势，对于深入认识中国历史上历代兴亡，实为一个重要关键。本书的一个鲜明特点，是把中国古代军事地理大势形象地概括为\'棋盘型格局\'。全书内容亦由此而展开。因有\'棋盘型\'，乃有\'四角\'的分析，即关中、河北、东南、四川；乃有\'四边\'的阐述，即山西、山东、湖北、汉中；乃有关于\'合天下之全势\'的中原的认识。全书从地理形势、军事成败入手，最后落实到政治局面的变化，即历史上统一与分裂的成因及其类型。概而言之，全书由地理而言军事，由军事地理而论政治得失。', '军事、历史军事地理', '21', '100', '6');
INSERT INTO `products` VALUES ('9', '战争改变历史', '《战争改变历史:1500年以来的军事技术、战争及历史进程》从技术革命角度入手，将1500年以来的军事技术、战争与历史的画卷呈现在读者面前。《战争改变历史》由上海科学技术文献出版社出版。', '军事、军事思想', '68', '100', '6');
INSERT INTO `products` VALUES ('10', '西洋世界军事史（全三卷）', '本书为当代战史大师富勒将军的传世之作。作者穷30年之工，成就了这部卷帙浩繁的西方战争通史。全书以西方历史上的决定性会战为主结构，详细描述了其经过与影响，同时以大事记串联各会战间的政治发展与战争的由来。会战各章好像海浪的高峰，而大事纪则像其间所夹着的低谷。这样高低起伏就形成了3500年的战争史。', '军事、西方军事纪实', '168', '80', '6');
INSERT INTO `products` VALUES ('11', '数学之美', '几年前，“数学之美”系列文章原刊载于谷歌黑板报，获得上百万次点击，得到读者高度评价。读者说，读了“数学之美”，才发现大学时学的数学知识，比如马尔可夫链、矩阵计算，甚至余弦函数原来都如此亲切，并且栩栩如生，才发现自然语言和信息处理这么有趣。今年，作者吴军博士几乎把所有文章都重写了一遍，为的是把高深的数学原理讲得更加通俗易懂，让非专业读者也能领略数学的魅力。读者通过具体的例子学到的是思考问题的方式 —— 如何化繁为简，如何用数学去解决工程问题，如何跳出固有思维不断去思考创新。', '数学', '45', '100', '4');
INSERT INTO `products` VALUES ('12', '思考的乐趣', '本书包括5部分内容，即生活中的数学、数学之美、几何的大厦、精妙的证明、思维的尺度，涉及48篇精彩的文章。即使你不喜欢数学，也会为本书的精彩所倾倒。', '数学、生活乐趣', '45', '100', '4');
INSERT INTO `products` VALUES ('13', '数学：确定性的丧失', '绝大多数有知识的人今天仍然认为数学是关于物质世界的不可动摇的知识体系，数学推理是准确无误的。这本专著驳斥了这种神话。作者M·克莱因指出，今天，普遍接受的数学概念已不复存在，事实上，有许多相互矛盾的数学概念；但是，在描述和研究自然与社会现象时，数学的有效性却在持续扩大。这是为什么？全书在非专业层次上探讨数学尊严的兴衰，详细介绍了数学真理的起源、数学真理的繁荣、科学的数学化、数学向何处去等内容。', '数学', '32', '94', '4');
INSERT INTO `products` VALUES ('14', '解忧杂货店', '该书讲述了在僻静街道旁的一家杂货店，只要写下烦恼投进店前门卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答：因男友身患绝症，年轻女孩月兔在爱情与梦想间徘徊；松冈克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……他们将困惑写成信投进杂货店，奇妙的事情随即不断发生。', '解忧', '39', '99', '3');
INSERT INTO `products` VALUES ('15', '巨人的陨落', '在第一次世界大战的硝烟中，每一个迈向死亡的生命都在热烈地生长——威尔士的矿工少年、刚失恋的美国法律系大学生、穷困潦倒的俄国兄弟、富有英俊的英格兰伯爵，以及痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜壮阔地展现了一个我们自认为了解，但从未如此真切感受过的20世纪。', '小说', '129', '100', '3');
INSERT INTO `products` VALUES ('16', '百年孤独', '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等神秘因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪最重要的经典文学巨著之一。1982年加西亚•马尔克斯获得诺贝尔文学奖，奠定世界级文学大师的地位，很大程度上乃是凭借《百年孤独》的巨大影响。', '小说', '40', '100', '3');
INSERT INTO `products` VALUES ('17', '1', '2', '12', '223', '123', '2');

-- ----------------------------
-- Table structure for `shopping_car`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_car`;
CREATE TABLE `shopping_car` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shopping_car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_car_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shopping_car
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_record`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_record`;
CREATE TABLE `shopping_record` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`,`time`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shopping_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`id`),
  CONSTRAINT `shopping_record_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shopping_record
-- ----------------------------
INSERT INTO `shopping_record` VALUES ('2', '1', '2019-01-15 10-37-30', '1', '108', '1');
INSERT INTO `shopping_record` VALUES ('3', '2', '2019-01-16 09-36-35', '0', '150', '5');
INSERT INTO `shopping_record` VALUES ('16204126', '1', '2019-01-15 18-59-12', '1', '108', '1');
INSERT INTO `shopping_record` VALUES ('16204126', '2', '2019-01-15 18-59-20', '1', '30', '1');
INSERT INTO `shopping_record` VALUES ('16204126', '14', '2019-01-15 18-59-28', '1', '39', '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '推荐图书');
INSERT INTO `type` VALUES ('2', '计算机');
INSERT INTO `type` VALUES ('3', '文学');
INSERT INTO `type` VALUES ('4', '数学');
INSERT INTO `type` VALUES ('5', '律法');
INSERT INTO `type` VALUES ('6', '军事');
INSERT INTO `type` VALUES ('7', '推理');

-- ----------------------------
-- Table structure for `user_detail`
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `post_number` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `register_time` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_main` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES ('2', '2', '2', '0', '1', '2', '2', '2019-01-15 01:31:58');
INSERT INTO `user_detail` VALUES ('3', '3', '3', '0', '1', '1', '1', '2019-01-15 10:09:31');
INSERT INTO `user_detail` VALUES ('16204106', '16204106', '123', '312', '123', '123', '123', '2019-01-15 10:39:31');
INSERT INTO `user_detail` VALUES ('16204126', '16204126', '12', '1', '123', '123', '123', '2019-01-15 19:43:28');
INSERT INTO `user_detail` VALUES ('16204131', '16204131', '123', '1', '123', '123', '123', '2019-01-15 01:31:58');

-- ----------------------------
-- Table structure for `user_main`
-- ----------------------------
DROP TABLE IF EXISTS `user_main`;
CREATE TABLE `user_main` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nick_name` varchar(30) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_main
-- ----------------------------
INSERT INTO `user_main` VALUES ('2', '2', '23456', 'Admin', '1');
INSERT INTO `user_main` VALUES ('3', '3', '34567', 'Client', '0');
INSERT INTO `user_main` VALUES ('16204106', '16204106', '12341', 'Fei', '1');
INSERT INTO `user_main` VALUES ('16204126', '16204126', '12314', 'Zhan', '1');
INSERT INTO `user_main` VALUES ('16204131', '16204131', '21341', 'Jiang', '1');
