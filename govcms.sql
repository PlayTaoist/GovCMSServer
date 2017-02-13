/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : govcms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-08 17:21:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0' COMMENT '上级机构',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '部门/11111',
  `code` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '机构编码',
  `sort` int(11) DEFAULT '0' COMMENT '序号',
  `linkman` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '联系人',
  `linkman_no` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '联系人电话',
  `remark` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '机构描述',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '0', '系统承建单位', null, '99', 'system', '15888888888', null, '2016-06-06 06:06:06', '1', '2016-06-06 06:06:06', '1');
INSERT INTO `sys_department` VALUES ('2', '0', '注册用户', null, '97', '无人', '15888888888', null, '2015-04-28 22:39:34', '1', '2015-04-28 22:39:34', '1');
INSERT INTO `sys_department` VALUES ('3', '0', '第三方用户', null, '90', '无人', '15888888888', null, '2015-06-01 12:39:41', '1', '2015-06-01 12:39:41', '1');
INSERT INTO `sys_department` VALUES ('4', '0', 'FLY的狐狸', 'ABC000', '100', null, null, null, '2016-07-31 18:12:30', '1', '2016-07-31 18:12:30', '1');
INSERT INTO `sys_department` VALUES ('5', '4', '开发部', 'ABC001', '101', null, null, null, '2016-07-31 18:15:29', '1', '2016-07-31 18:15:29', '1');
INSERT INTO `sys_department` VALUES ('6', '4', '财务部', 'ABC003', '103', null, null, null, '2016-07-31 18:16:06', '1', '2016-07-31 18:16:06', '1');
INSERT INTO `sys_department` VALUES ('7', '4', '人事部', 'ABC004', '104', null, null, null, '2016-07-31 18:16:30', '1', '2016-07-31 18:16:30', '1');
INSERT INTO `sys_department` VALUES ('8', '5', '测试部', 'ABC0011', '101', null, null, null, '2016-07-31 18:16:52', '1', '2016-07-31 18:16:52', '1');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_name` varchar(256) NOT NULL COMMENT '名称',
  `dict_type` varchar(64) NOT NULL COMMENT '类型',
  `dict_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_SYS_DICT_TYPE` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='数据字典主表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '日志配置', 'systemLog', null);
INSERT INTO `sys_dict` VALUES ('2', '目录类型', 'articleType', null);
INSERT INTO `sys_dict` VALUES ('11', '目录类型', 'folderType', null);
INSERT INTO `sys_dict` VALUES ('100', '系统参数', 'systemParam', null);
INSERT INTO `sys_dict` VALUES ('101', '友情链接类型', 'friendlyLinkType', null);
INSERT INTO `sys_dict` VALUES ('102', '栏目类型', 'materialType', null);

-- ----------------------------
-- Table structure for `sys_dict_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_type` varchar(64) NOT NULL COMMENT '数据字典类型',
  `detail_name` varchar(256) DEFAULT NULL COMMENT '名称',
  `detail_code` varchar(32) DEFAULT NULL COMMENT '代码',
  `detail_sort` varchar(32) DEFAULT NULL COMMENT '排序号',
  `detail_type` varchar(32) DEFAULT NULL COMMENT '类型',
  `detail_state` varchar(32) DEFAULT NULL COMMENT '状态',
  `detail_content` varchar(256) DEFAULT NULL COMMENT '内容',
  `detail_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES ('1', 'folderType', '目录', '1', '1', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('2', 'folderType', 'a标签', '2', '2', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('3', 'folderType', 'a标签target', '3', '3', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('4', 'folderType', 'html标签', '4', '4', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('11', 'articleType', '正常', '1', '1', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('12', 'articleType', '预览', '2', '2', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('13', 'articleType', '程序', '3', '3', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('21', 'friendlyLinkType', '友情链接', null, '1', null, null, null, null, '2015-05-06 15:18:59', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('22', 'friendlyLinkType', '关于我们', null, '2', null, null, null, null, '2015-05-06 15:19:20', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('51', 'systemLog', 'sys_dict', '数据字典主表', '1', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('52', 'systemLog', 'sys_dict_detail', '数据字典', '2', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('53', 'systemLog', 'sys_menu', '菜单管理', '3', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('54', 'systemLog', 'sys_department', '组织机构', '4', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('55', 'systemLog', 'sys_user', '用户管理', '5', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('56', 'systemLog', 'sys_user_role', '用户角色授权', '6', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('57', 'systemLog', 'sys_role', '角色管理', '7', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('58', 'systemLog', 'sys_role_folder', '角色目录授权', '8', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('59', 'systemLog', 'sys_role_menu', '角色菜单授权', '9', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('60', 'systemLog', 'tb_folder', '目录管理', '10', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('61', 'systemLog', 'tb_article', '文章管理', '11', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('62', 'systemLog', 'tb_articlelike', '喜欢的文章管理', '12', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('63', 'systemLog', 'tb_comment', '评论管理', '13', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('64', 'systemLog', 'tb_tags', '标签管理', '14', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('65', 'systemLog', 'tb_contact', '联系人', '15', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('66', 'systemLog', 'tb_error', '错误管理', '16', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('67', 'systemLog', 'tb_friendlylink', '友情链接', '17', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('68', 'systemLog', 'tb_pageview', '访问量统计', '18', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('101', 'systemParam', '门头沟信息网', '1', '1', null, null, null, null, '2015-01-30 00:00:00', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('102', 'materialType', '文章', '1', '1', null, null, null, null, '2016-03-31 22:35:05', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('103', 'materialType', '图片', '2', '2', null, null, null, null, '2016-03-31 22:35:17', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('104', 'materialType', '视频', '3', '3', null, null, null, null, '2016-03-31 22:35:28', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('105', 'materialType', '其他', '9', '9', null, null, null, null, '2016-03-31 22:35:39', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('106', 'materialType', '栏目', '6', '6', null, null, null, null, '2016-03-31 23:46:27', '1', null, null);
INSERT INTO `sys_dict_detail` VALUES ('107', 'systemLog', 'tb_site', '站点管理', '19', null, null, null, null, '2016-04-14 00:02:45', '1', null, null);

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '上传人',
  `f_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `f_time` datetime DEFAULT NULL COMMENT '上传时间',
  `f_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '存放路径',
  `f_size` bigint(20) DEFAULT NULL COMMENT '文件大小（B）',
  `f_download` int(11) DEFAULT NULL COMMENT '文件下载次数',
  `f_type` int(1) DEFAULT NULL COMMENT '文件类型',
  `f_description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文件描述',
  `f_name_old` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '旧的文件名',
  `md5` varchar(40) COLLATE utf8_bin DEFAULT '' COMMENT '文件的MD5值',
  PRIMARY KEY (`id`),
  KEY `MD5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', '1', 'f_dd68d889f21e0aaa56a00d0ab6085d3f.png', '2016-12-08 12:15:22', 'd:/upload/', '11475', null, '0', null, 'f_7e6271eae2c74e0c8672a2bde96b7581.png', 'dd68d889f21e0aaa56a00d0ab6085d3f');
INSERT INTO `sys_file` VALUES ('2', '1', 'f_860aa8a0e18397b0623fe946345fcfab.png', '2016-12-08 12:15:22', 'd:/upload/', '32434', null, '0', null, 'f_78d5ab8a748e4841858e29470ca15fdd.png', '860aa8a0e18397b0623fe946345fcfab');
INSERT INTO `sys_file` VALUES ('3', '1', 'f_3b9b5deacf0f42e5cea31f5bbd5687f5.jpg', '2016-12-08 12:15:22', 'd:/upload/', '82266', null, '0', null, 'hn_file_1478681062451.jpg', '3b9b5deacf0f42e5cea31f5bbd5687f5');
INSERT INTO `sys_file` VALUES ('4', '1', 'f_8bfc8af3147f101c162f9a2a77790d11.xlsx', '2016-12-08 12:15:22', 'd:/upload/', '9565', null, '3', null, 'billsrecord-template.xlsx', '8bfc8af3147f101c162f9a2a77790d11');
INSERT INTO `sys_file` VALUES ('5', '1', 'f_421d169218336d0f8f960024be3e9728.mp4', '2016-12-08 12:18:39', 'd:/upload/', '537477673', null, '6', null, '秒速5厘米_bd.mp4', '421d169218336d0f8f960024be3e9728');
INSERT INTO `sys_file` VALUES ('6', '1', 'f_234579dacb454faeafe58835eef09d59.png', '2016-12-08 12:35:34', 'd:/upload/', '11475', null, '0', null, 'QQ图片20161206130454.png', '234579dacb454faeafe58835eef09d59');
INSERT INTO `sys_file` VALUES ('7', '1', 'f_79e5789f8a5447e78c98d599959cfb3a.png', '2016-12-08 13:09:19', 'd:/upload/', '11475', null, '0', null, 'QQ图片20161206130454.png', '79e5789f8a5447e78c98d599959cfb3a');
INSERT INTO `sys_file` VALUES ('8', '1', 'f_3587c85cf51a4ddf9b0b9e047bedfd32.png', '2016-12-08 13:09:19', 'd:/upload/', '32434', null, '0', null, 'QQ图片20161206130459.png', '3587c85cf51a4ddf9b0b9e047bedfd32');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` int(11) NOT NULL COMMENT '类型',
  `oper_object` varchar(64) DEFAULT NULL COMMENT '操作对象',
  `oper_table` varchar(64) NOT NULL COMMENT '操作表',
  `oper_id` int(11) DEFAULT '0' COMMENT '操作主键',
  `oper_type` varchar(64) DEFAULT NULL COMMENT '操作类型',
  `oper_remark` varchar(100) DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称/11111',
  `urlkey` varchar(256) DEFAULT NULL COMMENT '菜单key',
  `url` varchar(256) DEFAULT NULL COMMENT '链接地址',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `type` int(11) DEFAULT '1' COMMENT '类型//select/1,根目录,2,a标签,3,a标签_blank,4,外部url',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `level` int(11) DEFAULT '1' COMMENT '级别',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '&#xe616;', '资讯管理', null, '', '1', '1', '1', '1', '2016-09-25 13:04:13', '1', '2016-09-25 13:04:13', null);
INSERT INTO `sys_menu` VALUES ('2', '0', '&#xe613;', '文件管理', null, '', '1', '1', '2', '1', '2016-09-25 13:07:04', '1', '2016-09-25 13:07:04', null);
INSERT INTO `sys_menu` VALUES ('3', '0', '&#xe620;', '内容管理', null, '', '1', '1', '3', '1', '2016-09-25 13:07:24', '1', '2016-09-25 13:07:24', null);
INSERT INTO `sys_menu` VALUES ('4', '0', '&#xe622;', '评论管理', null, '', '1', '1', '4', '1', '2016-09-25 13:45:10', '1', '2016-09-25 13:45:10', null);
INSERT INTO `sys_menu` VALUES ('5', '0', '&#xe60d;', '会员管理', null, '', '1', '1', '5', '1', '2016-09-25 13:54:47', '1', '2016-09-25 13:54:47', null);
INSERT INTO `sys_menu` VALUES ('6', '0', '&#xe62d;', '管理员管理', null, '', '1', '1', '6', '1', '2016-09-25 13:56:26', '1', '2016-09-25 13:56:26', null);
INSERT INTO `sys_menu` VALUES ('7', '0', '&#xe61a;', '系统统计', null, '', '1', '1', '7', '1', '2016-09-25 13:59:07', '1', '2016-09-25 13:59:07', null);
INSERT INTO `sys_menu` VALUES ('9', '0', '&#xe62e;', '系统设置', null, '', '1', '1', '8', '1', '2016-09-25 14:00:57', '1', '2016-09-25 14:00:57', null);
INSERT INTO `sys_menu` VALUES ('10', '1', '', '资讯管理', null, 'article-list.jsp', '1', '1', '9', '1', '2016-09-26 19:54:31', '1', '2016-09-26 19:54:31', null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称/11111/',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `remark` text COMMENT '说明//textarea',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '0', null, '2016-10-28 21:05:17', '1', '2016-10-28 21:05:17', null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `menuid` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '10');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) NOT NULL COMMENT '用户名/11111',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `usertype` int(11) DEFAULT '2' COMMENT '类型//select/1,管理员,2,普通用户,3,前台用户,4,第三方用户',
  `state` int(11) DEFAULT '10' COMMENT '状态',
  `third_id` varchar(200) DEFAULT NULL COMMENT '第三方ID',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `title_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `remark` varchar(1000) DEFAULT NULL COMMENT '说明',
  `theme` varchar(64) DEFAULT 'default' COMMENT '主题',
  `back_site_id` int(11) DEFAULT '0' COMMENT '后台选择站点ID',
  `create_site_id` int(11) DEFAULT '1' COMMENT '创建站点ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '6a7f135cccaa4ebfbaf5bbcd5f3f0e5f', '系统管理员', '1', '1', '1', null, null, 'zcool321@sina.com', '123', null, null, '时间是最好的老师，但遗憾的是——最后他把所有的学生都弄死了', 'default', '2', '1', '2016-06-06 06:06:06', '1', null, null);

-- ----------------------------
-- Table structure for `tb_article`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `folder_id` int(11) DEFAULT '1' COMMENT '目录id',
  `title` varchar(200) DEFAULT '' COMMENT '文章名称',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键词',
  `content` longtext COMMENT '文件内容',
  `count_view` int(11) DEFAULT '0' COMMENT '浏览数',
  `count_comment` int(11) DEFAULT '0' COMMENT '评论数',
  `type` int(11) DEFAULT '1' COMMENT '类型：1 正常 2 预览展示概述 3 程序调用处理',
  `status` int(1) DEFAULT '0' COMMENT '状态 0：待审核；1：未通过；2：已发布；3：已撤回',
  `is_comment` int(11) DEFAULT '1' COMMENT '是否评论：2 否 1 是',
  `is_recommend` int(11) DEFAULT '2' COMMENT '是否推荐：2 否 1 是',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `jump_url` varchar(256) DEFAULT NULL COMMENT '跳转地址',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `image_net_url` varchar(256) DEFAULT NULL COMMENT '网络图片路径',
  `file_url` varchar(256) DEFAULT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_user` varchar(64) DEFAULT '1' COMMENT '发布者',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('1', '2', '测试文章发布', null, '', '0', '0', '1', '1', '1', '2', '0', null, null, null, null, null, null, '1', '2016-10-23 13:23:05', '2020-10-23 13:23:07', '2016-10-23 13:23:26', '2016-10-23 13:23:26', '1', null);
INSERT INTO `tb_article` VALUES ('2', '2', '测试文章发布', '测试', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_f803409bbcb14af58689b05b46fedd47.jpg\" title=\"u=4197868997(12).jpg\">u=4197868997(12).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_9cfb842f88194d498ff036318cf0b2c4.png\" title=\"logo.png\">logo.png</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_647ee9ea6da346f6b75388c65270f471.jpg\" title=\"u=4197868997(9).jpg\">u=4197868997(9).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_703c6a8250b94552a3026cc05cfba2c5.jpg\" title=\"u=4197868997(7).jpg\">u=4197868997(7).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_b2dfd98f391645c9b1ca5e65ce97ddf5.jpg\" title=\"u=4197868997(9).jpg\">u=4197868997(9).jpg</a></p><p><img src=\"http://localhost:9000/f_a5f3f1d39fb84e7aadfcb7b2fcc70b9b.jpg\" title=\"\" alt=\"\"/></p>', '0', '0', '1', '2', '1', '1', '0', 'http://localhost:8080/GovCMSServer/admin/index.jsp', null, null, null, null, null, '1', null, null, '2016-10-23 14:07:10', '2016-10-23 14:07:10', '1', null);
INSERT INTO `tb_article` VALUES ('3', '2', '测试文章发布三', '测试', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_a5f3f1d39fb84e7aadfcb7b2fcc70b9b.jpg\" title=\"u=4197868997(10).jpg\">u=4197868997(10).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_5e9bb09df7454b8ab54de54e938ae7de.jpg\" title=\"u=4197868997(9).jpg\">u=4197868997(9).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_72873ed818b4455d93db76806d527732.jpg\" title=\"u=4197868997(8).jpg\">u=4197868997(8).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_cce7f4aa56704681963e1a3f3e6a03ed.jpg\" title=\"u=4197868997(8).jpg\">u=4197868997(8).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_647ee9ea6da346f6b75388c65270f471.jpg\" title=\"u=4197868997(9).jpg\">u=4197868997(9).jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/GovCMSServer/assets/lib/ueditor/1.4.3/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"http://localhost:9000/f_703c6a8250b94552a3026cc05cfba2c5.jpg\" title=\"u=4197868997(7).jpg\">u=4197868997(7).jpg</a></p><p><img src=\"http://localhost:9000/f_e3335d3e81ff48cf80cb5bc21dd08c59.png\" title=\"\" alt=\"\"/></p><p>测试文本</p>', '0', '0', '1', '0', '1', '2', '0', 'http://localhost:8080/GovCMSServer/admin/index.jsp', null, null, null, null, null, '1', null, null, '2016-10-23 21:57:01', '2016-10-23 21:57:01', '1', null);
INSERT INTO `tb_article` VALUES ('4', '103', 'Mybatis property转column', '测试', '<p><img src=\"http://localhost:9000/f_79e5789f8a5447e78c98d599959cfb3a.png\" style=\"\"/></p><p><img src=\"http://localhost:9000/f_3587c85cf51a4ddf9b0b9e047bedfd32.png\" style=\"width: 921px; height: 464px;\" width=\"921\" height=\"464\"/></p><p><br/></p>', '0', '0', '1', '3', '1', '1', '0', 'https://www.baidu.com', null, null, null, null, null, '1', null, null, '2016-10-24 19:35:58', '2016-10-24 19:35:58', '1', null);

-- ----------------------------
-- Table structure for `tb_articlelike`
-- ----------------------------
DROP TABLE IF EXISTS `tb_articlelike`;
CREATE TABLE `tb_articlelike` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='喜欢的文章';

-- ----------------------------
-- Records of tb_articlelike
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `father_id` int(11) DEFAULT NULL COMMENT '父评论ID',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '内容',
  `status` int(11) DEFAULT '11' COMMENT '状态//select/11,评论未读,12,评论已读,21,回复未读,22,回复已读',
  `reply_username` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '评论人昵称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者 评论者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('2', '0', '3001', '测试评论！', '1', '1', '2016-04-19 21:38:02', '1', null, null);

-- ----------------------------
-- Table structure for `tb_contact`
-- ----------------------------
DROP TABLE IF EXISTS `tb_contact`;
CREATE TABLE `tb_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) NOT NULL COMMENT '姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) DEFAULT NULL COMMENT 'Email',
  `addr` varchar(256) DEFAULT NULL COMMENT '地址',
  `birthday` varchar(32) DEFAULT NULL COMMENT '生日',
  `remark` varchar(256) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='联系人';

-- ----------------------------
-- Records of tb_contact
-- ----------------------------
INSERT INTO `tb_contact` VALUES ('1', '张三', '15812345678', 'zhangsan@sina.com', '北京市', '2015-04-28', null, '2015-01-27 00:00:00', '1', null, null);

-- ----------------------------
-- Table structure for `tb_error`
-- ----------------------------
DROP TABLE IF EXISTS `tb_error`;
CREATE TABLE `tb_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '描述',
  `remark` text COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='异常数据';

-- ----------------------------
-- Records of tb_error
-- ----------------------------
INSERT INTO `tb_error` VALUES ('1', '1', '127.0.0.1', '2', '上传数量：2015062100(11)-20150621(11)', null, '2015-06-21 00:24:30', '2');
INSERT INTO `tb_error` VALUES ('2', '1', '127.0.0.1', '2', '上传数量：2015062100(11)-20150621(11)', null, '2015-06-21 00:26:32', '2');

-- ----------------------------
-- Table structure for `tb_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `qq` varchar(32) DEFAULT NULL COMMENT 'qq',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `telphone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `content` text COMMENT '意见反馈内容',
  `reply_content` text COMMENT '回复的内容',
  `remark` text COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('1', '1', '系统管理员', '333', '333', '33', '0', null, null, '333333333', '2016-01-29 04:39:43', '1', null, null);
INSERT INTO `tb_feedback` VALUES ('2', '1', '系统管理员', '330321321', '223@sina.com', '13983283282', '0', null, null, '系统很不错~等待升级', '2016-01-29 04:41:27', '1', null, null);
INSERT INTO `tb_feedback` VALUES ('3', '1', '系统管理员', '123', '123', '123', '0', null, null, '123', '2016-01-29 04:42:14', '1', null, null);
INSERT INTO `tb_feedback` VALUES ('4', '1', '系统管理员', '321', '2222', '2222', '0', null, null, '222', '2016-01-29 04:42:59', '1', null, null);
INSERT INTO `tb_feedback` VALUES ('5', '1', '系统管理员', '33333333', '33333333333333333', '33333333333', '2', null, null, '3333333333333333333333', '2016-01-29 04:43:51', '1', null, null);
INSERT INTO `tb_feedback` VALUES ('6', '1', '系统管理员', '111111111', '11111111111111', '1111111111111', '2', null, null, '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2016-01-29 04:46:02', '1', null, null);

-- ----------------------------
-- Table structure for `tb_folder`
-- ----------------------------
DROP TABLE IF EXISTS `tb_folder`;
CREATE TABLE `tb_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '目录id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '中文名',
  `path` varchar(200) DEFAULT '' COMMENT '模板路径',
  `content` text COMMENT '描述',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `type` int(11) DEFAULT '1' COMMENT '类型 1 普通目录 2 a标签 3 a标签_blank 4 直接加载url信息',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '跳转地址',
  `material_type` int(11) DEFAULT NULL COMMENT '素材类型',
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `seo_title` varchar(200) DEFAULT NULL COMMENT 'SEO title',
  `seo_keywords` varchar(200) DEFAULT NULL COMMENT 'SEO keywords',
  `seo_description` varchar(200) DEFAULT NULL COMMENT 'SEO description',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COMMENT='目录';

-- ----------------------------
-- Records of tb_folder
-- ----------------------------
INSERT INTO `tb_folder` VALUES ('1', '0', '首页', '', '门头沟信息网', '1', '1', '1', null, '102', '2', null, null, null, '2015-01-28 16:54:03', '0', '2015-01-30 13:24:58', '1');
INSERT INTO `tb_folder` VALUES ('2', '0', '新闻', null, null, '2', '1', '1', null, '102', '2', null, null, null, '2015-05-24 15:46:40', '0', '2015-01-30 13:24:58', '1');
INSERT INTO `tb_folder` VALUES ('3', '0', '美食', '', null, '3', '1', '1', null, '102', '2', null, null, null, '2015-05-24 15:46:54', '0', '2015-01-30 13:24:58', '1');
INSERT INTO `tb_folder` VALUES ('4', '0', '旅游', '', null, '5', '1', '1', null, '102', '2', null, null, null, '2015-05-24 15:47:43', '0', '2015-05-24 15:47:43', '1');
INSERT INTO `tb_folder` VALUES ('5', '0', '教育', '', null, '7', '1', '1', null, '102', '2', null, null, null, '2015-05-24 15:47:55', '0', '2015-05-24 15:47:55', '1');
INSERT INTO `tb_folder` VALUES ('6', '103', '后台管理', null, null, '90', '2', '3', 'admin', '102', '2', null, null, null, '2015-05-24 15:47:32', '0', '2015-01-30 13:24:58', '1');
INSERT INTO `tb_folder` VALUES ('7', '103', '标签查询', null, null, '80', '1', '2', 'front/tags/all', '102', '2', null, null, null, '2015-05-27 23:34:38', '0', '2015-05-18 09:12:57', '1');
INSERT INTO `tb_folder` VALUES ('10', '103', '公园', null, null, '51', '1', '1', null, '102', '2', null, null, null, '2015-05-24 15:49:35', '0', '2015-05-24 15:49:11', '1');
INSERT INTO `tb_folder` VALUES ('13', '0', '首页图片', '', null, '101', '2', '1', null, '102', '2', null, null, null, '2015-05-24 16:33:06', '0', '2015-05-24 16:33:06', '1');
INSERT INTO `tb_folder` VALUES ('90', '103', '关于我们', null, null, '81', '1', '2', 'front/about.html', '102', '2', null, null, null, '2015-05-26 16:40:46', '0', '2015-05-26 10:36:30', '1');
INSERT INTO `tb_folder` VALUES ('100', '0', '博文目录', '', null, '99', '2', '1', null, '102', '2', null, null, null, '2015-06-17 22:29:44', '0', '2015-06-17 22:29:44', '2');
INSERT INTO `tb_folder` VALUES ('101', '103', '意见反馈', null, null, '82', '1', '1', null, '102', '2', null, null, null, '2016-01-29 01:13:16', '1', '2016-01-29 01:13:16', '1');
INSERT INTO `tb_folder` VALUES ('103', '0', '其他', null, null, '10', '1', '1', null, '102', '2', null, null, null, '2016-03-31 23:50:26', '1', '2016-03-31 23:50:26', '1');
INSERT INTO `tb_folder` VALUES ('230', '0', '首页', 'home/home.html', null, '1', '1', '1', null, '102', '3', 'FLY的狐狸', 'FLY的狐狸，门头沟信息，生活，新闻，美食，旅游，教育，公园，商场，房产，生活记录,开发记录', 'FLY的狐狸，门头沟信息，生活，新闻，美食，旅游，教育，公园，商场，房产，生活记录,开发记录', '2016-04-07 01:13:40', '1', '2016-04-07 01:13:40', '1');
INSERT INTO `tb_folder` VALUES ('231', '0', '关于我们', '', null, '81', '1', '1', null, '1', '3', null, null, null, '2015-05-26 16:40:46', '0', '2015-05-26 10:36:30', '1');
INSERT INTO `tb_folder` VALUES ('253', '0', '首页', 'index.html', null, '10', '1', '1', null, '102', '8', null, null, null, '2016-06-17 16:48:11', '1', '2016-06-17 16:48:11', '1');
INSERT INTO `tb_folder` VALUES ('254', '0', '意见反馈', null, null, '10', '1', '3', 'http://mtg.jflyfox.com/advice.html', '102', '8', null, null, null, '2016-06-21 12:21:19', '1', '2016-06-21 12:21:19', '1');
INSERT INTO `tb_folder` VALUES ('255', '0', '关于我们', null, null, '10', '1', '3', 'http://blog.jflyfox.com/245.html', '102', '8', null, null, null, '2016-06-21 12:21:58', '1', '2016-06-21 12:21:58', '1');

-- ----------------------------
-- Table structure for `tb_folder_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tb_folder_notice`;
CREATE TABLE `tb_folder_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `folder_id` int(11) NOT NULL COMMENT '目录id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='栏目公告';

-- ----------------------------
-- Records of tb_folder_notice
-- ----------------------------
INSERT INTO `tb_folder_notice` VALUES ('1', '1', '0', null, '擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦', null, '20', '1', '1', '2016-01-31 02:52:56', '1', '2016-01-31 02:52:56', '1');
INSERT INTO `tb_folder_notice` VALUES ('2', '2', '0', null, '擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦擦', 'http://www.baidu.com', '20', '1', '1', '2016-01-31 02:53:22', '1', '2016-01-31 02:53:22', '1');

-- ----------------------------
-- Table structure for `tb_folder_roll_picture`
-- ----------------------------
DROP TABLE IF EXISTS `tb_folder_roll_picture`;
CREATE TABLE `tb_folder_roll_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `folder_id` int(11) NOT NULL COMMENT '目录id',
  `title` varchar(200) DEFAULT '' COMMENT '题目',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `image_net_url` varchar(256) DEFAULT NULL COMMENT '网络图片路径',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='栏目轮播图';

-- ----------------------------
-- Records of tb_folder_roll_picture
-- ----------------------------
INSERT INTO `tb_folder_roll_picture` VALUES ('3', '1', '百花山', null, '1', '1', null, 'http://i1.tietuku.cn/3951e9cb262621b6.jpg', 'http://www.jflyfox.com/mtg/front/article/329.html', '1', '2016-01-28 17:40:22', '1', '2016-01-28 17:40:22', '1');
INSERT INTO `tb_folder_roll_picture` VALUES ('4', '1', '美丽门城', null, '2', '1', null, 'http://i1.tietuku.cn/6f139452bedaefed.jpg', '#', '1', '2016-01-28 17:41:13', '1', '2016-01-28 17:41:13', '1');
INSERT INTO `tb_folder_roll_picture` VALUES ('5', '1', '永定塔', null, '3', '1', null, 'http://i1.tietuku.cn/fab40b501ece3fcf.jpg', 'http://www.jflyfox.com/mtg/front/article/406.html', '1', '2016-01-28 17:42:12', '1', '2016-01-28 17:42:12', '1');
INSERT INTO `tb_folder_roll_picture` VALUES ('6', '1', '爨底下', null, '4', '1', null, 'http://i1.tietuku.cn/35171f11a5ec9c51.jpg', 'http://www.jflyfox.com/mtg/front/article/330.html', '1', '2016-01-28 17:42:40', '1', '2016-01-28 17:42:40', '1');

-- ----------------------------
-- Table structure for `tb_friendlylink`
-- ----------------------------
DROP TABLE IF EXISTS `tb_friendlylink`;
CREATE TABLE `tb_friendlylink` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) NOT NULL COMMENT '名称/11111/',
  `url` varchar(256) NOT NULL COMMENT 'URL',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `state` int(11) DEFAULT '0' COMMENT '是否显示//radio/1,显示,2,不显示',
  `type` int(11) DEFAULT '21' COMMENT '类型//select/1,见数据字典',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注//textarea',
  `site_id` int(11) DEFAULT '0' COMMENT '站点ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of tb_friendlylink
-- ----------------------------
INSERT INTO `tb_friendlylink` VALUES ('1', '意见反馈', 'http://www.jflyfox.com/mtg/advice', '16', '1', '22', null, '0', '2015-04-24 15:03:02', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('2', '捐赠我们', 'http://www.jflyfox.com/mtg/front/about/351.html', '13', '1', '22', null, '0', '2015-04-24 15:27:36', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('3', '关于我们', 'http://www.jflyfox.com/mtgfront/about/352.html', '2', '1', '22', null, '0', '2015-04-24 15:28:56', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('4', '给我写信', 'http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=allcU1tTW15dWiobG0QJBQc', '15', '1', '22', null, '0', '2015-04-24 15:29:12', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('5', '大峪中学', 'http://www.dyzx-bj.com/', '112', '1', '21', null, '0', '2015-05-06 16:13:40', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('6', 'Jflyfox博客', 'http://www.jflyfox.com/', '114', '1', '21', null, '0', '2015-05-06 16:14:37', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('7', '门头沟介绍', 'http://baike.baidu.com/view/193726.htm?fromtitle=%E9%97%A8%E5%A4%B4%E6%B2%9F&fromid=1055081&type=syn', '111', '1', '21', null, '0', '2015-05-06 16:15:03', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('8', '联系我们', 'http://www.jflyfox.com/mtgfront/about/353.html', '3', '1', '22', null, '0', '2015-05-26 11:26:57', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('9', '免责声明', 'http://www.jflyfox.com/mtgfront/about/354.html', '20', '1', '22', null, '0', '2015-05-26 11:27:18', '1', null, null);
INSERT INTO `tb_friendlylink` VALUES ('10', '广告服务', 'http://www.jflyfox.com/mtgfront/about/355.html', '11', '1', '22', null, '0', '2015-05-26 11:28:42', '1', null, null);

-- ----------------------------
-- Table structure for `tb_heartbeat`
-- ----------------------------
DROP TABLE IF EXISTS `tb_heartbeat`;
CREATE TABLE `tb_heartbeat` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_heartbeat
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_image`
-- ----------------------------
DROP TABLE IF EXISTS `tb_image`;
CREATE TABLE `tb_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int(11) DEFAULT '1' COMMENT '相册ID',
  `album_name` varchar(200) DEFAULT '' COMMENT '相册名称',
  `name` varchar(200) DEFAULT '' COMMENT '图片名称',
  `linkurl` varchar(400) DEFAULT '' COMMENT '链接地址',
  `cdnurl` varchar(400) DEFAULT '' COMMENT 'CDN地址',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `image_net_url` varchar(256) DEFAULT NULL COMMENT '网络图片路径',
  `ext` varchar(20) DEFAULT '' COMMENT '扩展名',
  `width` varchar(20) DEFAULT '' COMMENT '宽',
  `height` varchar(20) DEFAULT '' COMMENT '高',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `is_comment` int(11) DEFAULT '1' COMMENT '是否评论//radio/2,否,1,是',
  `is_recommend` int(11) DEFAULT '2' COMMENT '是否推荐：2 否 1 是',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_user` varchar(64) DEFAULT '1' COMMENT '发布者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='图片';

-- ----------------------------
-- Records of tb_image
-- ----------------------------
INSERT INTO `tb_image` VALUES ('2', '1', '风景', '风景1', 'http://image226-c.poco.cn/mypoco/myphoto/20140121/16/6164818720140121160407052_640.jpg?1024x453_120', '', null, 'http://image226-c.poco.cn/mypoco/myphoto/20140121/16/6164818720140121160407052_640.jpg?1024x453_120', 'jpg?1024x453_120', '750', '331', '1', '2', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 00:41:10', '1', '2016-02-10 00:41:10', '1');
INSERT INTO `tb_image` VALUES ('3', '3', '动漫', '动漫1', 'http://thumb.webps.cn/to/img/4/T1DTF3Fc4dXXXXXXXX_!!0-item_pic.jpg', '', null, 'http://thumb.webps.cn/to/img/4/T1DTF3Fc4dXXXXXXXX_!!0-item_pic.jpg', 'jpg', '500', '747', '1', '2', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 00:41:51', '1', '2016-02-10 00:41:51', '1');
INSERT INTO `tb_image` VALUES ('4', '2', '美女', '美女1', 'http://i4.pdim.gs/t01d4f8e84b1434c8e3.jpg', '', null, 'http://i4.pdim.gs/t01d4f8e84b1434c8e3.jpg', 'jpg', '800', '566', '1', '2', '1', '2', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 00:43:20', '1', '2016-02-10 00:43:20', '1');
INSERT INTO `tb_image` VALUES ('5', '4', '游戏', '游戏1', 'http://news.waigame.cn/static/newsimage/20140603/14017632866819.jpg', '', null, 'http://news.waigame.cn/static/newsimage/20140603/14017632866819.jpg', 'jpg', '1400', '933', '1', '2', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 00:44:14', '1', '2016-02-10 00:44:14', '1');
INSERT INTO `tb_image` VALUES ('7', '2', '美女', '美女2', 'http://i12.tietuku.cn/15a72119633c812d.jpg', '', null, 'http://i12.tietuku.cn/15a72119633c812d.jpg', null, '0', '0', '1', '2', '1', '8', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:25:41', '1', '2016-02-10 01:25:41', '1');
INSERT INTO `tb_image` VALUES ('8', '2', '美女', '美女3', 'http://i12.tietuku.cn/ccb2e30c9fda92f6.jpg', '', null, 'http://i12.tietuku.cn/ccb2e30c9fda92f6.jpg', 'jpg', '580', '870', '1', '2', '2', '8', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:30:59', '1', '2016-02-10 01:30:59', '1');
INSERT INTO `tb_image` VALUES ('9', '2', '美女', '美女4', 'http://i12.tietuku.cn/2329cc70e32d51c7.jpg', '', null, 'http://i12.tietuku.cn/2329cc70e32d51c7.jpg', 'jpg', '480', '800', '1', '1', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:31:16', '1', '2016-02-10 01:31:16', '1');
INSERT INTO `tb_image` VALUES ('10', '2', '美女', '美女5', 'http://i12.tietuku.cn/f2229247cf39609c.jpg', '', null, 'http://i12.tietuku.cn/f2229247cf39609c.jpg', 'jpg', '375', '550', '1', '1', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:31:30', '1', '2016-02-10 01:31:30', '1');
INSERT INTO `tb_image` VALUES ('11', '2', '美女', '美女6', 'http://i12.tietuku.cn/53cdf688c2c938f0.jpg', '', null, 'http://i12.tietuku.cn/53cdf688c2c938f0.jpg', 'jpg', '610', '833', '1', '2', '2', '8', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:31:45', '1', '2016-02-10 01:31:45', '1');
INSERT INTO `tb_image` VALUES ('12', '2', '美女', '美女7', 'http://i12.tietuku.cn/9c83f4d0809adcbc.jpg', '', null, 'http://i12.tietuku.cn/9c83f4d0809adcbc.jpg', 'jpg', '532', '600', '1', '1', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:31:59', '1', '2016-02-10 01:31:59', '1');
INSERT INTO `tb_image` VALUES ('13', '2', '美女', '美女8', 'http://i4.tietuku.cn/691d3f2a37fb0ba9.jpg', '', null, 'http://i4.tietuku.cn/691d3f2a37fb0ba9.jpg', 'jpg', '1024', '1536', '1', '2', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:33:40', '1', '2016-02-10 01:33:40', '1');
INSERT INTO `tb_image` VALUES ('14', '2', '美女', '美女9', 'http://i4.tietuku.cn/1fd3bb6d9a0d5901.jpg', '', null, 'http://i4.tietuku.cn/1fd3bb6d9a0d5901.jpg', 'jpg', '682', '1024', '1', '2', '2', '9', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:34:45', '1', '2016-02-10 01:34:45', '1');
INSERT INTO `tb_image` VALUES ('15', '2', '美女', '美女10', 'http://i13.tietuku.cn/bff63c26bea99e8d.jpg', '', null, 'http://i13.tietuku.cn/bff63c26bea99e8d.jpg', 'jpg', '900', '1200', '1', '1', '2', '10', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:35:16', '1', '2016-02-10 01:35:16', '1');
INSERT INTO `tb_image` VALUES ('16', '2', '美女', '美女11', 'http://i13.tietuku.cn/8484c08a850a74c8.jpg', '', null, 'http://i13.tietuku.cn/8484c08a850a74c8.jpg', 'jpg', '768', '1152', '1', '2', '2', '9', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:35:55', '1', '2016-02-10 01:35:55', '1');
INSERT INTO `tb_image` VALUES ('17', '2', '美女', '美女12', 'http://i4.tietuku.cn/4231f8da8b09331c.jpg', '', null, 'http://i4.tietuku.cn/4231f8da8b09331c.jpg', 'jpg', '640', '960', '1', '2', '2', '8', null, '2016-02-10 00:00:00', '系统管理员', '2016-02-10 01:36:09', '1', '2016-02-10 01:36:09', '1');
INSERT INTO `tb_image` VALUES ('18', '2', '美女', '美女13', 'http://i13.tietuku.cn/a5d2a6478c6ed758.jpg', '', null, 'http://i13.tietuku.cn/a5d2a6478c6ed758.jpg', 'jpg', '496', '750', '1', '2', '2', '10', null, '2016-02-09 00:00:00', '系统管理员', '2016-02-10 01:36:29', '1', '2016-02-10 01:36:29', '1');
INSERT INTO `tb_image` VALUES ('19', '4', '游戏', '游戏2', 'http://i4.tietuku.cn/c34fc8e188fd210c.jpg', '', null, 'http://i4.tietuku.cn/c34fc8e188fd210c.jpg', 'jpg', '1920', '1080', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 02:57:23', '1', '2016-02-11 02:57:23', '1');
INSERT INTO `tb_image` VALUES ('20', '4', '游戏', '游戏3', 'http://i8.tietuku.cn/ca9d3311b35856b7.jpg', '', null, 'http://i8.tietuku.cn/ca9d3311b35856b7.jpg', 'jpg', '658', '823', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 02:58:35', '1', '2016-02-11 02:58:35', '1');
INSERT INTO `tb_image` VALUES ('21', '4', '游戏', '游戏5', 'http://i4.tietuku.cn/a8ebfc61acef58ae.jpg', '', null, 'http://i4.tietuku.cn/a8ebfc61acef58ae.jpg', 'jpg', '1600', '1200', '1', '2', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 02:59:46', '1', '2016-02-11 02:59:46', '1');
INSERT INTO `tb_image` VALUES ('22', '4', '游戏', '游戏4', 'http://i4.tietuku.cn/51c82af7824bac4c.jpg', '', null, 'http://i4.tietuku.cn/51c82af7824bac4c.jpg', 'jpg', '1600', '1200', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:00:11', '1', '2016-02-11 03:00:11', '1');
INSERT INTO `tb_image` VALUES ('23', '4', '游戏', '游戏6', 'http://i8.tietuku.cn/cc4329e67481d4f0.png', '', null, 'http://i8.tietuku.cn/cc4329e67481d4f0.png', 'png', '400', '580', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:00:50', '1', '2016-02-11 03:00:50', '1');
INSERT INTO `tb_image` VALUES ('24', '4', '游戏', '游戏7', 'http://i8.tietuku.cn/fa672748521bb33a.jpg', '', null, 'http://i8.tietuku.cn/fa672748521bb33a.jpg', 'jpg', '600', '400', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:01:30', '1', '2016-02-11 03:01:30', '1');
INSERT INTO `tb_image` VALUES ('25', '4', '游戏', '游戏8', 'http://i4.tietuku.cn/7a22444c704bdb8c.jpg', '', null, 'http://i4.tietuku.cn/7a22444c704bdb8c.jpg', 'jpg', '751', '1000', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:04:52', '1', '2016-02-11 03:04:52', '1');
INSERT INTO `tb_image` VALUES ('26', '3', '动漫', '动漫2', 'http://i12.tietuku.cn/c4b206990bea4877.jpg', '', null, 'http://i12.tietuku.cn/c4b206990bea4877.jpg', 'jpg', '429', '600', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:06:29', '1', '2016-02-11 03:06:29', '1');
INSERT INTO `tb_image` VALUES ('27', '3', '动漫', '动漫3', 'http://i11.tietuku.cn/97ec25026f8526ea.jpg', '', null, 'http://i11.tietuku.cn/97ec25026f8526ea.jpg', 'jpg', '188', '266', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:06:48', '1', '2016-02-11 03:06:48', '1');
INSERT INTO `tb_image` VALUES ('28', '3', '动漫', '动漫4', 'http://i8.tietuku.cn/99bed4ee4e00683b.jpg', '', null, 'http://i8.tietuku.cn/99bed4ee4e00683b.jpg', 'jpg', '609', '800', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:07:03', '1', '2016-02-11 03:07:03', '1');
INSERT INTO `tb_image` VALUES ('29', '3', '动漫', '动漫5', 'http://i4.tietuku.cn/c18889b9f5fcb0f6.jpg', '', null, 'http://i4.tietuku.cn/c18889b9f5fcb0f6.jpg', 'jpg', '637', '900', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:07:59', '1', '2016-02-11 03:07:59', '1');
INSERT INTO `tb_image` VALUES ('30', '3', '动漫', '动漫6', 'http://i4.tietuku.cn/e37d596427ae17f8.jpg', '', null, 'http://i4.tietuku.cn/e37d596427ae17f8.jpg', 'jpg', '210', '280', '1', '1', '2', '10', null, '2016-02-11 00:00:00', '系统管理员', '2016-02-11 03:08:31', '1', '2016-02-11 03:08:31', '1');

-- ----------------------------
-- Table structure for `tb_image_album`
-- ----------------------------
DROP TABLE IF EXISTS `tb_image_album`;
CREATE TABLE `tb_image_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '相册名称',
  `remark` text COMMENT '描述',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='相册';

-- ----------------------------
-- Records of tb_image_album
-- ----------------------------
INSERT INTO `tb_image_album` VALUES ('1', '0', '风景', null, '1', '1', '2016-02-10 00:28:19', '1', '2016-02-10 00:28:19', '1');
INSERT INTO `tb_image_album` VALUES ('2', '0', '美女', null, '2', '1', '2016-02-10 00:28:43', '1', '2016-02-10 00:28:43', '1');
INSERT INTO `tb_image_album` VALUES ('3', '0', '动漫', null, '3', '1', '2016-02-10 00:28:55', '1', '2016-02-10 00:28:55', '1');
INSERT INTO `tb_image_album` VALUES ('4', '0', '游戏', null, '4', '1', '2016-02-10 00:29:42', '1', '2016-02-10 00:29:42', '1');

-- ----------------------------
-- Table structure for `tb_image_tags`
-- ----------------------------
DROP TABLE IF EXISTS `tb_image_tags`;
CREATE TABLE `tb_image_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `image_id` int(11) DEFAULT NULL COMMENT '图片ID',
  `tagname` varchar(200) DEFAULT '' COMMENT '标签内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='标签';

-- ----------------------------
-- Records of tb_image_tags
-- ----------------------------
INSERT INTO `tb_image_tags` VALUES ('1', null, 'a', '2016-02-10 02:09:39', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('2', null, 'b', '2016-02-10 02:09:39', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('3', null, 'b', '2016-02-10 02:09:39', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('4', null, 'a', '2016-02-10 02:09:48', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('5', null, 'c', '2016-02-10 02:09:48', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('6', null, 'a', '2016-02-10 02:10:43', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('7', null, 'b', '2016-02-10 02:10:45', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('42', '4', '美女', '2016-02-11 03:12:30', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('43', '4', '图片', '2016-02-11 03:12:30', '1', null, null);
INSERT INTO `tb_image_tags` VALUES ('44', '4', '视频', '2016-02-11 03:12:31', '1', null, null);

-- ----------------------------
-- Table structure for `tb_pageview`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pageview`;
CREATE TABLE `tb_pageview` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `create_day` varchar(64) NOT NULL COMMENT '创建时间到天',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='访问量统计';

-- ----------------------------
-- Records of tb_pageview
-- ----------------------------
INSERT INTO `tb_pageview` VALUES ('87', '127.0.0.1', '0', '2016-04-04', '2016-04-04 19:53:45', null, null);
INSERT INTO `tb_pageview` VALUES ('88', '127.0.0.1', '0', '2016-04-05', '2016-04-05 00:03:09', null, null);
INSERT INTO `tb_pageview` VALUES ('89', '127.0.0.1', '0', '2016-04-06', '2016-04-06 00:06:37', null, null);
INSERT INTO `tb_pageview` VALUES ('90', '127.0.0.1', '0', '2016-04-07', '2016-04-07 00:09:26', null, null);
INSERT INTO `tb_pageview` VALUES ('91', '0:0:0:0:0:0:0:1', '0', '2016-04-13', '2016-04-13 23:26:45', null, null);
INSERT INTO `tb_pageview` VALUES ('92', '127.0.0.1', '0', '2016-04-13', '2016-04-13 23:55:23', null, null);
INSERT INTO `tb_pageview` VALUES ('93', '0:0:0:0:0:0:0:1', '0', '2016-04-14', '2016-04-14 00:00:30', null, null);
INSERT INTO `tb_pageview` VALUES ('94', '0:0:0:0:0:0:0:1', '0', '2016-04-16', '2016-04-16 02:01:06', null, null);
INSERT INTO `tb_pageview` VALUES ('95', '127.0.0.1', '0', '2016-04-16', '2016-04-16 02:02:32', null, null);
INSERT INTO `tb_pageview` VALUES ('96', '0:0:0:0:0:0:0:1', '0', '2016-04-17', '2016-04-17 05:19:38', null, null);
INSERT INTO `tb_pageview` VALUES ('97', '127.0.0.1', '0', '2016-04-17', '2016-04-17 05:20:06', null, null);
INSERT INTO `tb_pageview` VALUES ('98', '0:0:0:0:0:0:0:1', '0', '2016-04-18', '2016-04-18 00:05:27', null, null);
INSERT INTO `tb_pageview` VALUES ('99', '127.0.0.1', '0', '2016-04-18', '2016-04-18 00:14:24', null, null);
INSERT INTO `tb_pageview` VALUES ('100', '127.0.0.1', '0', '2016-04-19', '2016-04-19 00:02:25', null, null);
INSERT INTO `tb_pageview` VALUES ('101', '0:0:0:0:0:0:0:1', '0', '2016-04-19', '2016-04-19 21:28:43', null, null);
INSERT INTO `tb_pageview` VALUES ('102', '127.0.0.1', '0', '2016-04-20', '2016-04-20 00:00:09', null, null);
INSERT INTO `tb_pageview` VALUES ('103', '127.0.0.1', '0', '2016-04-21', '2016-04-21 01:47:03', null, null);
INSERT INTO `tb_pageview` VALUES ('104', '0:0:0:0:0:0:0:1', '0', '2016-05-07', '2016-05-07 21:53:05', null, null);
INSERT INTO `tb_pageview` VALUES ('105', '127.0.0.1', '0', '2016-05-07', '2016-05-07 22:25:34', null, null);
INSERT INTO `tb_pageview` VALUES ('106', '0:0:0:0:0:0:0:1', '0', '2016-05-08', '2016-05-08 00:01:17', null, null);
INSERT INTO `tb_pageview` VALUES ('107', '0:0:0:0:0:0:0:1', '0', '2016-05-11', '2016-05-11 23:44:10', null, null);
INSERT INTO `tb_pageview` VALUES ('108', '0:0:0:0:0:0:0:1', '0', '2016-05-12', '2016-05-12 00:00:04', null, null);
INSERT INTO `tb_pageview` VALUES ('109', '127.0.0.1', '0', '2016-05-12', '2016-05-12 00:06:36', null, null);

-- ----------------------------
-- Table structure for `tb_tags`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `tagname` varchar(200) DEFAULT '' COMMENT '标签内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='标签';

-- ----------------------------
-- Records of tb_tags
-- ----------------------------
INSERT INTO `tb_tags` VALUES ('6', '343', '学校', '2015-05-24 23:26:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('7', '343', '大峪中学', '2015-05-24 23:26:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('8', '350', '学校', '2015-05-25 14:05:41', '1', null, null);
INSERT INTO `tb_tags` VALUES ('9', '350', '坡头中学', '2015-05-25 14:05:41', '1', null, null);
INSERT INTO `tb_tags` VALUES ('10', '349', '学校', '2015-05-25 14:05:51', '1', null, null);
INSERT INTO `tb_tags` VALUES ('11', '349', '三家店铁路中学', '2015-05-25 14:05:51', '1', null, null);
INSERT INTO `tb_tags` VALUES ('12', '348', '学校', '2015-05-25 14:06:01', '1', null, null);
INSERT INTO `tb_tags` VALUES ('13', '348', '育新中学', '2015-05-25 14:06:02', '1', null, null);
INSERT INTO `tb_tags` VALUES ('14', '347', '学校', '2015-05-25 14:06:13', '1', null, null);
INSERT INTO `tb_tags` VALUES ('15', '347', '新桥路中学', '2015-05-25 14:06:13', '1', null, null);
INSERT INTO `tb_tags` VALUES ('16', '346', '学校', '2015-05-25 14:06:24', '1', null, null);
INSERT INTO `tb_tags` VALUES ('17', '346', '大峪中学分校', '2015-05-25 14:06:24', '1', null, null);
INSERT INTO `tb_tags` VALUES ('18', '345', '学校', '2015-05-25 14:06:42', '1', null, null);
INSERT INTO `tb_tags` VALUES ('19', '345', '首都师范大学附属中学', '2015-05-25 14:06:42', '1', null, null);
INSERT INTO `tb_tags` VALUES ('20', '345', '永定中学', '2015-05-25 14:06:42', '1', null, null);
INSERT INTO `tb_tags` VALUES ('21', '344', '学校', '2015-05-25 14:06:53', '1', null, null);
INSERT INTO `tb_tags` VALUES ('22', '344', '育园中学', '2015-05-25 14:06:53', '1', null, null);
INSERT INTO `tb_tags` VALUES ('23', '375', '公园', '2015-05-26 13:19:08', '1', null, null);
INSERT INTO `tb_tags` VALUES ('24', '375', '永定河文化广场', '2015-05-26 13:19:08', '1', null, null);
INSERT INTO `tb_tags` VALUES ('25', '374', '永定河森林公园', '2015-05-26 13:19:17', '1', null, null);
INSERT INTO `tb_tags` VALUES ('26', '374', '公园', '2015-05-26 13:19:17', '1', null, null);
INSERT INTO `tb_tags` VALUES ('27', '373', '永定河森林公园', '2015-05-26 13:19:25', '1', null, null);
INSERT INTO `tb_tags` VALUES ('28', '373', '公园', '2015-05-26 13:19:25', '1', null, null);
INSERT INTO `tb_tags` VALUES ('29', '372', '新桥公园', '2015-05-26 13:20:12', '1', null, null);
INSERT INTO `tb_tags` VALUES ('30', '372', '公园', '2015-05-26 13:20:12', '1', null, null);
INSERT INTO `tb_tags` VALUES ('31', '371', '西苑公园', '2015-05-26 13:22:48', '1', null, null);
INSERT INTO `tb_tags` VALUES ('32', '371', '公园', '2015-05-26 13:22:48', '1', null, null);
INSERT INTO `tb_tags` VALUES ('33', '370', '石门营公园', '2015-05-26 13:25:00', '1', null, null);
INSERT INTO `tb_tags` VALUES ('34', '370', '公园', '2015-05-26 13:25:00', '1', null, null);
INSERT INTO `tb_tags` VALUES ('35', '369', '石龙公园', '2015-05-26 13:37:24', '1', null, null);
INSERT INTO `tb_tags` VALUES ('36', '369', '公园', '2015-05-26 13:37:24', '1', null, null);
INSERT INTO `tb_tags` VALUES ('37', '368', '葡山公园', '2015-05-26 13:39:14', '1', null, null);
INSERT INTO `tb_tags` VALUES ('38', '368', '公园', '2015-05-26 13:39:14', '1', null, null);
INSERT INTO `tb_tags` VALUES ('39', '367', '葡东公园', '2015-05-26 13:40:26', '1', null, null);
INSERT INTO `tb_tags` VALUES ('40', '367', '公园', '2015-05-26 13:40:26', '1', null, null);
INSERT INTO `tb_tags` VALUES ('41', '366', '门头沟新城滨河森林公园', '2015-05-26 13:42:29', '1', null, null);
INSERT INTO `tb_tags` VALUES ('42', '366', '公园', '2015-05-26 13:42:29', '1', null, null);
INSERT INTO `tb_tags` VALUES ('43', '365', '门矿遗址公园', '2015-05-26 13:43:30', '1', null, null);
INSERT INTO `tb_tags` VALUES ('44', '365', '公园', '2015-05-26 13:43:30', '1', null, null);
INSERT INTO `tb_tags` VALUES ('45', '364', '立思辰公园', '2015-05-26 13:44:43', '1', null, null);
INSERT INTO `tb_tags` VALUES ('46', '364', '公园', '2015-05-26 13:44:43', '1', null, null);
INSERT INTO `tb_tags` VALUES ('47', '363', '京门铁路遗址公园', '2015-05-26 13:45:35', '1', null, null);
INSERT INTO `tb_tags` VALUES ('48', '363', '公园', '2015-05-26 13:45:35', '1', null, null);
INSERT INTO `tb_tags` VALUES ('49', '362', '京浪岛文化体育公园', '2015-05-26 13:46:57', '1', null, null);
INSERT INTO `tb_tags` VALUES ('50', '362', '公园', '2015-05-26 13:46:57', '1', null, null);
INSERT INTO `tb_tags` VALUES ('51', '361', '黑山公园', '2015-05-26 13:48:00', '1', null, null);
INSERT INTO `tb_tags` VALUES ('52', '361', '公园', '2015-05-26 13:48:00', '1', null, null);
INSERT INTO `tb_tags` VALUES ('53', '360', '光荣园', '2015-05-26 13:49:15', '1', null, null);
INSERT INTO `tb_tags` VALUES ('54', '360', '公园', '2015-05-26 13:49:16', '1', null, null);
INSERT INTO `tb_tags` VALUES ('57', '358', '东辛房公园', '2015-05-26 13:50:45', '1', null, null);
INSERT INTO `tb_tags` VALUES ('58', '358', '公园', '2015-05-26 13:50:45', '1', null, null);
INSERT INTO `tb_tags` VALUES ('59', '357', '晨曦公园', '2015-05-26 13:51:47', '1', null, null);
INSERT INTO `tb_tags` VALUES ('60', '357', '公园', '2015-05-26 13:51:47', '1', null, null);
INSERT INTO `tb_tags` VALUES ('61', '356', '滨河公园', '2015-05-26 13:52:42', '1', null, null);
INSERT INTO `tb_tags` VALUES ('62', '356', '公园', '2015-05-26 13:52:42', '1', null, null);
INSERT INTO `tb_tags` VALUES ('63', '324', '新闻', '2015-05-26 14:05:51', '1', null, null);
INSERT INTO `tb_tags` VALUES ('64', '323', '新闻', '2015-05-26 14:08:41', '1', null, null);
INSERT INTO `tb_tags` VALUES ('65', '322', '新闻', '2015-05-26 14:10:33', '1', null, null);
INSERT INTO `tb_tags` VALUES ('66', '321', '新闻', '2015-05-26 14:12:12', '1', null, null);
INSERT INTO `tb_tags` VALUES ('67', '320', '新闻', '2015-05-26 14:13:58', '1', null, null);
INSERT INTO `tb_tags` VALUES ('68', '319', '新闻', '2015-05-26 14:37:57', '1', null, null);
INSERT INTO `tb_tags` VALUES ('69', '318', '新闻', '2015-05-26 14:40:09', '1', null, null);
INSERT INTO `tb_tags` VALUES ('70', '111', '新闻', '2015-05-26 14:43:28', '1', null, null);
INSERT INTO `tb_tags` VALUES ('71', '111', '定都阁', '2015-05-26 14:43:28', '1', null, null);
INSERT INTO `tb_tags` VALUES ('72', '105', '新闻', '2015-05-26 14:44:49', '1', null, null);
INSERT INTO `tb_tags` VALUES ('77', '335', '福华肥牛', '2015-05-26 14:52:49', '1', null, null);
INSERT INTO `tb_tags` VALUES ('78', '335', '饭店', '2015-05-26 14:52:49', '1', null, null);
INSERT INTO `tb_tags` VALUES ('79', '335', '美食', '2015-05-26 14:52:49', '1', null, null);
INSERT INTO `tb_tags` VALUES ('80', '334', '大鸭梨', '2015-05-26 14:52:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('81', '334', '饭店', '2015-05-26 14:52:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('82', '334', '美食', '2015-05-26 14:52:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('83', '342', '美食', '2015-05-26 14:53:01', '1', null, null);
INSERT INTO `tb_tags` VALUES ('84', '342', '老家肉饼', '2015-05-26 14:53:01', '1', null, null);
INSERT INTO `tb_tags` VALUES ('85', '342', '饭店', '2015-05-26 14:53:01', '1', null, null);
INSERT INTO `tb_tags` VALUES ('88', '341', '顶风针', '2015-05-26 14:55:38', '1', null, null);
INSERT INTO `tb_tags` VALUES ('89', '341', '蛋糕店', '2015-05-26 14:55:38', '1', null, null);
INSERT INTO `tb_tags` VALUES ('96', '340', '饭店', '2015-05-26 16:01:38', '1', null, null);
INSERT INTO `tb_tags` VALUES ('97', '340', '美食', '2015-05-26 16:01:38', '1', null, null);
INSERT INTO `tb_tags` VALUES ('98', '340', '新新包子铺', '2015-05-26 16:01:38', '1', null, null);
INSERT INTO `tb_tags` VALUES ('99', '339', '酒店', '2015-05-26 16:03:40', '1', null, null);
INSERT INTO `tb_tags` VALUES ('100', '339', '今天假日酒店', '2015-05-26 16:03:40', '1', null, null);
INSERT INTO `tb_tags` VALUES ('101', '339', '饭店', '2015-05-26 16:03:40', '1', null, null);
INSERT INTO `tb_tags` VALUES ('102', '338', '宾馆', '2015-05-26 16:09:18', '1', null, null);
INSERT INTO `tb_tags` VALUES ('103', '338', '龙泉宾馆', '2015-05-26 16:09:18', '1', null, null);
INSERT INTO `tb_tags` VALUES ('104', '336', '晨光饭店', '2015-05-26 16:09:58', '1', null, null);
INSERT INTO `tb_tags` VALUES ('105', '336', '饭店', '2015-05-26 16:09:58', '1', null, null);
INSERT INTO `tb_tags` VALUES ('108', '337', '潭柘嘉福饭店', '2015-05-26 16:12:13', '1', null, null);
INSERT INTO `tb_tags` VALUES ('109', '337', '饭店', '2015-05-26 16:12:13', '1', null, null);
INSERT INTO `tb_tags` VALUES ('126', '329', '百花山', '2015-05-26 16:31:32', '1', null, null);
INSERT INTO `tb_tags` VALUES ('127', '329', '旅游', '2015-05-26 16:31:32', '1', null, null);
INSERT INTO `tb_tags` VALUES ('128', '330', '爨底下', '2015-05-26 16:32:10', '1', null, null);
INSERT INTO `tb_tags` VALUES ('129', '330', '旅游', '2015-05-26 16:32:10', '1', null, null);
INSERT INTO `tb_tags` VALUES ('130', '331', '灵山', '2015-05-26 16:34:18', '1', null, null);
INSERT INTO `tb_tags` VALUES ('131', '331', '旅游', '2015-05-26 16:34:18', '1', null, null);
INSERT INTO `tb_tags` VALUES ('132', '332', '旅游', '2015-05-26 16:34:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('133', '332', '龙门涧', '2015-05-26 16:34:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('134', '332', '旅游', '2015-05-26 16:34:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('137', '333', '妙峰山', '2015-05-26 16:35:46', '1', null, null);
INSERT INTO `tb_tags` VALUES ('138', '333', '旅游', '2015-05-26 16:35:46', '1', null, null);
INSERT INTO `tb_tags` VALUES ('139', '328', '双龙峡', '2015-05-26 16:44:36', '1', null, null);
INSERT INTO `tb_tags` VALUES ('140', '328', '旅游', '2015-05-26 16:44:36', '1', null, null);
INSERT INTO `tb_tags` VALUES ('141', '391', '2. 博文内容尽量控制在1200个文字内', '2015-06-20 16:59:29', '2', null, null);
INSERT INTO `tb_tags` VALUES ('142', '391', '内容合法健康', '2015-06-20 16:59:29', '2', null, null);
INSERT INTO `tb_tags` VALUES ('143', '391', '否则可能会被删除。2. 博文内容尽量控制在1200个文字内', '2015-06-20 16:59:29', '2', null, null);
INSERT INTO `tb_tags` VALUES ('144', '391', '内容合法健康', '2015-06-20 16:59:29', '2', null, null);
INSERT INTO `tb_tags` VALUES ('145', '391', '否则可能会被删除。2. 博文内容尽量控制在1200个文字内', '2015-06-20 16:59:29', '2', null, null);
INSERT INTO `tb_tags` VALUES ('146', '392', '123', '2015-06-20 18:31:13', '2', null, null);
INSERT INTO `tb_tags` VALUES ('147', '383', '123', '2015-06-20 18:33:14', '2', null, null);
INSERT INTO `tb_tags` VALUES ('151', '396', '测44', '2015-06-20 21:48:59', '2', null, null);
INSERT INTO `tb_tags` VALUES ('152', '397', '测试', '2015-06-20 21:52:02', '2', null, null);
INSERT INTO `tb_tags` VALUES ('153', '112', 'S1线', '2015-08-16 19:24:15', '1', null, null);
INSERT INTO `tb_tags` VALUES ('155', '359', '福鼎公园', '2015-09-21 22:37:54', '1', null, null);
INSERT INTO `tb_tags` VALUES ('156', '359', '公园', '2015-09-21 22:37:54', '1', null, null);

-- ----------------------------
-- Table structure for `tb_video`
-- ----------------------------
DROP TABLE IF EXISTS `tb_video`;
CREATE TABLE `tb_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int(11) DEFAULT '1' COMMENT '专辑ID',
  `album_name` varchar(200) DEFAULT '' COMMENT '专辑名称',
  `name` varchar(200) DEFAULT '' COMMENT '视频名称',
  `video_url` varchar(256) DEFAULT NULL COMMENT '点播视频路径',
  `video_net_url` varchar(256) DEFAULT NULL COMMENT '网络视频路径',
  `thumbnail` varchar(256) DEFAULT '' COMMENT '缩略图',
  `ext` varchar(20) DEFAULT '' COMMENT '扩展名',
  `resolution` varchar(20) DEFAULT '' COMMENT '分辨率',
  `status` int(11) DEFAULT '1' COMMENT '状态//ra dio/2,隐藏,1,显示',
  `is_comment` int(11) DEFAULT '1' COMMENT '是否评论//radio/2,否,1,是',
  `is_recommend` int(11) DEFAULT '2' COMMENT '是否推荐：2 否 1 是',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_user` varchar(64) DEFAULT '1' COMMENT '发布者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='视频';

-- ----------------------------
-- Records of tb_video
-- ----------------------------
INSERT INTO `tb_video` VALUES ('1', '5', '娱乐', '娱乐', 'download\\video\\20160217_094403_874395.mp4', null, 'http://i11.tietuku.cn/80643b0edf91c5d5.jpg', 'mp4', '', '1', '2', '1', '9', null, '2016-02-17 00:00:00', '系统管理员', '2016-02-17 09:35:53', '1', '2016-02-17 09:35:53', '1');
INSERT INTO `tb_video` VALUES ('2', '5', '娱乐', '娱乐1', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100221.flv', 'http://i11.tietuku.cn/3705a49b952e95f0.jpg', 'flv', '', '1', '1', '1', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:20', '1', '2016-02-19 17:32:20', '1');
INSERT INTO `tb_video` VALUES ('3', '5', '娱乐', '娱乐2', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100222.flv', 'http://i11.tietuku.cn/d00be751ab792bae.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:31', '1', '2016-02-19 17:32:31', '1');
INSERT INTO `tb_video` VALUES ('4', '5', '娱乐', '娱乐3', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100373.flv', 'http://i11.tietuku.cn/d261bf2348cbcec1.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:38', '1', '2016-02-19 17:32:38', '1');
INSERT INTO `tb_video` VALUES ('5', '5', '娱乐', '娱乐4', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100225.flv', 'http://i13.tietuku.cn/a1a829bd0ec99b57.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:43', '1', '2016-02-19 17:32:43', '1');
INSERT INTO `tb_video` VALUES ('6', '5', '娱乐', '娱乐5', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100235.flv', 'http://i13.tietuku.cn/638dbfb6ddcede91.jpg', 'flv', '', '1', '1', '2', '9', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:50', '1', '2016-02-19 17:32:50', '1');
INSERT INTO `tb_video` VALUES ('7', '5', '娱乐', '娱乐6', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100236.flv', 'http://i5.tietuku.cn/150941a559f04067.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:32:57', '1', '2016-02-19 17:32:57', '1');
INSERT INTO `tb_video` VALUES ('8', '5', '娱乐', '娱乐7', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100237.flv', 'http://i11.tietuku.cn/84668a447c6effbc.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:33:02', '1', '2016-02-19 17:33:02', '1');
INSERT INTO `tb_video` VALUES ('9', '5', '娱乐', '娱乐8', 'download\\video\\20160217_094403_874395.mp4', 'http://content.12530.com/media/v/20080416/100238.flv', 'http://i11.tietuku.cn/cb883f775bf9f86b.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-19 00:00:00', '系统管理员', '2016-02-19 17:33:08', '1', '2016-02-19 17:33:08', '1');
INSERT INTO `tb_video` VALUES ('10', '6', '新闻', '新闻1', null, 'http://content.12530.com/media/v/20080416/100061.flv', 'http://i4.tietuku.cn/4ff3ca1b9cf0358a.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:28:19', '1', '2016-02-20 09:28:19', '1');
INSERT INTO `tb_video` VALUES ('11', '2', '电影', '电影1', null, 'http://content.12530.com/media/v/20080416/100051.flv', 'http://i12.tietuku.cn/e11c25401d5a72ef.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:41:58', '1', '2016-02-20 09:41:58', '1');
INSERT INTO `tb_video` VALUES ('12', '2', '电影', '电影2', null, 'http://content.12530.com/media/v/20080416/100052.flv', 'http://i13.tietuku.cn/4512392c7337a433.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:42:52', '1', '2016-02-20 09:42:52', '1');
INSERT INTO `tb_video` VALUES ('13', '1', '电视剧', '电视剧1', null, 'http://content.12530.com/media/v/20080416/100067.flv', 'http://i13.tietuku.cn/1254065a8c0200d3.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:43:36', '1', '2016-02-20 09:43:36', '1');
INSERT INTO `tb_video` VALUES ('14', '3', '综艺', '综艺1', null, 'http://content.12530.com/media/v/20080416/100071.flv', 'http://i13.tietuku.cn/440847c1aa76fc5e.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:44:54', '1', '2016-02-20 09:44:54', '1');
INSERT INTO `tb_video` VALUES ('15', '4', '动漫', '动漫1', null, 'http://content.12530.com/media/v/20080416/100081.flv', 'http://i11.tietuku.cn/11591386b92cb57b.png', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:45:38', '1', '2016-02-20 09:45:38', '1');
INSERT INTO `tb_video` VALUES ('16', '4', '动漫', '动漫2', null, 'http://content.12530.com/media/v/20080416/100082.flv', 'http://i13.tietuku.cn/f61ae07bf891e96d.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:46:01', '1', '2016-02-20 09:46:01', '1');
INSERT INTO `tb_video` VALUES ('17', '4', '动漫', '动漫3', null, 'http://content.12530.com/media/v/20080416/100083.flv', 'http://i13.tietuku.cn/e067a3e087c927cf.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:47:23', '1', '2016-02-20 09:47:23', '1');
INSERT INTO `tb_video` VALUES ('18', '4', '动漫', '动漫4', null, 'http://content.12530.com/media/v/20080416/100084.flv', 'http://i11.tietuku.cn/d93e14328746610a.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:47:58', '1', '2016-02-20 09:47:58', '1');
INSERT INTO `tb_video` VALUES ('19', '4', '动漫', '动漫5', null, 'http://content.12530.com/media/v/20080416/100085.flv', 'http://i11.tietuku.cn/950af81428ab6a9c.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:48:16', '1', '2016-02-20 09:48:16', '1');
INSERT INTO `tb_video` VALUES ('20', '4', '动漫', '动漫6', null, 'http://content.12530.com/media/v/20080416/100086.flv', 'http://i12.tietuku.cn/ec8dc8f804b43ba9.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:49:30', '1', '2016-02-20 09:49:30', '1');
INSERT INTO `tb_video` VALUES ('21', '2', '电影', '电影3', null, 'http://content.12530.com/media/v/20080416/100053.flv', 'http://i11.tietuku.cn/118422ba30d4e86f.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:50:50', '1', '2016-02-20 09:50:50', '1');
INSERT INTO `tb_video` VALUES ('22', '2', '电影', '电影4', null, 'http://content.12530.com/media/v/20080416/100054.flv', 'http://i11.tietuku.cn/ff6674776e64019b.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:51:00', '1', '2016-02-20 09:51:00', '1');
INSERT INTO `tb_video` VALUES ('23', '2', '电影', '电影5', null, 'http://content.12530.com/media/v/20080416/100055.flv', 'http://i11.tietuku.cn/3f2ff3cf11bb5761.jpg', 'flv', '', '1', '1', '2', '10', null, '2016-02-20 00:00:00', '系统管理员', '2016-02-20 09:51:31', '1', '2016-02-20 09:51:31', '1');

-- ----------------------------
-- Table structure for `tb_video_album`
-- ----------------------------
DROP TABLE IF EXISTS `tb_video_album`;
CREATE TABLE `tb_video_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '专辑名称',
  `remark` text COMMENT '描述',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态//radio/2,隐藏,1,显示',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT '0' COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='专辑';

-- ----------------------------
-- Records of tb_video_album
-- ----------------------------
INSERT INTO `tb_video_album` VALUES ('1', '0', '电视剧', null, '10', '1', '2016-02-16 16:57:54', '1', '2016-02-16 16:57:54', '1');
INSERT INTO `tb_video_album` VALUES ('2', '0', '电影', null, '10', '1', '2016-02-16 16:58:00', '1', '2016-02-16 16:58:00', '1');
INSERT INTO `tb_video_album` VALUES ('3', '0', '综艺', null, '10', '1', '2016-02-16 16:58:09', '1', '2016-02-16 16:58:09', '1');
INSERT INTO `tb_video_album` VALUES ('4', '0', '动漫', null, '10', '1', '2016-02-16 16:58:17', '1', '2016-02-16 16:58:17', '1');
INSERT INTO `tb_video_album` VALUES ('5', '0', '娱乐', null, '10', '1', '2016-02-16 16:58:22', '1', '2016-02-16 16:58:22', '1');
INSERT INTO `tb_video_album` VALUES ('6', '0', '新闻', null, '10', '1', '2016-02-16 16:58:26', '1', '2016-02-16 16:58:26', '1');

-- ----------------------------
-- Table structure for `tb_video_tags`
-- ----------------------------
DROP TABLE IF EXISTS `tb_video_tags`;
CREATE TABLE `tb_video_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `video_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `tagname` varchar(200) DEFAULT '' COMMENT '标签内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT '0' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频标签';

-- ----------------------------
-- Records of tb_video_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `weixin`
-- ----------------------------
DROP TABLE IF EXISTS `weixin`;
CREATE TABLE `weixin` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of weixin
-- ----------------------------
