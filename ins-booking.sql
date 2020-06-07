/*
Navicat MySQL Data Transfer

Source Server         : 大型仪器
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : ins-booking

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-05-11 18:31:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ins_name` varchar(200) DEFAULT NULL,
  `pro_name` varchar(200) DEFAULT NULL,
  `pro_source` varchar(100) DEFAULT NULL,
  `pro_number` varchar(200) DEFAULT NULL,
  `pro_person` varchar(20) DEFAULT NULL,
  `pro_person_mobile` varchar(15) DEFAULT NULL,
  `booking_person` varchar(20) DEFAULT NULL COMMENT '预约人',
  `booking_person_mobile` varchar(15) DEFAULT NULL,
  `sample` text,
  `booking_event` text,
  `booking_person_number` varchar(200) DEFAULT NULL COMMENT '预约上机人，填人的信息',
  `booking_operation_skill` int(2) DEFAULT NULL,
  `booking_start_time` datetime DEFAULT NULL,
  `booking_stop_time` datetime DEFAULT NULL,
  `fee_scale` text COMMENT '收费标准',
  `fee_source` text COMMENT '费用出处',
  `auditing` int(2) DEFAULT NULL COMMENT '审核，0代表有错误，1代表发起预约申请，2代表仪器专管员同意申请，3代表双方同意',
  `modify` text COMMENT '专管员同意或者拒绝申请理由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('63', '显微共焦拉曼光谱仪', '1', '1', '1', '1', '1', '熊伟', '11012010086', '1', '1', '1', '1', '2018-05-02 00:00:00', '2018-05-02 16:01:18', null, '', '1', null);
INSERT INTO `booking` VALUES ('64', '显微共焦拉曼光谱仪', '1', '1', '1', '1', '1', '熊伟', '11012010086', '1', '1', '1', '1', '2018-05-02 00:00:00', '2018-05-02 16:03:14', null, '', '1', null);
INSERT INTO `booking` VALUES ('65', '紫外-可见-近红外分光光度计', '1', '1', '1', '1', '1', '熊伟', '11012010086', '1', '1', '1', '1', '2018-05-02 00:00:00', '2018-05-02 16:06:32', null, '1', '1', null);
INSERT INTO `booking` VALUES ('83', '热场发射扫描电子显微镜', '1', '1', '1', '1', '1', '曾羽', '1', '1', '1', '1', '1', '2018-05-04 00:00:00', '2018-05-04 15:06:57', null, '1', '2', '1');
INSERT INTO `booking` VALUES ('84', '热场发射扫描电子显微镜', '1', '1', '1', '1', '1', '曾羽', '1', '1', '1', '1', '1', '2018-05-04 00:00:00', '2018-05-08 00:00:00', null, '1', '2', '12312345');

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ins_name` varchar(200) DEFAULT NULL,
  `ins_type` varchar(100) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `admin_name` int(11) DEFAULT NULL COMMENT '仪器专管员',
  `image` varchar(255) DEFAULT NULL,
  `make` varchar(100) DEFAULT NULL COMMENT '制造厂商',
  `address` varchar(100) DEFAULT NULL COMMENT '放置地址',
  `tech_target` text COMMENT '技术指标',
  `function` text,
  `application` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrument
-- ----------------------------
INSERT INTO `instrument` VALUES ('1', '显微共焦拉曼光谱仪', null, '1', '770', null, null, null, null, null, null);
INSERT INTO `instrument` VALUES ('2', '热场发射扫描电子显微镜', null, '1', '771', null, null, null, null, null, null);
INSERT INTO `instrument` VALUES ('3', '紫外-可见-近红外分光光度计', null, '1', '772', null, null, null, null, null, null);
INSERT INTO `instrument` VALUES ('4', '电子探针显微分析仪', null, '1', '774', null, null, null, null, null, null);
INSERT INTO `instrument` VALUES ('5', '多功能X射线衍射仪', null, '1', '773', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `describe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '中心管理员');
INSERT INTO `role` VALUES ('2', 'ins_admin', '仪器专管员');
INSERT INTO `role` VALUES ('3', 'user', '普通用户');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '工号',
  `password` varchar(100) DEFAULT NULL,
  `real_name` varchar(20) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `verification` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'xiongwei', '9b2f60507e17c692f12ff8d865aeda55', '熊伟', '11012010086', '贵州理工学院电气与信息工程学院', '2', '0');
INSERT INTO `user` VALUES ('3', 'liuzhiqi', 'c3e20de68b59bbaa0b112f369de2c5d8', '刘志奇', '11012010086', '贵州理工学院电气与信息工程学院', '2', '0');
INSERT INTO `user` VALUES ('4', 'huangbaoxu', '0d5fdd97923739e1e5040c484a42349c', '黄宝徐', '11012010086', '贵州理工学院电气与信息工程学院', '2', '0');
INSERT INTO `user` VALUES ('5', 'wangmengde', '1d75e0d912979f70448380d07150b4fc', '王孟德', '11012010086', '贵州理工学院电气与信息工程学院', '2', '0');
INSERT INTO `user` VALUES ('11', '20120001', '9b2f60507e17c692f12ff8d865aeda55', '曾羽', null, '学院领导', '3', '1');
INSERT INTO `user` VALUES ('12', '20120002', 'e95262e73edb357a976d4fbfd54c557c', '龙奋杰', null, '学院领导', '3', '1');
INSERT INTO `user` VALUES ('13', '20120004', '5d6f5be0deffe8a2ac003065401f0c42', '梁杰', null, '学院领导', '3', '0');
INSERT INTO `user` VALUES ('14', '20120006', 'd127a5a72d9d8dd1720aebbd015dd8f4', '张波', null, '学院领导', '3', '0');
INSERT INTO `user` VALUES ('15', '20120007', 'b336174d4005109fea1ed40ce78cb29c', '王建平', null, '学院领导', '3', '0');
INSERT INTO `user` VALUES ('16', '20120093', '070fbe9fbf45e32cb2193295dbc21735', '宋建波', null, '学院领导', '3', '0');
INSERT INTO `user` VALUES ('17', '20150696', 'c996ba08cf020ac40ec297583804c5ff', '苏向东', null, '学院领导', '3', '0');
INSERT INTO `user` VALUES ('18', '20120128', 'fa2f33234f1d32f3d867f450889714c5', '丁毅', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('19', '20120101', '72a768f20220b156b9132b5d1f343806', '郑伟', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('20', '20120014', '9210f71aa78878dbec136286f00afbbe', '程超', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('21', '20120043', 'fb12d7dc21849f256e8e48a348a55d11', '胡德慧', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('22', '20120042', '21ce720b93898a8832c5c07139c4deae', '胡应龙', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('23', '20120041', '0a40dac01342bae75a3fe36ce61016e7', '夏雍', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('24', '20120091', '7313c8a2743b42cb832e4dbb114cdf9f', '章丽娥', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('25', '20120094', '7fc5a57480f4d082fd519f57f08c63c4', '朱敏芳', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('26', '20140293', '0c47d9ab1b2988a11e1ab72631a6fdb1', '刘帆', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('27', '20140389', 'fd816e7ada76cf79f13d630f15d58766', '盈旭', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('28', '20140388', '51af2df3aba0393d2740dd5c0d237988', '钟黎明', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('29', '20140403', 'e0f2b10bf685cbc6edede4c4de93e38b', '唐君', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('30', '20140404', '407e98e8997c9d58f71051e462d75e12', '郑绿全', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('31', '20130208', 'b190f126d56466250fc6b087705bbeb5', '慕雨容', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('32', '20130185', '57a180b77968184aeac5a3d01eeac1ef', '蔡红英', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('33', '20130163', '82adb544ccb81946134bc1193d30f02e', '卢文雄', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('34', '20120123', '36ad5a4dae4a6e742e26cfbb7f3a36fd', '黄锴', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('35', '20120087', '7863dbd37cb8ff9895f75b270450eb8f', '王丽莎', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('36', '20120129', 'ec1b7a421dea5f8d3bf085d49223d11f', '詹凤合', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('37', '20120111', '1bd88f6e417acfa739b2bd381ab8bba8', '巫敏', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('38', '20120077', '5751ceff60503c19916cdcf6db58838f', '曾凯', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('39', '20120040', '1bea29d090235cd9a34c52a7a100d6e4', '周伟', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('40', '20140286', '996e2cb1ed560a802cc1ed34cf580391', '方燕', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('41', '20140391', '45b737a724383b6aa49e0739a9ac7f61', '扶文莉', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('42', '20120011', '4d489a2a81a4cbe31bdebfcffee8b737', '徐元敏', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('43', '20120146', '81657dcd0b453e3294280625bf8594b0', '顾亚丽', null, '创新创业中心', '3', '0');
INSERT INTO `user` VALUES ('44', '20120131', 'e43ef8e1768ea33836d00c4245d4c946', '孙凯', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('45', '20120086', '5ee31bc45c93ec41908ccf5f6041784e', '顾英', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('46', '20120109', 'f5c8e342462d5680ff1fe709975d363e', '蒋文韬', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('47', '20120132', '1c3adbd2f6f74313fc01108304754064', '李金', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('48', '20120050', '1e07e6d60771a3bbfe9fd8d527a65116', '陆昀', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('49', '20120084', '811a772acaf578fb5b288ba9429c9db6', '罗朝安', null, '马列主义教学部', '3', '0');
INSERT INTO `user` VALUES ('50', '20120085', '11fb56693029260cbaa0662298cdb363', '苏利荣', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('51', '20120083', 'dc0e462a4ee3f71b4b1a1796f18760a2', '杨文斯', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('52', '20140315', 'e4b5b3208269018c2850cde76bf8c411', '侯燕玲', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('53', '20130277', '1976c9a072cb378e357ba112284aaf7f', '杨桂芳', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('54', '20120117', 'cccdd229dfaa130271fbe5e6b0a04cb4', '宋明江', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('55', '20140350', 'cb37933f420c2325a4d5623201669495', '张璋', null, '马列主义教学部', '3', '0');
INSERT INTO `user` VALUES ('56', '20140313', '662a971e86de6f928fc82d7067a502d7', '周炳梅', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('57', '20130167', '5283d6ff2b95d48fda7aa2352929b381', '吴维义', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('58', '20120090', 'b15b40f8fcbd4bb907c50a723bf69298', '苏镜萍', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('59', '20120092', '14241db1f5adaaece33571f75707c9da', '张小梅', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('60', '20140355', 'd5fd6faabd6c0e11d3a078806dce66d9', '杜永强', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('61', '20140373', '3c5a84ec6c56d5494d66cba5075dd0ae', '刘敏芳', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('62', '20140331', '033b87530729c9a71ac81339e1aa5c6e', '龙鸥', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('63', '20140299', '0f597b1981fec7849c6e5133fdb53b46', '施文洁', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('64', '20140347', 'f7000666891babd75395edfd25e8b045', '唐丹', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('65', '20140359', 'f42aa5b1aeb59e8776b2ea62a160e9c7', '杨鑫', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('66', '20140390', '4fff876e3d30e37f0c2ba3c00f623f9b', '张廉', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('67', '20140406', 'cadae335d517d2c1a27bb9bfe1d1338d', '马丹', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('68', '20120150', '2b13bdce01ce9fed32e76ee498ca75c2', '邵芳', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('69', '20130177', '76e2e66b19d7b200113ba70881be619e', '谢渝春', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('70', '20130159', 'b7a7bf8d30978f20f20aac9aa0dfd85b', '刘琦', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('71', '20120089', '99b49629a67aefbf610a613212556df5', '杨建强', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('72', '20120044', '0b6569fd7658d49888c8092e61054197', '张一鸣', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('73', '20140360', '06c16d14cdba8d2f3de52cef96d4e359', '王大飞', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('74', '20120154', '97221e678de6ca2f71d16865c8c3dea1', '张妤', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('75', '20130168', 'd9e5deb92b7e06deb8723235c4d4d4d6', '李源', null, '招生就业处', '3', '0');
INSERT INTO `user` VALUES ('76', '20120144', '26deed916bb5100bf1b9ef73da337229', '陈蓝爝', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('77', '20120062', 'ef459d749b7d673cf414f112d790485e', '梁珍', null, '招生就业处', '3', '0');
INSERT INTO `user` VALUES ('78', '20120022', 'f52948b290a4777d2c1452086d8675b3', '王坚', null, '招生就业处', '3', '0');
INSERT INTO `user` VALUES ('79', '20130161', '12eab4c1213c58a3c43f3865b24bbe94', '刘承章', null, '审计处', '3', '0');
INSERT INTO `user` VALUES ('80', '20120021', '2361076e90c160b32c84d1ff57cf9090', '龙亮', null, '审计处', '3', '0');
INSERT INTO `user` VALUES ('81', '20120149', '9dafbad86abc767b97bdf17a67274b7a', '高勇', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('82', '20120119', 'a08cc5dd759374df54bc17d2ff6e75fa', '唐丽华', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('83', '20120097', 'dfc34533b4a6e33287ef6f230330f3f2', '徐焱', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('84', '20120088', 'c79cb86958ec7cf87e88bddb0b0eee7f', '田瑶', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('85', '20140288', 'ea235745de59d6c28d0f62def2f32847', '高腾刚', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('86', '20130285', '7aaca204b49a740f9e3c0db5f9e5659d', '李迪', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('87', '20140300', '76970cf19f0c6254876f59625acdcf60', '孙雯', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('88', '20130255', 'd2ab16aea457e9b224b361c298fb4cdb', '刘广群', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('89', '20120127', '1f6b661a5ed8f7db5d8d518e2d4862d7', '杨鉴福', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('90', '20120135', 'c11207c4e45bb7a4e212d1d47c690c23', '史明华', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('91', '20120045', 'ebee82ecf30ca6e7bd09b8da987eb4bf', '吴园园', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('92', '20130164', '53f0f637e1f39527bc159014555e0dfe', '周红', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('93', '20140328', 'b5bfe7e4fac9e0561d00294ed9ee2f90', '程航', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('94', '20140356', '8cab2f5a52b99c5ae736c30972e01a12', '祝光新', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('95', '20120103', '231fca136b47acceb2b0fa140df33441', '李江红', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('96', '20130158', '2af20529b0ff2c48faf4637a57f39ad2', '杜建群', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('97', '20140290', '05f7c8c625ef699cea0b05791a64a622', '黄仿元', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('98', '20120096', '21edeabcb1594031eb50754f0147ac20', '任永开', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('99', '20120115', 'a06df43df9e8bb3d46c3c90c0da7d8cc', '伍敏', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('100', '20140380', '53f17c88c78feeb35396ac991bb046d5', '牟秋菊', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('101', '20140298', '8dba74db79f9df61e315ffc0221338f5', '屈锦伟', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('102', '20140348', 'a330365c681b12dcc7124ced0ba8e4ac', '王雄瑾', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('103', '20140400', 'e959d6b6e128d9f3cf6fe7ac98f9e9a6', '范俊良', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('104', '20140401', 'ab6e608eb01fc644f2c3d79f42ad8857', '张恩娟', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('105', '20120013', '176179dd1ce3e9e1f7f042a052ca16e0', '仇念华', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('106', '20130201', '7c091993b01b3e59ac757a1cae74f80e', '黄琨', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('107', '20120100', '3be7940822880f57cd7b6d3b3472f0cc', '毛更生', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('108', '20120049', '3694d2cc9c0c8f5ad175f9f00b98eb97', '魏玮', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('109', '20120060', '1004ace3bb7aa919e32694f13cfd6ddc', '晏子锦', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('110', '20120046', 'f50fd0c157dbae0d530da0e4ad3f7196', '易欣', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('111', '20140336', '8bb614555e39e444305b38a913a9e062', '金欣', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('112', '20140377', 'c2424c2b1ad302cc60884b2517a6337f', '罗红', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('113', '20140332', '4321d798c912bed3ccd709894aa65f01', '冉启清', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('114', '20140303', '2a643e7f32c64fbf764493f3ab18ff57', '韦云祥', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('115', '20120047', 'c04fb24b947f3493217a553e29c6dfed', '蔡运刚', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('116', '20130162', '4323147198a4f31880c78b1b4f347919', '段筑生', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('117', '20130157', '2c9f5d79c5acfc416e362d42a10998e2', '李辉', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('118', '20120033', '78fd6b261337adb4a3950e3feb4ed0b3', '刘振男', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('119', '20120141', '03d64b5b71723f1736336f67f3f47f1e', '王春江', null, '工业发展研究中心', '3', '0');
INSERT INTO `user` VALUES ('120', '20140304', 'c917a5516809b81a7f1bf77fed6288d8', '吴丹', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('121', '20140309', '057205e6335d943464800ccc32407b00', '余蓉', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('122', '20120125', '7115b6e2f7428aa5e750643fda0e780f', '熊远兴', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('123', '20120153', '0045cc3dcd206934b2c244e07d961cce', '杨立杰', null, '工会', '3', '0');
INSERT INTO `user` VALUES ('124', '20140361', '54c8431e442f751afa6893b98083809f', '陈丽霞', null, '工会', '3', '0');
INSERT INTO `user` VALUES ('125', '20140407', 'a3fec3eaadb6a423ae4f956e38d9cf33', '钟银星', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('126', '20140409', '783ab725cdd2fd3dd619994fc3bcb2ce', '乔靖', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('127', '20120145', '739d70d38d39f35a4e6ea175f495d174', '金敏', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('128', '20130180', '75279d6bec0bebfffeb99afecfcf2e32', '杨再豪', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('129', '20120048', '3925078f3dd9446fff716f16df6f974d', '田蕾', null, '团委', '3', '0');
INSERT INTO `user` VALUES ('130', '20140301', '0811808503370688b4853925eb4c58a7', '王庆', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('131', '20140314', 'd5bd17c0a2b5d31b0d174ad62c1a1004', '周新国', null, '团委', '3', '0');
INSERT INTO `user` VALUES ('132', '20130186', 'de4bdc67ba1138c1274e3ac3d4c1b63c', '李朋', null, '团委', '3', '0');
INSERT INTO `user` VALUES ('133', '20130165', '0956eb0234fbc6c9d56238007e89f108', '伍玉娇', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('134', '20130178', 'cdad2ea3475dd7fd129839458b1ba91a', '李祥', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('135', '20120058', '21f4d5014a870d98bc11db7d5e79faef', '凌敏', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('136', '20130191', 'fe258748da5db0c5f2d4279dc7ad027a', '刘冰', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('137', '20120018', 'ec4f5e5cac2d82c18f06423ef32f9eea', '路坊海', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('138', '20120019', '182a76dbd43702a178e5543170d37725', '罗勋', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('139', '20130209', 'bd799cfa3a50989a2519e6646fd1c2e1', '肖立华', null, '分析测试中心', '3', '1');
INSERT INTO `user` VALUES ('140', '20140437', '4ea598b11464e8de5326d0e393b3bb02', '杨柳涛', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('141', '20120137', '73fb85631acf76f60943ff591bdab964', '袁艺', null, '分析测试中心', '3', '0');
INSERT INTO `user` VALUES ('142', '20120017', '6c3c92df82836c53e1c59c429dfd05e7', '周登凤', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('143', '20130216', 'e4cb74cd56a7b19ae4a1a342cfc55c33', '胡素丽', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('144', '20130214', '4ea01fceaa9f61bbacb7d7ba6ccb09be', '李杨', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('145', '20130215', 'f4c7bbe1e344fc44d77141ea3f5cd587', '曾英', null, '教师工作处', '3', '0');
INSERT INTO `user` VALUES ('146', '20140386', '1019802586796003a347e7b66b80f9db', '肖利平', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('147', '20120016', '7ac4bc4cc42e671373cd332a98d49831', '李可', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('148', '20120057', '15b2f62243d789b8f1dbef5eda10135b', '彭涛', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('149', '20130166', 'fbda6cec5d40f5b2442deab66b789289', '王忠奎', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('150', '20120056', 'e43c4a4b0d3342a80ec12b4d7ed1ee2a', '郑伟', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('151', '20130227', 'ebc1a357b48529d5800c0cda352d0db1', '芦庆和', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('152', '20130228', 'fd3040f8c105e19788bb72e172af800c', '钟诗颖', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('153', '20140316', '39325676e429835a0023252ef1f516a0', '李海军', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('154', '20140340', '8eaaa933555be37ddb7f86ca0ab85219', '刘萍', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('155', '20140296', 'a07eeee6b3fffd6afa4e049039d66649', '穆静强', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('156', '20140305', 'c8ade9ba5a80746b9ed5755d106e1f05', '吴建琼', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('157', '20140318', '0bc9be6b65f2490c71a58fb38cb4c6bd', '徐浩', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('158', '20140408', 'e8b3c276f93e24a1ef9f9343c2c94026', '覃锋', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('159', '20120151', '9306c5ae44fcab4eda59df83de047087', '王婷婷', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('160', '20130193', '6976183a77ece96cbc3ec7725c1513ba', '肖迎群', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('161', '20140363', 'cc264dd8d6fe3f1d13724f9801fdefab', '陈燕秀', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('162', '20140364', 'cfa7aa84599205bc043ea9f7ba4349e2', '陈以华', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('163', '20140367', '1c34ff215dff6b4400706e6f39c60011', '高虹', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('164', '20140289', '985be53839ed13722fdd0e814f94d984', '郭华华', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('165', '20140335', 'ef5ba41ab3fd6e1faac8be03beb96ce0', '黄政', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('166', '20140339', 'd6808904799d8aecbc1ab057777daa36', '李鹏', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('167', '20140341', '87ef9964add6508c7accb16e07f0f4ae', '刘燕', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('168', '20140344', 'cc47f1af63dd1699a7e5056d8585663b', '明德刚', null, '创新创业中心', '3', '0');
INSERT INTO `user` VALUES ('169', '20140302', '78378d4ee2abf6f0d8e6194237c4ab7e', '王世蓉', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('170', '20140385', '0b471df0e0f22886a95e9e1a02e57e8d', '向俐霞', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('171', '20140310', '8b250d5872cdb5a61a39323971e23453', '张承维', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('172', '20140322', 'e515c4daae6c894f74f3949d375d6d00', '张均', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('173', '20140357', '5bbcb59a3b5bbe2011f9a5de24a25929', '张生梅', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('174', '20140325', '65f092eaff61a0e0450f9c5f7091d365', '钟普光', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('175', '20140352', '87266e39a12ba8185d74afe4f99d5e26', '朱珠', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('176', '20130173', '880130b565ff7ccc4a0011ecd06dcae0', '徐平', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('177', '20130194', '3d5e10c5af6e320ab99dfcf5ef745a20', '邓莲丽', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('178', '20120028', 'abf540f78ee999f7b037f962fdc3a9a5', '冯晓琴', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('179', '20120138', '25245771c974094d1034df0b86be97d1', '何星', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('180', '20120025', '48138c9cea5b5cead72dba58dad5cfd9', '韦德举', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('181', '20120105', '4423f2b2dc89f3086de611ea263c06f0', '杨春', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('182', '20120027', 'd946d9d4d32b70a89b203adb34925954', '张文娟', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('183', '20130183', 'ea305615bb16b185eea374588bd9baa3', '周利兵', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('184', '20130235', '1c11c3b6434bdeadc7d03495d06e6bd9', '冯双', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('185', '20130234', '4f9c4ca49682a8aae26b1363f47840d2', '李静', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('186', '20130237', '1b5b6c7f0c19845b4b576209d12c0ee6', '张红燕', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('187', '20130236', '391e0fa13805dd642b3490f7f9b2719c', '张妙鹤', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('188', '20140393', '919182aeedb140773a044d08a325bd2e', '唐安江', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('189', '20140395', 'e5cb23791e1e32af268805e246e7e186', '柏松', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('190', '20130197', '95bca9ae1ceaeb26cfaae1964467d5b2', '陈海虹', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('191', '20120120', 'd015d4016990b599c5f69b1c2dc69d62', '高兴勇', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('192', '20120020', 'ac949429afa4999abd0e4344b0522f06', '吴艳英', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('193', '20130202', '894b543f135b05dec9bf206960fb64a8', '曾萍', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('194', '20130224', '5b9ac4bf4910a769b22a7890795516c0', '陈兴燕', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('195', '20130223', '624634dc1e923d9365b331bbf25cad6d', '何船', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('196', '20130218', '44959cf70fa790efcc7c99a11ea23a9d', '纪斌', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('197', '20130221', '7b413f7533df2d96a4bc926d8b1ba278', '黎书文', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('198', '20130220', '7cb36b763976381dcaba880a2d12d3bf', '路芳', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('199', '20130222', 'caf935ee824cb7d25655aaece155cc82', '潘克强', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('200', '20130219', '726ffb3b36459ddfddd25e7b18df4073', '孙栋', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('201', '20130217', '7e8cf6ea7ae6bf08e6fff0fad2a370aa', '陶亮', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('202', '20130225', '97165544d4a0b677a43edf3202be871e', '张宪明', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('203', '20140329', '3fb1763528fdbd5565c49fbec508cc60', '李国俊', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('204', '20140379', 'd4feedb99fd61bd748614b83a66a0be4', '蒙朝华', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('205', '20140321', 'a48dc45769448c6c1eeb15832faeb21f', '张传艳', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('206', '20130176', '72360cccd63a186c87d94112d0fc6f91', '陈晓英', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('207', '20120063', '60ddee094179d4ce655d01a6cdf2dde2', '程尤俊', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('208', '20120029', 'a29c1edb441d8454d79d0c701db46c65', '胡婷', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('209', '20120118', 'd0f169f25dece408a81619508fd8cf54', '章健', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('210', '20120066', '56614430a2e17a073ea911cb7131edcb', '杜群', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('211', '20130206', '5c3c0936f6bb7a91b27d90e78d651a5d', '胡薇', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('212', '20120032', '4a04ac169845b72917b55c89448308e8', '唐惠', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('213', '20120140', 'f00f1025d2c7b65a7c8e194077a5f9a8', '王冰一', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('214', '20120126', 'b97c0b27fa3b8057365015e234cc722b', '杨雁', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('215', '20140371', '4c0bed52e7365c9fedb06bedf03576a3', '李静', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('216', '20140372', 'fdd5f6e39e4549ce348f2640c1c16c25', '刘宏', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('217', '20140378', '639bfcb8e3f066dddf409a9e0b1dd046', '罗建', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('218', '20140343', 'f6f011bb7815994a1e7b27c32713d8c4', '马晓丽', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('219', '20140297', '94995b9993a5808312a34c9db902bf6d', '秦凌云', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('220', '20140323', '2d6ab982dc4905faff59e23efce93832', '张天钧', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('221', '20140397', '54e351ad1532590a4dda8326a8ebf974', '潘启龙', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('222', '20120031', '23ff35bba6cb8f1ca7f98a865332fb82', '周茜茜', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('223', '20130239', '2000cbb29151bfcf9384bb5925df0e14', '李鑫', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('224', '20130238', '7baacb69a478359f4f6a6fbfc1b9024e', '肖雅文', null, '招生就业处', '3', '0');
INSERT INTO `user` VALUES ('225', '20130204', '73eeca3440ae69a77164f92b70f97748', '唐丽波', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('226', '20130174', '2fe63dcce8e110938fdf878a4b2cc6f9', '王琳', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('227', '20120130', 'a65e11f72d86bd9587491dd4029fc53e', '张艳', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('228', '20130210', 'f80bf7eebd0a6a82b12cee7023a1f12f', '张挣鑫', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('229', '20130226', '3ec6e53d82cf4cc7f3f05d1d58e4e3ea', '段莉', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('230', '20140317', '163a7e2825356ed53d171ffb325cfe75', '宋卓兖', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('231', '20140365', 'cbe7c76e8d8546463cbfc2c6a0ab6750', '都焱', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('232', '20140287', '30cfba6554fe9dd95a061b2a22c2db6f', '冯梅', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('233', '20140369', '21d7d53188b1d8e32ad5c53d93540843', '黄先伍', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('234', '20140330', '40cdc38cbcbbc24b02276b7bf92cce08', '刘黔会', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('235', '20140374', '7e28aa922a90d85b40defa06c2b9e4c8', '刘秋美', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('236', '20140375', '8bb5d18f6c0b4bc3fa52f203ec47d8e4', '刘秀伟', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('237', '20140376', '22435356284d04b95fe64364455e14ad', '鲁海梅', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('238', '20140382', '6d72ddcab2b8d0a97b0aeb169c612771', '秦冀耀', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('239', '20140345', '797f9c9bea3af22290a395b0ff3afa3f', '沈汝伟', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('240', '20120024', '6783cbdcf57d78326f671eb7c0301ebd', '程星晶', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('241', '20130198', '81013d8a5b517161614db6807020e76b', '高应波', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('242', '20120023', '8e19c3d3a0089abc21010505a107e9dd', '郭晟南', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('243', '20130211', '56e8b2001d5b0720c7ecb3b4ed8a6283', '胡文生', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('244', '20120122', '59ddb7ecd1e283a9b517f10f95529a65', '蒋学勤', null, '工会', '3', '0');
INSERT INTO `user` VALUES ('245', '20130190', '9e07ef6c03a16a056f4c43b585607020', '刘继乾', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('246', '20120059', 'b15b38b61725a7cd6956c2d4e1330cd2', '宋春丽', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('247', '20120061', 'c14602d93fc3ed62fb7f9966eb369037', '张森', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('248', '20140327', 'ab972f4544ff212219335ccea853fed3', '陈晖', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('249', '20140334', '87946a99bc26f743906c56ab228ad247', '耿植', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('250', '20140368', '3fbbcb73d2d1ca873d12c20fbad320d9', '何婷', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('251', '20140291', 'f11587afc6e40ea8b81d97d9b4d3b15c', '李丹', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('252', '20140295', '3b0c68613f71155a79f104b01ff64812', '刘毅', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('253', '20140319', '7e13a98c2ac6d5f1a26b41fbe516212b', '杨琼', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('254', '20140324', '3a64f1652a48182d1fe8cd76b764e8e8', '张毅', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('255', '20140326', 'e930a54cc0d2179365203e8575d6e32d', '邹勇', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('256', '20140440', 'ca7d045d1ec5defd886fcb61cfc8945d', '张克声', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('257', '20120099', '12e1a6ae225e98cc07375191bc8d0821', '郭红', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('258', '20120064', 'd53a8622471ea8f930b96c48606d2d78', '胡女丹', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('259', '20130189', 'c9980938caec77767de49dbb3c873a32', '黄名正', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('260', '20120030', 'a0084a92890ffe16ca6610948b49f3ce', '李燕', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('261', '20120026', '49fda84f15bb3924adb755543f5698dd', '卢永仲', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('262', '20120065', '49805b5d0485138d49cab9190c6a0108', '马小彦', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('263', '20130181', '640602fabe54bfe93855e594bc083a04', '吴琴', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('264', '20120136', '146eb7b6922881ab8b2734e3ebc7a5bc', '许存宾', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('265', '20130231', '9978ce62c1a795ece0374a8850a6d940', '覃引', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('266', '20130232', 'cf121ff7b9a7b6394566bb43f72c083d', '田兴国', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('267', '20130230', '864ebfbd9d3be871fa10321169a11889', '王涛', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('268', '20130233', '4d30b3b1c6266521cfeb582fd99c80cb', '张丽娟', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('269', '20130229', 'dccabfb710338833a1f6c78362875759', '周剑丽', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('270', '20140383', '05cfcb6a54ad3738c973677bc58cd1b8', '沈丽红', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('271', '20140398', 'b3fe1e06f13f6e72952faecab9a7882a', '张振', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('272', '20140442', '8042320c5c11bf6c6980a88425749b12', '刘海林', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('273', '20140396', '236ab90538e9bdac8d5104f92ef91b86', '张亚洲', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('274', '20130203', 'fa99760a50dea7c73fd7faa085a3fc84', '白朝益', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('275', '20130284', 'ac0db2251ac5e94d49c5af0495ecedb1', '崔滔', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('276', '20130187', '7adefbb6bd23b7273e66eb0f410ed422', '贾彦龙', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('277', '20120116', '782d4b0140efaefcbf3dc99e52dea899', '李桂贤', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('278', '20120155', '05ffa9db29f187dff2ba895d71c5ba94', '刘幼平', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('279', '20130196', '35411c6dc737320be392aaf4c22d4384', '聂爱国', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('280', '20120106', 'aebb2215760d7af465a3cf027f99b9d8', '潘福炎', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('281', '20120139', 'b1dc165bc63d435b6b02f84d0f2297da', '吴开慧', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('282', '20120015', '269e9a1cb9f6af791579b3c591563fe5', '张双菊', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('283', '20130188', '86b3b11b48d81c77da8d32422b4d149d', '张颖', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('284', '20130192', '2067446e475266bc84de3117a76a2a40', '邹树良', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('285', '20130213', 'be2191c4374f5d1e6501fb286fa0c681', '邱燕', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('286', '20130212', '239b07d4b2834cc00570520f7639e71f', '孙军', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('287', '20140370', 'e8235144ab9a1368fa5d33c339410ca8', '黄娅', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('288', '20140381', '0cb608f08012531001a577d1955b5a08', '彭兴无', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('289', '20140405', 'c55073fa5bdb6270697f115803c19ac5', '于晓红', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('290', '20120069', '1df4677e5a78c16a032729b9637f73c1', '迟楠', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('291', '20120114', '105841aaf7c3b04bc37c9f2b79e80655', '李青', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('292', '20130195', 'af3d2402e9182bd3240bedf29ea109c2', '李智玲', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('293', '20120070', 'e1400b281f2da323eeb4bd3a7b10a5f5', '刘葵', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('294', '20130184', '11e48b16e58b4be2de3cd0456b5ced63', '吕井明', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('295', '20120067', 'acca8b0f1fa0fcfd8324d2747860e0f8', '夏辉福', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('296', '20120068', '5431ccb9951a2797ba2ea0111bcae3f4', '徐滨', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('297', '20130257', '67012718a57c9eba18bb5af84802bc07', '程莉娜', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('298', '20130251', 'bfde62adede3bf773dc68d1beb13561b', '冯发勇', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('299', '20130260', '704ece80a6499150405460712f3b5bfb', '胡曙', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('300', '20130242', '3a8203ac69d6e79332d744dbae1a0a84', '黄红梅', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('301', '20130252', 'c233637f038ebf2c1714c6e8fbc481e3', '黄磊', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('302', '20130258', '5d970c072f303bca7fed42f2846c66a5', '江胜菊', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('303', '20130248', 'd43efac7aed2c6bba54ef44c268914cc', '景湘李', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('304', '20130261', '27627ba6501a94533cf21a42a8f55dd0', '黎华琴', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('305', '20130259', '87ac586dda1b005cb56d79c02b68da3c', '李朝胜', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('306', '20130253', '0415c191ba8ec5ad9b0bb55f51fd3d8c', '李淑慧', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('307', '20130249', 'ce82e6dde44fe771a5f9ddb51c470e9c', '李晓利', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('308', '20130247', 'b1dfc7b592d463459bb33a58ab6c9666', '刘静', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('309', '20130254', '5b50535720ef27b09fb33b7f78237091', '刘小钦', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('310', '20130246', '6882b8221a3da87ae15c8810185fc6df', '宋丹丹', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('311', '20130240', 'aabfdafa91b200e821da8f70e50521db', '宋家彬', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('312', '20130256', '4dd3dc09d5ae94ad237fee16eaf6b8a4', '苏琴', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('313', '20130241', '379808a08c37e5e4c78cf6fa06bb4c5c', '袁红秋', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('314', '20130250', '6ad7e0889df35588b6f9fcb02b5cd634', '张豹', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('315', '20130245', '8fc0a508e99b783276043ed6709eccf7', '张广辉', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('316', '20130243', '0b87e6dd6bfecfe6522f5f2b1fbee33a', '周广东', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('317', '20130244', '17bd9219fe1f223ad93b55f09ce16d3a', '周靖楠', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('318', '20140337', '84af39a6cb3376d4dce638951a2e024c', '雷小青', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('319', '20140387', '1429ac181f33e061fc46cde393c35b6b', '肖志俊', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('320', '20120072', 'a16260a4431e33466b87e7ecc491bb71', '单李欣', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('321', '20120035', '705a69f3cc3afc1fc5d5413ebbcb2137', '冯建平', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('322', '20120074', 'cc9a82404a0338abcbe2d47f081e2640', '吉胜芬', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('323', '20120124', '689b364daead0bc31c97514b5a4bb00a', '李会菊', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('324', '20120036', '7ec8c3e306acbee62a6a401e58599d90', '刘婉婷', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('325', '20120075', 'e51c8735261312a113dd1ba9d8213c8c', '罗秀英', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('326', '20120073', '476bec5e74a086efec944425fa386058', '唐明琪', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('327', '20120107', 'c71881906d215382170ac8f57db1630d', '徐丽丹', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('328', '20120142', '1e40fc90507b480c88a882c1a98736da', '严峰', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('329', '20120071', '318b436e2339cc4270a26bb019e52b0e', '周华北', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('330', '20130171', 'f22e4b71e30531a98ad1c9d8700aa2ef', '周丽', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('331', '20130264', 'daa80748e0dcacf89f8a1591d7344bbf', '柴祯祯', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('332', '20130268', '7936cc9d5a03e48b5e386772a143db11', '吕孟巧', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('333', '20130265', '6a98bc84e1353ecabb07d960de244364', '欧旦阳', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('334', '20130267', '3dac30e2c6b4da52fa26b577d2a44972', '韦唯', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('335', '20130266', '6252626a31c133355234f12372d5e4a7', '文吉青', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('336', '20140346', '16fdd4b67ecffcaec3ef3c2d361704a7', '苏博', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('337', '20120113', 'ca73ae43e3a5123155efd19c884214c0', '敖以深', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('338', '20130199', 'bf4af01b1a416dd15ad58294016b6e9d', '李辅敏', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('339', '20120037', 'b7f5350dfd84b8bd19ba73e14a64d484', '程涛', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('340', '20120076', '9146978cc1264eda804b24f3d43b1b0d', '刘松', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('341', '20130156', 'dd33e58c2491368219de98f06f78c25e', '路一村', null, '马列主义教学部', '3', '0');
INSERT INTO `user` VALUES ('342', '20120147', '6ea2ff08a407499b5a5ee656fe12ad09', '欧阳德君', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('343', '20120078', '1bc59435bc0dd1d940ce74ad0012ace4', '田莉', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('344', '20120079', '311cc359af824e093910f7f1ef4387be', '王帅', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('345', '20130200', '7845421ce5240b301ea61cc6f587efbf', '王香莲', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('346', '20130205', 'c1a65d9b69880887af25fffb74dbe37a', '杨亮', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('347', '20130262', 'e47aa43d8b13e920748586424efec523', '谷骞', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('348', '20140354', 'b0e7839b046df8f718a50ed63af2340b', '陈钰', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('349', '20140338', 'dee0e5e656fccfa8d405f249a3b5535e', '李海艳', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('350', '20140294', '0feaa45f5b8f870ef527c54908dbd9cb', '刘苏萍', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('351', '20140342', '5ec7cc4899d2eb9315dae8aa839900d2', '马霞', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('352', '20140384', 'f734d3fbd3bcc5abc56a76e2af82dc2d', '王家洪', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('353', '20140311', '27186eff84d2f2dd9200942f457c256d', '张建军', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('354', '20120081', '5abc2934143994f793676c3a389d5ebf', '陈晓春', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('355', '20120148', '0de2155cc68fc5522d2ba15fb4440593', '高徐', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('356', '20120082', 'a7dabcf5ab7dcd190f4523bb48ab9fb6', '郭站', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('357', '20120039', '4b9e67cbd8c93af3eab158756ab57bf2', '苏雪姣', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('358', '20120133', '030b39c89b89c686548896fa76af959e', '孙赫男', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('359', '20120038', 'a0afebb0bb57fcd005becd0d22cddcfa', '赵鑫', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('360', '20120143', '501e9931b2b46fbc5049857a99fe13b4', '赵艳平', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('361', '20120112', '6f95f3a5e0620721439089ccfa850ce5', '周灵', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('362', '20120080', '44811ed7ad38052ec46d0527cc6ecd8b', '周亚君', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('363', '20130271', '931bdf2f998aa2f8193b8860c313af46', '常璐艳', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('364', '20130274', '6671d71d06a8b1dc3a8139160da9252b', '侯生辉', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('365', '20130273', '45c1b83b9d6a297c086f6c3f74cbbdfc', '刘世多', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('366', '20130272', '71ef98e90d777ff2f524627012921493', '彭丽英', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('367', '20130275', 'b3fb8831cc212ce84dfa97190fb81f44', '田广', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('368', '20130269', '481f921d4014cbb1fc1638853a0cab87', '向荷璇', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('369', '20130270', '0a5db254b1d7cba34e3ebd10af919346', '朱桂华', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('370', '20130169', '1ff809f20251208f9d9827ab9db0ad6c', '黄念庆', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('371', '20120055', '861f7431f2c55c71232bbf3aceffb471', '金璐', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('372', '20120052', 'd1651b219f0e9c41c5a43628038a4b0f', '李恩', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('373', '20120054', '674868481ab830d5a731dd041fb1dc3b', '刘平', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('374', '20120053', '30538ea029475128fbc6c6354db917ba', '杨海兵', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('375', '20120051', '2194e89ac05f7be7533124cde56ccfac', '赵艺璇', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('376', '20120095', 'cf2ba138f326cc730ad58cc1a439ef9e', '钟晓锋', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('377', '20130283', 'd4910cd216d3c2c70a2adb30e8aba6d4', '江维林', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('378', '20130280', 'c1d8ab6d17a013d146663b7ad8e7ceab', '刘旭勤', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('379', '20130279', 'b1db21bbd5238b7b04c29174db51407a', '马智慧', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('380', '20130281', '619bd4f9c112cf7d93e13f4461c9fa5c', '王冬明', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('381', '20130278', '3a1f2304718a5f8792f8efc6a95115aa', '赵小英', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('382', '20130282', '5983e2ddcf9c6b66a9b9ef88dcbcc0cb', '周琴', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('383', '20140312', 'af1fad945dc0b1dfdbfebfe2dd1b5834', '张经省', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('384', '20120108', '7819e815e33a7997b259c10186708e54', '刘萍', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('385', '20120098', '0421afbb22aaae0c9cfb6bdbf8e31669', '刘云川', null, '学报编辑部', '3', '0');
INSERT INTO `user` VALUES ('386', '20120121', '681684afcdf8054112de27c2da6a5b5e', '刘恒', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('387', '20130182', 'd551da5f55242e96b9bf40bd88b213d3', '刘瑞', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('388', '20140366', '1ea144f0cd287ab92b8e74c619c1ef1e', '范玉霞', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('389', '20140351', '30ca1ca2eaa7e7ee5faa6fded82ed4ff', '朱丹', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('390', '20140399', '5a402e9c1e5951e78b8e6230bed2eb22', '陆定军', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('391', '20120134', 'd4cfc0b7e7b5131be4ec4329c0dceab7', '莫紫娟', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('392', '20120152', 'cfcd44727d49450b6b0353969f3f66a7', '杨谨羽', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('393', '20140349', '883f30b92023670f5cba8250a9c56837', '魏节敏', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('394', '20140306', 'fd35e4e5abaa38a75ce9a30b300a5534', '肖丹', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('395', '20140307', 'deefcf56068c257c500809977d8567ab', '杨佳', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('396', '20140308', 'cc6764bad02e8ac53a70e60d4655be5b', '杨敏', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('397', '20140333', '429c0d1f8f8f1aa3f0a2dadbac83d469', '曾劼', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('398', '20140320', '2abb15b2158b65779f348a5b83829585', '曾懿', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('399', '20140353', '9b3e069945201e3b8b5c6b0dabff31cc', '卓涛', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('400', '20140411', '506ffa529b29965e752054921e8f7aaf', '燕梓', null, '工会', '3', '0');
INSERT INTO `user` VALUES ('401', '20140436', 'e2888f578add60f738da4a2f5bb400c4', '李丽', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('402', '20140417', '7ccdf8c6f1e3f0c6ad9cb981d8fac930', '孙嘉龙', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('403', '20140410', '3396ec84858608b7fb98de830f9b23ae', '陈再灯', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('404', '20140412', '67dcd31858ec89d575a27aaa3d6dfd91', '何雷', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('405', '20140413', '60ad65cda02255f2dad920a0970bcec5', '张伶', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('406', '20140414', 'eea8c3fb57e97d8a42b1814020522638', '钟小勇', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('407', '20140415', '3a5cfaa2d506741beaba80c546d4c511', '宋明昊', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('408', '20140416', 'fcbd2f8367a32753c1ca2487975616cf', '谭东明', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('409', '20140419', '3049107884b91b1878da976ed5aec13c', '彭宏炯', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('410', '20140420', 'e66fa37642ab33896c095a3aaf89b599', '彭宏星', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('411', '20140421', '381d13f4e3a0a584fa9035eb1822e56b', '曾万琴', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('412', '20140422', '2f59659afd8efda40a82c5dc01d0e678', '周洁', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('413', '20140423', 'be39c39b2c90c8a70a4a89e7f767fd5b', '宋丽琼', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('414', '20140424', '4411fb81270c6073c4e125ee52decf48', '赵明惠', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('415', '20140425', '48407c77c17036ec7ddd1f36cb50265f', '王玲', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('416', '20140426', 'b65eacf69ec99062a79092fe6b09cf15', '王福禄', null, '国有资产管理处', '3', '0');
INSERT INTO `user` VALUES ('417', '20140427', '5777c91b735f4c1932d99db69db2a767', '梅雪林', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('418', '20140428', '95052e599829a209680b47fa6e9f68fd', '蔡群', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('419', '20140429', '50484049694fea82241ca6973c718b5c', '廖志恒', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('420', '20140431', '7022291ba17785d9e59611ff8081010d', '罗孜', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('421', '20140450', 'd7646184a9355dd10be0828849d57b8c', '许定红', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('422', '20140435', '4f2bd2aa4d3ce3840c44d01f5a4af0ef', '杨云勇', null, '信息网络中心', '3', '0');
INSERT INTO `user` VALUES ('423', '20140432', 'b476ad3cb14554737dc43d931553708b', '蔡晓晖', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('424', '20140447', 'ba6f0650d8f474a550c90bdd0df9109a', '华岚', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('425', '20140430', '104dc07bf76bebbacf3ba65dca23a3da', '孟碟', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('426', '20140445', '9b85ddd4531318b7fffb3fb6d0e82623', '陈娟', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('427', '20140441', '58ef72b629dbe4d97ccc3cfacb8eef1d', '秦庆东', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('428', '20140439', '220b8ca1286ab32f5b7f1f1bf18001b1', '李幸', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('429', '20140467', 'f7e0cbfcc796bdb3664aacef61cd83c9', '刘艳辉', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('430', '20140448', 'b847a8ae0c74c8ed8d4d07d321f3fd7a', '马佳', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('431', '20140443', '4713053a37db1e425bd1129796db012c', '刘莹', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('432', '20140444', 'e45de71fb368eab4ba413d9d68990c5d', '蔡诚', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('433', '20140453', 'b898275ccf16e52c70b0c26dfd4fb6f8', '郝飞', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('434', '20140456', '4285f4f69a50f8cf45ae31c04e1900ba', '刘路宁', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('435', '20140460', '47a8db381cc2c284448404ec25281fcc', '杜玉红', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('436', '20140455', '1f2fc056a052e807f94d99f274d501f2', '李贵平', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('437', '20140451', '59bbb206202ac20af1403eeb501e28f9', '潘健林', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('438', '20140452', '81667c2fd703d1ead9c4eb5096013464', '邵四通', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('439', '20140461', '5d6576b7b6d69547dc880af0beb0ae99', '陈刚', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('440', '20140462', '47b358f073162c7103ee31d534096ec0', '魏瑞君', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('441', '20140457', 'd6d385229338c60314a5433a310d159e', '王万坤', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('442', '20140458', 'f693acfda4b5d9e5ad17d308e41bce98', '刘显利', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('443', '20140465', '23a40ed9e8c9f1b6ade4794b3370110d', '周曙东', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('444', '20140466', '4814af451d110ff6da32bad5cb9f6794', '杨迎华', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('445', '20140472', 'ea3f73e5d178abd53e5d09c236e8980e', '陶玉', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('446', '20140463', '8f8ae3a7bbc963418237a065d674d5c7', '蒲见平', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('447', '20140464', '910c9aad7e41422ab55749b2c256fa49', '彭立飞', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('448', '20140468', '06cc4cf0cea7e478059404dd89269d82', '蒙蔺', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('449', '20130276', 'af311581884f9d082bc12382aad7efe2', '夏黄晶', null, '教学质量评估与监控中心', '3', '0');
INSERT INTO `user` VALUES ('450', '20140433', 'd53ad38862b6092bf20710720c4d43de', '林蔚', null, '教学质量评估与监控中心', '3', '0');
INSERT INTO `user` VALUES ('451', '20140541', '5921b2823f07d0d9468ff8216f06cfa5', '王新颖', null, '教学质量评估与监控中心', '3', '0');
INSERT INTO `user` VALUES ('452', '20140488', '92a33e0af35b1a307b7bd4a343df3c59', '丁阿丹', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('453', '20140469', '493459573094d0a9d886043941e079bf', '曾成斌', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('454', '20140470', 'a8bdc624ac53a050a4e0b68b4ba7d0c6', '罗波', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('455', '20140471', 'b32c24986225aed79b595040c2ebbb77', '李志新', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('456', '20140475', '48094cbb03a3f783b8da3e8c1ccef83d', '杨泽龙', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('457', '20140478', '6d52e2113d37c5d26725177223312ec3', '程国繁', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('458', '20140473', '7f87bb761df1a57e17abc390e11c1c70', '冉景榆', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('459', '20140476', 'fd904b0c26e6e6106a4e4e237ff8e57e', '李纯', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('460', '20140474', '58547b6c90e456956cba09dc517125b3', '袁小松', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('461', '20140477', '264744e1c146ecb03d78c73b7ded6069', '谢晓博', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('462', '20140483', '628845978f45d95635471a3bfce2bcca', '申偲', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('463', '20140484', 'a4f4d7876f75a49a1a5ab71e77eeb1bd', '吴强', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('464', '20140481', '1a41ee141215612cb653479869d83a3f', '黄宏升', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('465', '20140480', 'de20101debe737e5f4a9c456a712093e', '于宁', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('466', '20140482', '40ff2579319efd550263683d3cc079a4', '陆艺', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('467', '20140479', 'a91c504edee0e860014a34ca4025522d', '肖德安', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('468', '20140564', 'c41310b186f1a744ce620e30b738847a', '桑彪', null, '保卫处', '3', '0');
INSERT INTO `user` VALUES ('469', '20140565', '3bf255e06890ded3963b0857a968537e', '陈卓', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('470', '20140486', 'dfac9e5c3a25b5fa50da4243893d8bce', '郭东贵', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('471', '20140487', 'c8d3936e06f573b50ef716cccc3adc5f', '刘刚', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('472', '20140489', '26022896d2112e05354bf66c9e12432c', '郭晓学', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('473', '20140490', '9b3a9bf2807f128d33c3d557c02d6b1f', '苏凡竣', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('474', '20140491', '3de22332b5223d0951f4b8fe260dcde0', '邓雪梅', null, '团委', '3', '0');
INSERT INTO `user` VALUES ('475', '20140492', '690d0f44e9d9326125a3c4dd40f88771', '樊玲', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('476', '20140493', '60dddbab1d6028faf81653521c35d54f', '荆晓伟', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('477', '20140494', 'ec2872637f6b6e8fc3bc6b0b08e846c5', '卢福丽', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('478', '20140495', 'df47ca46d6fdf2533f4bdea424a724e4', '牟玥', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('479', '20140496', '9575ff80d85b94bedb8d078e410c4380', '于庆磊', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('480', '20140497', '9b8f53463b1cf6accc7c735a6ca49c00', '曲鹏举', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('481', '20140498', '727523999da100c9c9b810bbea2c1a11', '黎佳澄', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('482', '20140499', 'a8a2c0c303d6633883e7e63532c8f0a2', '牛筱萌', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('483', '20140500', 'f5bfd379ee10063f82121b85ec0e953a', '谭殷', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('484', '20140501', '6dbd25164ad8b0f01fc1b70bf0cad336', '唐思齐', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('485', '20140502', '9a036ca73cab6a53abeee118a7016674', '谢海波', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('486', '20140503', '83977dbca7431837e5baa235a62ab890', '曹守刚', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('487', '20140504', '435fcb024e7370cb56c189ab7ecdb848', '都璨', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('488', '20140505', '125fcf9d1dafb7485f10db9f924bc36d', '刘旭', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('489', '20140506', '4177db1b5e91dd9e7f3d92a768b7d538', '陆红娜', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('490', '20140507', '1e80057d01120e0c33e5150d24aa4dd9', '任旭', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('491', '20140508', 'baca0e3212db689b475eeb4264ad19eb', '汪权明', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('492', '20140509', '0e642fd52e85d2f72d0e35d9a3330585', '余建方', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('493', '20140510', '34b80e17efec6578aca734c012a846d5', '谢小林', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('494', '20140511', '3502aecac7e1768a459c9d317db21783', '赵贵丽', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('495', '20140512', 'c044f75270462774ef6834a718ba53e7', '方宏萍', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('496', '20140513', '7485e12c5cb44051482a9ea5f28232fa', '李怡', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('497', '20140514', 'fddfa66314bf5411cc6e736f697d2172', '丁玥', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('498', '20140515', 'a533edf59f7eb41f25ee1d3c73c11e4a', '冯静静', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('499', '20140516', 'd27fbc769b544a848913f7343875acf6', '胡友平', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('500', '20140517', '83dbc4e087687b31d7ccf5f72c8ae8c6', '李安', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('501', '20140518', 'de502a864b5907b92de4c4f2a04c0354', '林大任', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('502', '20140519', '4732cc70b08b4dc6deddcddf1561577d', '刘新铭', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('503', '20140520', '88abbed20a4421e5b923e5fcaed92a44', '卢缨', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('504', '20140521', 'd9475f239aba2f30a152ad0b1658b9b2', '秦丽丽', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('505', '20140522', '461b189d46f8676ed6d5a50c7bbf91c5', '汪树穹', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('506', '20140523', 'd0f2465ca0727affccfae33525d39041', '张翊', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('507', '20140524', 'ffd436de525708e4dd89c60a240f4ee4', '郑玉娇', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('508', '20140525', '679bcb4db69a28a820e67dd4537b5971', '靳力', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('509', '20140526', '061d770030a0b53d304125142212cc56', '邵茜', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('510', '20140527', '937556b27f102f13b87d9210abd4037f', '吴莉莉', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('511', '20140528', '8f4df67ef4702f63dd54405d0dbcb25a', '熊宇', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('512', '20140529', '08c54b8667fb823ca42fc59a56d74c65', '王越', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('513', '20140530', '9c778cbeb863fdd4f1ba38142e0455e1', '李向东', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('514', '20140531', 'b078fb097845c692481e55561b224cc7', '谢述琼', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('515', '20140532', 'b47d5d9efa12d3799d946f19facf08d1', '韩正功', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('516', '20140533', 'e9e4be8bbc0db840a1acafa9f61fd6d9', '聂龙', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('517', '20140534', 'e504708c27ae74d3e2203b79b9025d77', '魏娴', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('518', '20140535', 'e6952dcf6ca94415bbda01485ecb503d', '朱芸莹', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('519', '20140536', 'e8cbc026ff990856f33865db581d5145', '高亮', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('520', '20140537', 'bb610a0f0227e2bd8bb98fc3fb4f72ef', '黄毅丹', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('521', '20140538', '996b08b3dcbbe36653cb99943458849c', '李丹', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('522', '20140539', '7f2c5e894f9c84cd7d57c1c7bac6bec0', '卢慧', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('523', '20140540', '68917a17eedd1c7a5875509d902c06af', '沈庭燕', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('524', '20140542', '2756b15cdc178755aafd8287b11f6929', '徐新红', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('525', '20140552', '5707e33bcf2184dd7d1e472cf24c2a9f', '刘坤', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('526', '20140553', '868ed65caca8e78f90595e66dd1e1cf4', '张敏', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('527', '20140554', '614624758bccf02441f532117a06f5ed', '周大任', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('528', '20140555', '0c344b186a4456ec7d15e8aa7ef256ee', '朱洁', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('529', '20140556', '89eeb95cce83ca675f247f2a32b4de80', '刘锋', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('530', '20140557', 'd5868860e58e0b91b960c25952b3f28f', '周亮', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('531', '20140558', '6b8ed2f904f4978c5465c65569616da6', '王福春', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('532', '20140588', '02e9f4da7bf15616e10e45a50c02933c', '王凯', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('533', '20140559', 'c1106d7acc59628e0ce368111a3cd193', '马连刚', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('534', '20140560', '3a40fe8639c49cbbc7421f4b089da625', '吴其俊', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('535', '20140561', 'd0bced6fd72adf87b8e1ad724ddd7a86', '龚勋', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('536', '20140562', 'd2208cd2a1034c77f1235da80120a4a2', '陈煜', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('537', '20140563', 'e10adc3949ba59abbe56e057f20f883e', '杨剑锋', null, '贵州省“互联网+”产业技术研究院', '3', '1');
INSERT INTO `user` VALUES ('538', '20140543', '35ec63dd4df26080590654ad2427947d', '吴欣锟', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('539', '20140544', 'beb84c825826773da6ddde461ad3cee3', '曾诚', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('540', '20140545', '3a76c1a9ddb42217708103b30e800f47', '刘伟', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('541', '20140546', '5e66b26f4683e5691f03feddaa2d790b', '何杰军', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('542', '20140547', '34006aa998edcbc3f26cda73bc719cd3', '许猛堂', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('543', '20140548', '7acb8cd383f6d3d0ba59544925738b1b', '李小红', null, '教学质量评估与监控中心', '3', '0');
INSERT INTO `user` VALUES ('544', '20140549', 'aef0047e04c5c5720f3ff3b365af360d', '唐文勇', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('545', '20140550', '448d4bd92609fe376f1528ecf3e6a74d', '徐桂弘', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('546', '20140567', '038f5cb68afe4fad878cdad448a3359f', '吕梦岚', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('547', '20140568', '9f71e9d8e6d00cf6aa31de6e8196e372', '李云冀', null, '贵州省智慧旅游产业发展研究院', '3', '0');
INSERT INTO `user` VALUES ('548', '20140571', '8a80a8a058cd6704f722e1c8327920ff', '马先果', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('549', '20140569', 'eff81c7874c77b89a09ca96d5d001041', '马春平', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('550', '20140573', '5e7c8fa8e27903f318d090a1836515f3', '吴德智', null, '创新创业中心', '3', '0');
INSERT INTO `user` VALUES ('551', '20140572', '5c2619b2c37788b7395eb59ca49f5475', '王云海', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('552', '20140581', 'bcf50e373102966b27ffe42f2ab8c4b0', '李学明', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('553', '20140583', '31749798931a526e7178b82cd1e646ab', '蓝文思', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('554', '20140580', 'ea30ae283fef3d358a378bfb4acbda03', '黎春玲', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('555', '20140582', '1af0d31b9bb79ad6ac8f5f36a6f0d6e8', '田小经', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('556', '20140584', '9b25dbf59cc3af2d2e7448ef9f8809f6', '田夫', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('557', '20140579', '85822409c2d4410eb743d69660da2177', '卢家敬', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('558', '20140577', '61137eaa2b1e6215a2941f9e0e275a95', '陈小敏', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('559', '20140578', '5f6bcaaf1af3ed0f1e42898eed8d9cce', '兰新成', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('560', '20140575', 'df0a87325c121802bf3b092b6bd28b3c', '班明祥', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('561', '20140585', 'be1deaca4ab3d92d3de4d8d4ed812d9f', '雷邦军', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('562', '20140586', '94974762df7962bc1d51e1928bb2ad97', '龙汉生', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('563', '20140587', '9a23844d93138f015eba371fa8395a94', '杨志勇', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('564', '20140570', '28c231be6334bca445f591005fabadc1', '黎安茹', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('565', '20140591', '23b2eec2ea569d2da9c9eeac8ccd5886', '赖志琴', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('566', '20140589', '5a102d581cf6f89c82870b1ef815459d', '何祖星', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('567', '20140590', '1c0a775564f98ed82581d4b358464c5b', '周知进', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('568', '20150598', 'cd1fea55f4b7f17236070bc129f98716', '顾艳', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('569', '20140592', '83443cb36b4275a924f4ea27d84cadae', '谢先斌', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('570', '20140593', 'f9f100d5d6c3802f39ce47c92f624180', '张开智', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('571', '20140594', '59abb5ff88fd517a47f05477d7ef1b34', '杨涛', null, '分析测试中心', '3', '1');
INSERT INTO `user` VALUES ('572', '20150597', 'f6f29ad322d6cae2aaefb4a04b06c801', '段瑜', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('573', '20140595', 'd45273fec505236266897a6abc7741a7', '赵天明', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('574', '20150596', '3190f1db6e4dd4bfbb2a72971d161190', '伍剑明', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('575', '20150601', 'cf67aa98bf472ac21646ab5fe165b524', '陈丽军', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('576', '20150604', '4387925c3062a55a3bccfb006eba133a', '朱国飞', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('577', '20150605', 'b7827e8d0401c17b04badafc3ebf1090', '刘仪柯', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('578', '20150603', '43d9cf0c3e6769513dbade0c41056353', '刘丽梅', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('579', '20150606', 'b3ea48ba7d9f066f6b3bf4bca9b9ec30', '邓斌', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('580', '20150600', '5d1803f5f7ed49ab792ad595cfdb34d5', '崔波', null, '创新创业中心', '3', '0');
INSERT INTO `user` VALUES ('581', '20150602', '0869ad0b20ba129bd9642b30280efad8', '尹昌应', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('582', '20150599', '0f351e6cbdab0e92c3387d596dc322ae', '吕兴玉', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('583', '20150609', 'fc8174ba3160c35438effcb8d911edc9', '李彦昭', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('584', '20150608', 'bae3813c5bbdfa40730f80b5bd104980', '肖格格', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('585', '20150607', 'b4660f5eccbf26d59cd43157369cfcf9', '刘爱军', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('586', '20150610', '64ff050db61b9182c50927615bab9d19', '龙前朋', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('587', '20150629', '08c874946846307c45c078cd5931dddc', '韦薇', null, '审计处', '3', '0');
INSERT INTO `user` VALUES ('588', '20150616', '66180cb23212a76d56b0556ab12897f0', '魏宏静', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('589', '20150618', 'b4d132542083d1364022bac8f790cc95', '罗咏梅', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('590', '20150614', '9c3c64cef67be9e19773b4230644f1d4', '张肖冀', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('591', '20150617', 'b0e89566316da3c554117153da0b94e5', '崔美娟', null, '招生就业处', '3', '0');
INSERT INTO `user` VALUES ('592', '20150612', '242d45eb40027e81f38942b1f8707a6c', '廖岚凌', null, '大学外语教学部', '3', '0');
INSERT INTO `user` VALUES ('593', '20150613', 'd7e9a8455f3d6f5138077152f3dc995d', '毕艳', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('594', '20150611', '69fac992eee8f5ed5eb36c6ee12e705b', '罗桐香', null, '继续教育学院、职业技术师范学院', '3', '0');
INSERT INTO `user` VALUES ('595', '20150615', 'e3c68e33de46e79801cf0baaaa227261', '吴鲁淑', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('596', '20150619', 'eae62bc7da182e2baf8f1c3bbfab2445', '张纯', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('597', '20150620', '251422e1696aea5304289f7bf03da14d', '龙琼', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('598', '20150621', 'c038e6f6dceadcaeb36e76372f2103cf', '张英哲', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('599', '20150622', '63d8a2b835b35d9eb93530307f4f8856', '仇伟', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('600', '20150623', 'ba277b39c7ac9246b6384f3687ec7e59', '陈霖周廷', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('601', '20150625', '9098aca79923209a89166579301a85be', '张敏', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('602', '20150631', '6f6c40c74cc0d9b0f876ba6fda6aa544', '梁议化', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('603', '20150626', 'ddef1a5a202c41ce3ecb18dfddeab50d', '陈兴', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('604', '20150630', '5b489b0dc66e22c477a7348e2170a416', '刘杨', null, '教师工作处', '3', '0');
INSERT INTO `user` VALUES ('605', '20150633', 'fd82475573dfb6aee5c92d3300be4e63', '范云龙', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('606', '20150637', '81f807ce5d67f84a3ff0e94a6eaf0d0f', '赵清', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('607', '20150634', 'c94a641c60897bdf08cf301dcb0a0b55', '李自卫', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('608', '20150635', '0bce37a98a07c8085d151955297a2c74', '雷振', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('609', '20150624', 'cb6abe57c45c9236ad48d143d9b7b45a', '黄丽荣', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('610', '20150636', 'e50dc1d00d13c443142cfe3651bba13a', '石春艳', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('611', '20150638', '2912239bb3bfb21f7b63c651392775f2', '徐波', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('612', '20150640', '6fdd166cebb5de350c9bd078c9fbca4a', '杨楠', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('613', '20150639', '28805de31b5eeaab06e6fd0ee18b8e81', '张璇', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('614', '20150632', '3421707c7fa50c475e805a81bc8f25b0', '王致嫣', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('615', '20150653', '5c2aa2c844f67666e9d8e98f81386a6b', '陈华', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('616', '20150654', '955ffedc52acfc12eefad02ab23e36e9', '孙士军', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('617', '20150652', 'd34aa9f3f982ab21d3bd8ec08180be8b', '吴继美', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('618', '20150651 ', '8085283a7d800f908b0ac6ed6c41915a', '冉光华', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('619', '20150645', 'b4b86596d021d79b7f374deb43a78d82', '邹力佳', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('620', '20150646', '22e5f85b6a91dbd186b2e6e35453bf7c', '张松', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('621', '20150655', '5ed43f9571207ec593f15474eeb885c7', '龚云', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('622', '20150641', 'c0ca9d4491d47b5a2a5ae1948fd4087d', '李素真', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('623', '20150647', '6319a8cad291b6aacb8ceaebc989fb15', '肖志友', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('624', '20150650', '72ad1e701aa27e74f4033f20588cf8ee', ' 石宁', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('625', '20150649', '49058e83f0f7656818a581b1aa30d681', '唐石云', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('626', '20150643', 'dfef134c62866522513f52a7d0e35278', '孙书蕾', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('627', '20150648', '3bb5bfb61c2a4abc699ea8c7789b5769', '姜伏伟', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('628', '20150642', '1528306693097611c2a5985cd0323e87', '陈晓翠', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('629', '20150644', '1fd7c8dd99306cf02a3496597ae3bc5f', '廖名扬', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('630', '20150665', 'c3915bcebb16ffc185138ab4330fbe17', '黄芳', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('631', '20150666', '2b74ea3107fd977d337f711cf651a615', '赵秀婷', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('632', '20150664', '9cc7146f897a31202aab65f22d8825e6', '唐雅琴', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('633', '20150661', '0e3db4c27f92321f41e17c345158b3cd', '雷蕾', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('634', '20150658', '7d3fd7b7ac0835f0dacd312c08ef9409', '黄超禹', null, '党委办公室', '3', '0');
INSERT INTO `user` VALUES ('635', '20150657', '4aef7f8e1b667ef0616030308dc0acf9', '杨仁增', null, '贵州省电力大数据重点实验室', '3', '0');
INSERT INTO `user` VALUES ('636', '20150660', '3221d240a5bdcf279f05d3560c182da8', '聂玺', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('637', '20150663', '92487268e1b19c2a85dab0360372ddf9', '毛凯楠', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('638', '20150662', '48c0ea89c6717968a54fc90ff38a5eba', '张玥', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('639', '20150656', '6da5e184a49bfba7aab33ba6e84595a0', '金志远', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('640', '20150659', '6cd94924424faafcb8b6264ba47f7b3c', '霍雨佳', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('641', '20150667', 'c2cd22061ed1aa4034091ea4984292ae', '杨辛夷', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('642', '20150675', 'c2a92343a5b8627ea2bf36772bac4268', '彭智育', null, '贵州省电力大数据重点实验室', '3', '0');
INSERT INTO `user` VALUES ('643', '20150669', 'd03d5e6bb000799c8fe109b52487fcc0', '杨滴', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('644', '20150684', '473d63d14a075a5479b5c0ee0b70304d', '张良', null, '贵州省电力大数据重点实验室', '3', '0');
INSERT INTO `user` VALUES ('645', '20150671', '6d4241bfba7bc9503caf5d1cc5a9f8fc', '黎伞伞', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('646', '20150673', 'ac23d8b47bc817363d88933a0b0b6ffd', '胡馨月', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('647', '20150674', '13ddb480732a1b773e841c6869905ac6', '李雯', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('648', '20150672', 'ee99005ef29a3bd9e44d644ca4c78110', '卢云', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('649', '20150682', '84cc607c7c1cb7e689134c8592959b25', '冯富寿', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('650', '20150683', '5b8c6ab3393213ee02c1074c36dcf403', '陈洲', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('651', '20150686', '4a3894a4cdf82576a5ae179b6628093d', '贾赟', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('652', '20150688', '6e38c4c899785f2eca24db6ba3bba6c4', '薛九天', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('653', '20150691', '3ed7d5461472e8f8ede0b2ed89e129e4', '王珊', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('654', '20150677', '6999613842c2fc6d77b5893e6713a403', '姜晓琳', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('655', '20150680', '75c41810b33bf6f3c406c9afc304a793', '赵曜', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('656', '20150668', 'fc59f28f5cc3fe54966d25a0ef5314b5', '邹俊辉', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('657', '20150681', '850bb0e316e236f7c304ae39fd364bd1', '李玲', null, '工程训练中心', '3', '0');
INSERT INTO `user` VALUES ('658', '20150670', 'b84bed7548c637859754ccf825a207b5', '全宇', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('659', '20150678', '4814c048ef1fdc04787c1344c6c00877', '闫俊', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('660', '20150676', '9f22b3bcd64ba692517fbadb078482ea', '张琼', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('661', '20150679', 'f817d2fbe29436cf107bd3b4bded0c78', '周理明', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('662', '20150685', 'ecacabd6637cb1b4bc64d7796476fcef', '高立科', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('663', '20150689', '102a8a0cc73a049952fcb46f5b72045a', '李永', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('664', '20150690', 'e2d15a282dd09f840cb645bc5722b160', '江旭', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('665', '20150693', '9b230ce9d56f0b290a93b236012f7bce', '刘盼', null, '学生工作部', '3', '0');
INSERT INTO `user` VALUES ('666', '20150699', 'd64f475a68b1a1f83142bcd0bf42479f', '余韬', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('667', '20150695', '76df5ed27a83e8c2db418ef3d59b073e', '陶小平', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('668', '20150687', '026b8e253335768f27a77804c6ed2552', '徐佑林', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('669', '20150692', '945947d56bd4fa4323c5489c822144e6', '杨琴', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('670', '20150694', 'fe0e983e70580e41ac7cec7bc098330b', '程玛莉', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('671', '20150698', '54aec9ff82172bc232315fbf56de3c08', '杨岗营', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('672', '20150697', 'faaa3170282c9f8be41d985098260546', '马舒琪', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('673', '20150700', '4c1d042da534a4c8243b94ba4dcab441', '缪志农', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('674', '20150702', 'dd6d5880a0ec443e0fe62981c83c2751', '姚剑波', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('675', '20160703', 'f446dafece8b6feeaf7f3bef52f99f4c', '程晓慧', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('676', '20150701', '4a4ec58fe063fa49c66df977e59473b8', '焦卫国', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('677', '20160704', '15f3491ef50aa0f15e40141a0fa85b36', '林春燕', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('678', '20160705', '9a05ac2da458ec2026ef51d8ecc52f14', '李敏', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('679', '20160706', '65305e815b5cefeac4c7ad8b9c84f923', '梁爽', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('680', '20160711', '79e163339f450bbdd9c900fc220149e0', '武斌', null, '后勤处', '3', '0');
INSERT INTO `user` VALUES ('681', '20160710', '7cded8ac7c1a9f7fe2dcb6adf7e0247c', '邓国琴', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('682', '20160707', '695686f8bb62fd680e0fdc555d664afd', '王喆', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('683', '20160712', '1cb6c71cbdf2f096b88ef4d6adff13c8', '贺明卫', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('684', '20160713', '9f83a82442502e63f49dbaa08a2357bf', '梁维', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('685', '20160714', '471f736769ba0b9f5bdc61b71af0ce33', '郑波', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('686', '20160715', 'db411798b09f9ed19f6e92c93f4ca91c', '葛楠', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('687', '20160716', 'ef5b687dcb29aa999ebd2864a7a62593', '林长松', null, '图书馆', '3', '0');
INSERT INTO `user` VALUES ('688', '20160717', '6cad5700917ee7fc4d8b0028d74e57ee', '齐心', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('689', '20160718', '3554c28a0e0bb96cfe85b4a646e0766a', '马林联', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('690', '20160719', 'aa3570ce438008430820d1a31cc0736e', '余璐', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('691', '20160720', '23086eb6a9b63631e2da7a4b08c66af8', '周仕忠', null, '贵州省电力大数据重点实验室', '3', '0');
INSERT INTO `user` VALUES ('692', '20160721', 'cc2e4a69cca53e41e100ecd2516fad4e', '李伟', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('693', '20160722', 'b7acf6cd6b4bf7bdc6caf552ce528e79', '曾凯', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('694', '20160723', 'b72fb09a1a209cb0ad0ed8b483059a59', '高麒麟', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('695', '20160724', '7bb4f757b085b9b0d5c0be31d969d9ba', '邓代强', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('696', '20160725', 'f4d820cd555b58fe27ec6a56c4b90b1d', '康义容', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('697', '20160726', '181f21b348163edab810a4df002a5b0e', '刘晓辉', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('698', '20160727', 'b48ad210d2113e5bf76c754a41419f17', '尹天营', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('699', '20160728', '6f66bda88f341140dd87cf7b246fb5bf', '沈逸菲', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('700', '20160729', 'ef32b6a48955a3ec776f2f37125012d4', '黎应芬', null, '科技处', '3', '0');
INSERT INTO `user` VALUES ('701', '20160730', '753c2aa4e4f6d7bc0c9f0e2ab7032b6c', '林丽', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('702', '20160731', '1a864b3213503c47fb7267d2ae99951f', '张文利', null, '交通工程学院', '3', '0');
INSERT INTO `user` VALUES ('703', '20160732', '207ac06537c737dcad40c9090c97a145', '刘力鑫', null, '纪委（监察室）', '3', '0');
INSERT INTO `user` VALUES ('704', '20160733', 'fbc892f6812f3af055d459c54413ac54', '张伊', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('705', '20160734', 'ea5490fda0be8368774b48d661db7bb6', '汪泽', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('706', '20160735', '39caefdcf154d83e36024d36916abfd9', '赵维生', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('707', '20160736', '7a3a7e95175a6ecd8ca8ae1d5de0d46e', '罗源', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('708', '20160737', 'b7ac0ee9138a192cafd3f5036414d679', '刘丽萍', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('709', '20160738', 'dc33848996a480b094c812d40fab089f', '黄彪', null, '机械工程学院', '3', '0');
INSERT INTO `user` VALUES ('710', '20160739', '2b42b9c70916a4e80271a3615fb7da56', '于志海', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('711', '20160740', '7069a57379f88fddaeec5d7b2cd7e889', '张英佳', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('712', '20160741', 'a24b4d454a6f9a24172c14f1c6883c4e', '杨巍', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('713', '20160742', '2aba6a12c52743016818df35243ee202', '任粒', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('714', '20160743', '60e34842ed7c2f440622088cf9c87570', '唐勇', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('715', '20160744', '88a50382bd703e24b0ba87a90721cd93', '杨梧', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('716', '20160745', '4e2552afaad9027e377df7583d9e0521', '杜学领', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('717', '20160746', '0203cb9920481e0c0395f2db87ae756e', '王茂胜', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('718', '20160747', '17a2f2aeb88224efcd78f008568ac366', '杨明星', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('719', '20160748', '9ba428d7e44cc0132a04fb00da81419a', '甘红', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('720', '20160749', '3e7889b41164622ce1495f3fd4ac9291', '刘伟', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('721', '20160750', 'ec1ba23ec4f16604bb611264deea84b6', '刘雪岭', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('722', '20160751', 'c98da75a9ee219de3fada9c1fffd7278', '杨登红', null, '航空航天工程学院', '3', '0');
INSERT INTO `user` VALUES ('723', '20160752', 'f23135ac74e1bb622c81512aa0d78805', '李翔', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('724', '20160753', '512771f2f9906603d9a520673b9b600c', '马超', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('725', '20160754', '5f56176ff54292c8c7d083db8461faa4', '陈燕', null, '计划财务处', '3', '0');
INSERT INTO `user` VALUES ('726', '20160755', '106155f124f6524e30773adf2f9fd6dc', '左柏州', null, '机关党委书记', '3', '0');
INSERT INTO `user` VALUES ('727', '20160756', '36c7de9e7391ca31e65e6b571d23d3f5', '龚燕', null, '宣传部', '3', '0');
INSERT INTO `user` VALUES ('728', '20160757', 'e3c444b7542d70316643e907215f8a51', '韩铭海', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('729', '20160758', '6f72feeae01e635df56367dc8e6ca84b', '江涛', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('730', '20160759', '11ca245eef2b9e2c1b2dadc84f4d00db', '冉亚', null, '工业发展研究中心', '3', '0');
INSERT INTO `user` VALUES ('731', '20160769', 'a3fb893d3003320006ff80b12eb7e93f', '汤志伟', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('732', '20160761', 'df0702fed9114645102d19c199c6ef67', '莫远科', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('733', '20160762', '168e69fe16697b4ea55927ae6850c7e9', '刘晓柱', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('734', '20160763', '8cf3b374b279ffb7e2960748b253ba68', '张玉兰', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('735', '20160764', '62690964f02d62a7e082847590aa7f5c', '张志俊', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('736', '20160765', 'cb672e37d72bf73e718855711321e792', '张世功', null, '理学院', '3', '0');
INSERT INTO `user` VALUES ('737', '20160766', '012016140b21b7972c10cd3f8c729ba3', '郭勤艺', null, '马克思主义学院', '3', '0');
INSERT INTO `user` VALUES ('738', '20160767', '00eaa8cd222b755c3f5cbbd5abdf735d', '袁钢', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('739', '20160768', '57857101c3619e9a03a3d006228c990a', '陈友智', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('740', '20160760', '6fc38728589fca770c48d9dbf2c880d5', '江成鑫', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('741', '20160770', '2ef51a7e722497de5ffa5c670247cc81', '覃庆炎', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('742', '20160771', '4882bf21176475a23cbd8fb624b10c3f', '刘浪', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('743', '20160772', 'ac80835a89b4adf40a8c9e3f32ad1b28', '郭俊江', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('744', '20160773', '5baa78f952778e38a65b98e6f33b6e86', '廖化荣', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('745', '20160774', 'e28b115e9d40263db21bdc6b106c6278', '范杰', null, '土木工程学院', '3', '0');
INSERT INTO `user` VALUES ('746', '20160775', 'a3198ed31a42a5953130360766019058', '韩会庆', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('747', '20160776', 'b71f7ac54baf03dc4caced4efa8a7a62', '王跃', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('748', '20160777', '8d5dbc7b2e88ef666d071523063c3a82', '王俐', null, '大数据学院', '3', '0');
INSERT INTO `user` VALUES ('749', '20160778', 'efe1aee57d82c8dbecc93a546355e951', '杨宏涛', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('750', '20160779', '6c7649216e352a631ff43a22f43cd9a7', '宋国强', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('751', '20160780', 'ced2bdbd4a3935865719e2c3ff87fb6d', '阮拥英', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('752', '20170781', '069f8f51a8d339793a7c809f3f707a22', '冯军发', null, '矿业工程学院', '3', '0');
INSERT INTO `user` VALUES ('753', '20170782', 'f0bdc037b00baf6e90bae31f1b233a97', '陈小明', null, '材料与冶金工程学院', '3', '0');
INSERT INTO `user` VALUES ('754', '20170783', 'dd1123efa0e3d66364ceff22302da25a', '江海东', null, '资源与环境工程学院', '3', '0');
INSERT INTO `user` VALUES ('755', '20170784', '61aa61b62c938acd823f7a50e87ed350', '王辰睿', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('756', '20170785', 'a3723ef3733dce556d3d9101381ce022', '谢高艺', null, '化学工程学院', '3', '0');
INSERT INTO `user` VALUES ('757', '20170786', '14f0940eed36aa8be102fe50f63b0e83', '马玉龙', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('758', '20170787', 'bb6b256820a9a740968b7f549eb29843', '唐维媛', null, '食品药品制造工程学院', '3', '0');
INSERT INTO `user` VALUES ('759', '20170788', 'a7df034a6d8268d9cd80ae17d9994559', '颜政纲', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('760', '20170789', '4053ef01a53fa9dae27e3785a7b71433', '姚江帆', null, '发展规划处（国际交流、国际教育学院）', '3', '0');
INSERT INTO `user` VALUES ('761', '20170790', '8876a32989e7082eecfc6ec059b974fe', '张洋', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('762', '20170791', '97301828f9324b675c07c8803b68956b', '郑重', null, '电气与信息工程学院', '3', '0');
INSERT INTO `user` VALUES ('763', '20170792', 'd5934d2cb6b7347eb853e2446a7f734a', '安艳玲', null, '经济管理学院', '3', '0');
INSERT INTO `user` VALUES ('764', '20170793', '11c46d64b483b81f6f15f50888bd96b1', '杨骐璟', null, '党委组织部', '3', '0');
INSERT INTO `user` VALUES ('765', '20170794', '6114514799e7c195ae0b09194423767d', '林晓菊', null, '体育教学部', '3', '0');
INSERT INTO `user` VALUES ('766', '20170795', '754f9246db77bbf037553ead081e8b41', '马庚', null, '建筑与城市规划学院', '3', '0');
INSERT INTO `user` VALUES ('767', '20170796', 'bd618a59001e4cdeb4759f73d09c95a9', '邓涵予', null, '学校办公室', '3', '0');
INSERT INTO `user` VALUES ('768', '20170797', 'fffe585693898cea79a7ce3dcf0388aa', '张梦', null, '人事处', '3', '0');
INSERT INTO `user` VALUES ('769', '20170798', '84a9676baad0134aa3cf6bbff2de7c2b', '邓毓政', null, '教务处', '3', '0');
INSERT INTO `user` VALUES ('770', 'fxzx-wdz', '202cb962ac59075b964b07152d234b70', '吴德智', null, '分析测试中心', '2', '0');
INSERT INTO `user` VALUES ('771', 'fxzx-xlh', '202cb962ac59075b964b07152d234b70', '肖立华', null, '分析测试中心', '2', '1');
INSERT INTO `user` VALUES ('772', 'fxzx-yy', '202cb962ac59075b964b07152d234b70', '袁艺', null, '创新创业中心', '2', '0');
INSERT INTO `user` VALUES ('773', 'fxzx-sqw', '202cb962ac59075b964b07152d234b70', '舒群威', null, null, '2', '0');
INSERT INTO `user` VALUES ('774', 'fxzx-gh', '202cb962ac59075b964b07152d234b70', '甘红', null, '资源与环境工程学院', '2', '0');
INSERT INTO `user` VALUES ('775', 'admin', '9b2f60507e17c692f12ff8d865aeda55', '管理员', null, null, '1', '0');
