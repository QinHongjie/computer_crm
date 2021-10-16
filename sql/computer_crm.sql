/*
 Navicat MySQL Data Transfer

 Source Server         : new_mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : computer_crm

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/10/2021 16:17:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comName` varchar(40) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `intro` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '暂无',
  `price` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `picture` varchar(40) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` int(11) NOT NULL DEFAULT -1 COMMENT '-1表示为正常商品，1表示推荐商品。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES (1, '苹果 MacBook Air（MQD32CH/A）笔记本', '屏      幕：\r\n13.3英寸,分辨率1440x900\r\nCPU型号：\r\nIntel 酷睿i5 5350U\r\n显      卡：\r\n核芯显卡,Intel HD Graphics 6000', 9999, 1, 'img/bijiben/1.jpg', 1, 1);
INSERT INTO `computer` VALUES (2, '14英寸四核独显轻薄商务便携笔记本电脑', '金属游戏本，芯八代六核I7-8...', 1200, 1, 'img/bijiben/2.jpg', 1, 1);
INSERT INTO `computer` VALUES (3, '15.6英寸游戏笔记本 黑色 81HC0007CD', 'i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色', 5899, 1, 'img/bijiben/3.jpg', 0, 1);
INSERT INTO `computer` VALUES (4, '13.3英寸触控笔记本 天蝎灰 81CT0001CD', 'i5-8300H/Windows 10 家庭中文版/15.6英寸/8G/2T+128G SSD/GTX 1050Ti 4G独显/黑色', 7599, 1, 'img/bijiben/4.jpg', 0, 1);
INSERT INTO `computer` VALUES (5, '苹果新款MacBook Pro 13英寸 笔记本', '八代i5 2.4GHz 四核处理器 512G', 14999, 1, 'img/bijiben/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (6, '雷神911Masterbook旗舰版 笔记本', 'i7 9750H/16GB/512GB/GTX1650', 16999, 1, 'img/bijiben/6.jpg', 0, -1);
INSERT INTO `computer` VALUES (7, '华硕飞行堡垒6 FX86FE 火陨版 笔记本', 'i7 8750H/8GB/256GB+1TB/1050Ti', 8999, 1, 'img/bijiben/7.jpg', 0, 1);
INSERT INTO `computer` VALUES (8, '机械革命深海幽灵Z2 Air 笔记本', 'i7 8750H/8GB/512GB/GTX1050Ti', 9999, 1, 'img/bijiben/8.jpg', 0, -1);
INSERT INTO `computer` VALUES (9, '外星人(Alienware) ALWA51M-R1766B 17.3英寸 笔记本', '九代i7-9700K/16GB内存/512G固态硬盘X2/RTX 2080/8G独显', 140000, 1, 'img/bijiben/9.jpg', 0, -1);
INSERT INTO `computer` VALUES (10, 'ThinkPad X1 隐士-笔记本', 'Intel 酷睿i7 8750HNVIDIA GeForce GTX 1050 Ti /8GB内存无阻畅玩', 12999, 1, 'img/bijiben/10.jpg', 3, -1);
INSERT INTO `computer` VALUES (11, '华硕灵耀X2 Pro-笔记本', 'i9 9980HK/32GB/1TB/RTX2060', 66999, 1, 'img/bijiben/11.jpg', 0, -1);
INSERT INTO `computer` VALUES (12, '惠普幻影精灵 X 15 笔记本', 'Intel 酷睿i7 9750H  NVIDIA GeForce RTX 2070', 59999, 1, 'img/bijiben/12.jpg', 0, -1);
INSERT INTO `computer` VALUES (13, 'ROG 超神X-笔记本', 'i9 9980HK/64GB/3×512GB/RTX2080', 79999, 1, 'img/bijiben/13.jpg', 0, -1);
INSERT INTO `computer` VALUES (14, 'msi微星GT76-笔记本', 'Intel 酷睿i9 9900K 	NVIDIA GeForce RTX 2080', 69999, 1, 'img/bijiben/14.jpg', 0, -1);
INSERT INTO `computer` VALUES (16, 'ROG G21CX', 'i9-9900K/32GB/1TB+1TB/RTX2080', 59999, 2, 'img/taishiji/1.jpg', 0, -1);
INSERT INTO `computer` VALUES (17, '联想拯救者 刃9000', 'i7 8700/16GB运行/256GB+2TB/8G独显', 49999, 2, 'img/taishiji/2.jpg', 0, -1);
INSERT INTO `computer` VALUES (18, 'ROG GL10CS', 'i7-9700K/8GB/512GB运行+1TB/RTX2060', 16999, 2, 'img/taishiji/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (19, '雷霆世纪觉醒系列X6S', 'i7 9700/16GB/1TB/RTX 2060', 12999, 2, 'img/taishiji/4.jpg', 1, -1);
INSERT INTO `computer` VALUES (20, 'Alienware Area-51', '双NVIDIA GeForce GTX 970英特尔 酷睿i7 5代系列', 10999, 2, 'img/taishiji/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (21, '联想拯救者 刃7000 3代', 'i5-9400/8GB/512GB/6G独显', 8999, 2, 'img/taishiji/6.jpg', 0, -1);
INSERT INTO `computer` VALUES (22, '微软（Microsoft）Surface Studio 2', 'i7-7820HQ 16G 1T GTX1060 6G独立显卡', 28999, 2, 'img/taishiji/7.jpg', 0, -1);
INSERT INTO `computer` VALUES (23, '惠普暗影精灵X 900-296CN参数', '英特尔 酷睿i9 X代系列十核心/二十线程', 28999, 2, 'img/taishiji/8.jpg', 0, -1);
INSERT INTO `computer` VALUES (24, '微星Trident X-425', '英特尔 酷睿i9 9代系列', 27999, 2, 'img/taishiji/9.jpg', 0, -1);
INSERT INTO `computer` VALUES (25, '联想（Lenovo）拯救者Y720', '兼容WIN7 I5-7400 8G 1T+128GSSD GTX1650-4G WIFI蓝牙 定制', 4999, 2, 'img/taishiji/10.jpg', 0, -1);
INSERT INTO `computer` VALUES (26, 'Mad Catz R.A.T. Pro X游戏鼠标', '左右按键使用分体式结构设计，鼠标底部还设计了可更换式的脚垫模组', 1299, 3, 'img/shubiao/1.jpg', 4, -1);
INSERT INTO `computer` VALUES (27, '苹果Magic Mouse鼠标', '商务舒适，移动便携，时尚个性', 599, 3, 'img/shubiao/2.jpg', 0, 1);
INSERT INTO `computer` VALUES (28, '雷柏VT950电竞游戏鼠标', '5000万次欧姆龙清脆手感微动\r\n10克锌合金配重，双色注塑工艺', 299, 3, 'img/shubiao/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (29, '罗技G502 HERO游戏鼠标', '11个可编程按键\r\nHERO 16K传感器\r\n支持1680万色的RGB灯效', 399, 3, 'img/shubiao/4.jpg', 0, -1);
INSERT INTO `computer` VALUES (30, '雷柏M550无线充电版多模式无线鼠标', '无线充电+无线连接 雷柏无线充电外设专题上线', 199, 3, 'img/shubiao/5.png', 0, -1);
INSERT INTO `computer` VALUES (31, 'mitomk Tab 90M 樱桃轴机械键', '德国樱桃轴（cherry）', 1899, 4, 'img/jianpan/1.jpg', 0, 1);
INSERT INTO `computer` VALUES (32, 'SteelSeries APEX PRO有线机械键盘', 'OmniPoint自适应机械轴', 1989, 4, 'img/jianpan/2.jpg', 1, -1);
INSERT INTO `computer` VALUES (33, '华硕GK2000 ROG猎鹰机械游戏键盘', 'ROG GK2000猎鹰采用CNC冲压拉丝铝工艺', 1589, 4, 'img/jianpan/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (34, 'HHKB Pro2编程专用静电容键盘', '静电容架构', 1899, 4, 'img/jianpan/4.jpg', 0, -1);
INSERT INTO `computer` VALUES (35, 'Cherry MX board 9.0 RGB背光机械键盘', '搭载了樱桃自家的MX RGB开关，内部两个金属片采用黄金十字触点技术', 1299, 4, 'img/jianpan/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (36, '索尼WH-1000XM3-耳机', '开放式耳机质量轻，声音自然，无压迫感', 2599, 5, 'img/erji/1.jpg', 0, -1);
INSERT INTO `computer` VALUES (37, '森海塞尔MOMENTUM 3 Wireless-耳机', '耳机根据其换能方式分类，主要有动圈式、静电式和等磁式。', 2999, 5, 'img/erji/2.jpg', 0, -1);
INSERT INTO `computer` VALUES (38, '索尼WI-1000X-耳机', '后挂运动式蓝牙耳机', 1599, 5, 'img/erji/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (39, '铁三角ATH-M50X-耳机', '高续航担当 性价比高品质头戴式耳机精选', 1199, 5, 'img/erji/4.jpg', 0, -1);
INSERT INTO `computer` VALUES (40, '苹果AirPods Pro-耳机', 'IPX4级防水,运动休闲蓝牙耳机', 2599, 5, 'img/erji/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (41, '罗技CC3500e GROUP-摄像头', '10倍数码变焦高清摄像头', 7999, 6, 'img/shexiangtou/1.jpg', 0, -1);
INSERT INTO `computer` VALUES (42, '中兴小兴看看C520P-摄像头', 'CMOS（1/2.7英寸）感光元件', 549, 6, 'img/shexiangtou/2.jpg', 0, -1);
INSERT INTO `computer` VALUES (43, '罗技CC4900e-摄像头', '功能特点	4K高清，15 倍高清变焦，自动对焦，遥控，3个预设位', 14999, 6, 'img/shexiangtou/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (44, '蓝色妖姬M2200暮色-摄像头', '创新型结构设计，桌面与液晶两用', 899, 6, 'img/shexiangtou/4.jpg', 0, -1);
INSERT INTO `computer` VALUES (45, '联想看家宝Snowman-摄像头', '140度业内超大视角，CMOS传感器，全玻璃镜头，摄影级光圈', 799, 6, 'img/shexiangtou/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (46, '华为VR Glass', '3D全景立体声，双Smart PA智能功放芯片加持', 2999, 7, 'img/vr/1.jpg', 0, 1);
INSERT INTO `computer` VALUES (47, 'HTC Vive Cosmos-VR', 'pixel-packed显示屏CPU	Intel Core i5-4590', 5899, 7, 'img/vr/2.jpg', 0, -1);
INSERT INTO `computer` VALUES (48, '\r\n联想Mirage AR智能头盔套装参数-VR', '传感器：双动态追踪摄像头', 1999, 7, 'img/vr/3.jpg', 0, -1);
INSERT INTO `computer` VALUES (49, '嗨镜H1-VR', '2片0.7英寸超清OLED微显示屏', 999, 7, 'img/vr/4.jpg', 0, -1);
INSERT INTO `computer` VALUES (50, '3Glasses 蓝珀S1-VR', '传感器：3Wand-Camera辅助定位', 4999, 7, 'img/vr/5.jpg', 0, -1);
INSERT INTO `computer` VALUES (51, '罗技MX Vertical无线蓝牙跨屏垂直鼠标电脑办公', 'MX Vertical是一款鼠标具有更符合人体工程学的姿态，技术驱动设计与罗技MX系列一致的高标准性能于一体。', 999, 3, 'img/shubiao/6.png', 0, 1);

-- ----------------------------
-- Table structure for comtype
-- ----------------------------
DROP TABLE IF EXISTS `comtype`;
CREATE TABLE `comtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comtype
-- ----------------------------
INSERT INTO `comtype` VALUES (1, '笔记本');
INSERT INTO `comtype` VALUES (2, '台式机');
INSERT INTO `comtype` VALUES (3, '鼠标');
INSERT INTO `comtype` VALUES (4, '键盘');
INSERT INTO `comtype` VALUES (5, '耳机');
INSERT INTO `comtype` VALUES (6, '摄像头');
INSERT INTO `comtype` VALUES (7, 'VR');

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `comId` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES (27, 2, 26, 4);
INSERT INTO `shoppingcar` VALUES (28, 2, 10, 3);
INSERT INTO `shoppingcar` VALUES (30, 1, 1, 1);
INSERT INTO `shoppingcar` VALUES (31, 1, 2, 1);
INSERT INTO `shoppingcar` VALUES (34, 6, 19, 1);
INSERT INTO `shoppingcar` VALUES (35, 6, 32, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `password` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `address` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '1' COMMENT '用户状态:\'0\'->\'停用\',\'1\'->\'启用\'',
  `ident` char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '0' COMMENT '管理权限:\'0\'->\'用户\',\'1\'->\'管理员\'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13679091389', '', '1', '1');
INSERT INTO `user` VALUES (2, 'user1', 'e10adc3949ba59abbe56e057f20f883e', '13118483520', '四川托普信息技术职业学院', '1', '0');
INSERT INTO `user` VALUES (3, 'user2', 'e10adc3949ba59abbe56e057f20f883e', '131184835207', '大连理工大学计算机系', '1', '0');
INSERT INTO `user` VALUES (4, 'user3', 'e10adc3949ba59abbe56e057f20f883e', '13118483226', '新新园100号2门10', '0', '0');
INSERT INTO `user` VALUES (6, '秦洪杰', 'e10adc3949ba59abbe56e057f20f883e', '13908172159', '四川省成都市荆竹小区七号院13栋', '1', '1');
INSERT INTO `user` VALUES (8, 'asd', 'e10adc3949ba59abbe56e057f20f883e', '13141231231', '四川省成都市1号街', '1', '0');

SET FOREIGN_KEY_CHECKS = 1;
