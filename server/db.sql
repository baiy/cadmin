CREATE TABLE `admin_auth`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(100)     NOT NULL DEFAULT '' COMMENT '名称',
    `description` varchar(255)     NOT NULL DEFAULT '' COMMENT '描述',
    `create_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='权限';

CREATE TABLE `admin_menu`
(
    `id`                  int(10) unsigned NOT NULL AUTO_INCREMENT,
    `parent_id`           int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
    `name`                varchar(100)     NOT NULL DEFAULT '' COMMENT '标题',
    `url`                 varchar(255)     NOT NULL DEFAULT '' COMMENT '链接 为空为目录菜单',
    `icon`                varchar(30)      NOT NULL DEFAULT '' COMMENT 'icon',
    `admin_menu_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分组',
    `description`         varchar(255)     NOT NULL DEFAULT '' COMMENT '描述',
    `sort`                int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值 越小越在前',
    `create_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `url` (`url`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='菜单';

CREATE TABLE `admin_menu_group`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(100)     NOT NULL DEFAULT '' COMMENT '分组名称',
    `template`    varchar(255)     NOT NULL DEFAULT '' COMMENT 'url模版 使用 {url} 代表菜单 url',
    `description` varchar(255)     NOT NULL DEFAULT '' COMMENT '描述',
    `create_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '菜单分组';

CREATE TABLE `admin_menu_relate`
(
    `id`            int(10) unsigned NOT NULL AUTO_INCREMENT,
    `admin_auth_id` int(10) unsigned NOT NULL,
    `admin_menu_id` int(10) unsigned NOT NULL,
    `create_time`   timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `unique` (`admin_auth_id`, `admin_menu_id`) USING BTREE,
    CONSTRAINT `admin_menu_relate_admin_auth_id` FOREIGN KEY (`admin_auth_id`) REFERENCES `admin_auth` (`id`) ON DELETE CASCADE,
    CONSTRAINT `admin_menu_relate_admin_menu_id` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menu` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '菜单权限关联';

CREATE TABLE `admin_request`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `type`        varchar(50)      NOT NULL DEFAULT 'default' COMMENT '请求类型',
    `name`        varchar(100)     NOT NULL DEFAULT '' COMMENT '名称',
    `action`      varchar(100)     NOT NULL DEFAULT '' COMMENT 'action',
    `call`        varchar(100)     NOT NULL DEFAULT '' COMMENT '类型配置',
    `create_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `action` (`action`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '请求';

CREATE TABLE `admin_request_relate`
(
    `id`               int(10) unsigned NOT NULL AUTO_INCREMENT,
    `admin_auth_id`    int(10) unsigned NOT NULL,
    `admin_request_id` int(10) unsigned NOT NULL,
    `create_time`      timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `unique` (`admin_auth_id`, `admin_request_id`) USING BTREE,
    CONSTRAINT `admin_request_relate_admin_auth_id` FOREIGN KEY (`admin_auth_id`) REFERENCES `admin_auth` (`id`) ON DELETE CASCADE,
    CONSTRAINT `admin_request_relate_admin_request_id` FOREIGN KEY (`admin_request_id`) REFERENCES `admin_request` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '请求权限关联';

CREATE TABLE `admin_user`
(
    `id`              int(10) unsigned    NOT NULL AUTO_INCREMENT,
    `username`        varchar(100)        NOT NULL DEFAULT '' COMMENT '用户名',
    `password`        varchar(255)        NOT NULL DEFAULT '' COMMENT '密码',
    `last_login_ip`   varchar(15)         NOT NULL DEFAULT '' COMMENT '最后登录IP',
    `last_login_time` timestamp           NULL     DEFAULT NULL COMMENT '最后登录时间',
    `status`          tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
    `description`     varchar(150)        NOT NULL DEFAULT '' COMMENT '描述',
    `create_time`     timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '管理员用户';

CREATE TABLE `admin_user_group`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(100)     NOT NULL DEFAULT '' COMMENT '名称',
    `description` varchar(255)     NOT NULL DEFAULT '' COMMENT '描述',
    `create_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '用户组';

CREATE TABLE `admin_user_relate`
(
    `id`                  int(10) unsigned NOT NULL AUTO_INCREMENT,
    `admin_user_group_id` int(10) unsigned NOT NULL,
    `admin_user_id`       int(10) unsigned NOT NULL,
    `create_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `unique` (`admin_user_group_id`, `admin_user_id`) USING BTREE,
    CONSTRAINT `admin_user_relate_admin_user_group_id` FOREIGN KEY (`admin_user_group_id`) REFERENCES `admin_user_group` (`id`) ON DELETE CASCADE,
    CONSTRAINT `admin_user_relate_admin_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '用户组关联';

CREATE TABLE `admin_user_group_relate`
(
    `id`                  int(10) unsigned NOT NULL AUTO_INCREMENT,
    `admin_user_group_id` int(10) unsigned NOT NULL,
    `admin_auth_id`       int(10) unsigned NOT NULL,
    `create_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `unique` (`admin_user_group_id`, `admin_auth_id`) USING BTREE,
    CONSTRAINT `admin_user_group_relate_admin_auth_id` FOREIGN KEY (`admin_auth_id`) REFERENCES `admin_auth` (`id`) ON DELETE CASCADE,
    CONSTRAINT `admin_user_group_relate_admin_user_group_id` FOREIGN KEY (`admin_user_group_id`) REFERENCES `admin_user_group` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '用户组权限关联';

CREATE TABLE `admin_token`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `token`         varchar(32)         NOT NULL DEFAULT '' COMMENT 'token',
    `admin_user_id` int(10) unsigned    NOT NULL COMMENT '用户ID',
    `expire_time`   timestamp           NULL     DEFAULT NULL COMMENT '过期时间',
    `create_time`   timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `token` (`token`) USING BTREE,
    KEY `expire_time` (`expire_time`) USING BTREE,
    CONSTRAINT `admin_token_admin_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT = '登录token';


## 插入内置数据
INSERT INTO `admin_auth`(`id`, `name`, `description`)
VALUES (1, '游客', '无需鉴权, 所有人都可以使用 系统内置权限'),
       (2, '登录用户', '所有已登录用户可以使用 系统内置权限'),
       (3, '系统设置', '');

INSERT INTO `admin_menu_group`(`id`, `name`, `template`, `description`)
VALUES (1, '后台基础操作', '', '系统内置功能分组'),
       (2, '外部链接', '{url}', '前端根据该id识别自动跳转外部链接 系统内置功能分组');

INSERT INTO `admin_menu`(`id`, `parent_id`, `name`, `url`, `admin_menu_group_id`, `sort`)
VALUES (1, 0, '首页', '/home', 1, 1),
       (100, 0, '系统设置', '', 0, 2),

       (110, 100, '用户管理', '', 0, 1),
       (111, 110, '用户', '/system/user', 1, 1),
       (112, 110, '用户组', '/system/userGroup', 1, 2),

       (120, 100, '菜单管理', '', 0, 1),
       (121, 120, '菜单', '/system/menu', 1, 1),
       (122, 120, '菜单分组', '/system/menuGroup', 1, 2),

       (130, 100, '权限管理', '', 0, 2),
       (131, 130, '请求', '/system/request', 1, 1),
       (132, 130, '权限', '/system/auth', 1, 3);

INSERT INTO `admin_menu_relate`(`admin_auth_id`, `admin_menu_id`)
VALUES (2, 1),

       (3, 100),
       (3, 110),
       (3, 111),
       (3, 112),
       (3, 120),
       (3, 121),
       (3, 122),
       (3, 130),
       (3, 131),
       (3, 132);

INSERT INTO `admin_request`(`id`, `type`, `name`, `action`, `call`)
VALUES (1, 'default', '登录', '/login', 'Baiy.Cadmin.System.Index.login'),
       (2, 'default', '退出', '/logout', 'Baiy.Cadmin.System.Index.logout'),
       (3, 'default', '初始数据加载', '/load', 'Baiy.Cadmin.System.Index.load'),
       (4, 'default', '当前用户编辑', '/setting/user/current', 'Baiy.Cadmin.System.User.currentSetting'),

       (100, 'default', '用户管理-用户-列表数据', '/system/user/lists', 'Baiy.Cadmin.System.User.lists'),
       (101, 'default', '用户管理-用户-保存', '/system/user/save', 'Baiy.Cadmin.System.User.save'),
       (102, 'default', '用户管理-用户-删除', '/system/user/remove', 'Baiy.Cadmin.System.User.remove'),

       (110, 'default', '用户管理-用户组-列表数据', '/system/userGroup/lists', 'Baiy.Cadmin.System.UserGroup.lists'),
       (111, 'default', '用户管理-用户组-保存', '/system/userGroup/save', 'Baiy.Cadmin.System.UserGroup.save'),
       (112, 'default', '用户管理-用户组-删除', '/system/userGroup/remove', 'Baiy.Cadmin.System.UserGroup.remove'),
       (113, 'default', '用户管理-用户组-获取用户分组信息', '/system/userGroup/getUser', 'Baiy.Cadmin.System.UserGroup.getUser'),
       (114, 'default', '用户管理-用户组-用户分配', '/system/userGroup/assignUser', 'Baiy.Cadmin.System.UserGroup.assignUser'),

       (200, 'default', '菜单管理-菜单-列表数据', '/system/menu/lists', 'Baiy.Cadmin.System.Menu.lists'),
       (201, 'default', '菜单管理-菜单-排序', '/system/menu/sort', 'Baiy.Cadmin.System.Menu.sort'),
       (202, 'default', '菜单管理-菜单-保存', '/system/menu/save', 'Baiy.Cadmin.System.Menu.save'),
       (203, 'default', '菜单管理-菜单-删除', '/system/menu/remove', 'Baiy.Cadmin.System.Menu.remove'),
       (204, 'default', '菜单管理-菜单-所有菜单分组', '/system/menu/group', 'Baiy.Cadmin.System.Menu.group'),

       (211, 'default', '菜单管理-菜单分组-列表数据', '/system/menuGroup/lists', 'Baiy.Cadmin.System.MenuGroup.lists'),
       (212, 'default', '菜单管理-菜单分组-保存', '/system/menuGroup/save', 'Baiy.Cadmin.System.MenuGroup.save'),
       (213, 'default', '菜单管理-菜单分组-删除', '/system/menuGroup/remove', 'Baiy.Cadmin.System.MenuGroup.remove'),

       (300, 'default', '权限管理-请求-列表数据', '/system/request/lists', 'Baiy.Cadmin.System.Request.lists'),
       (301, 'default', '权限管理-请求-保存', '/system/request/save', 'Baiy.Cadmin.System.Request.save'),
       (302, 'default', '权限管理-请求-删除', '/system/request/remove', 'Baiy.Cadmin.System.Request.remove'),
       (303, 'default', '权限管理-请求-类型映射', '/system/request/type', 'Baiy.Cadmin.System.Request.type'),

       (310, 'default', '权限管理-权限-列表数据', '/system/auth/lists', 'Baiy.Cadmin.System.Auth.lists'),
       (311, 'default', '权限管理-权限-保存', '/system/auth/save', 'Baiy.Cadmin.System.Auth.save'),
       (312, 'default', '权限管理-权限-删除', '/system/auth/remove', 'Baiy.Cadmin.System.Auth.remove'),
       (313, 'default', '权限管理-权限-获取请求分配信息', '/system/auth/getRequest', 'Baiy.Cadmin.System.Auth.getRequest'),
       (314, 'default', '权限管理-权限-请求分配', '/system/auth/assignRequest', 'Baiy.Cadmin.System.Auth.assignRequest'),

       (320, 'default', '权限管理-权限-获取用户组分配信息', '/system/auth/getUserGroup', 'Baiy.Cadmin.System.Auth.getUserGroup'),
       (321, 'default', '权限管理-权限-用户组分配', '/system/auth/assignUserGroup', 'Baiy.Cadmin.System.Auth.assignUserGroup'),
       (322, 'default', '权限管理-权限-获取菜单分配信息', '/system/auth/getMenu', 'Baiy.Cadmin.System.Auth.getMenu'),
       (323, 'default', '权限管理-权限-分配菜单', '/system/auth/assignMenu', 'Baiy.Cadmin.System.Auth.assignMenu');

INSERT INTO `admin_request_relate`(`admin_auth_id`, `admin_request_id`)
VALUES (1, 1),
       (2, 2),
       (2, 3),
       (2, 4),

       (3, 100),
       (3, 101),
       (3, 102),
       (3, 110),
       (3, 111),
       (3, 112),
       (3, 113),
       (3, 114),
       (3, 200),
       (3, 201),
       (3, 202),
       (3, 203),
       (3, 204),
       (3, 211),
       (3, 212),
       (3, 213),
       (3, 300),
       (3, 301),
       (3, 302),
       (3, 303),
       (3, 310),
       (3, 311),
       (3, 312),
       (3, 313),
       (3, 314),
       (3, 320),
       (3, 321),
       (3, 322),
       (3, 323);

INSERT INTO `admin_user`(`id`, `username`, `password`)
VALUES (1, 'admin',
        'ZjU3NzE5ZWU3OWFlYjQ1MzMyNzI1NTI5NDNlNzZiZjk3ZGVlNWMwZDRkMTU1ZDRiOThlNWUwMjRmOGZlMmZmZnwxanVlYXEyOQ==');

INSERT INTO `admin_user_group`(`id`, `name`, `description`)
VALUES (1, '超级管理员', '特殊分组 强制拥有所有权限');

INSERT INTO `admin_user_relate`(`admin_user_group_id`, `admin_user_id`)
VALUES (1, 1);


## 设置自增id 方便后期插入内置功能
ALTER TABLE `admin_auth`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_menu`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_menu_group`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_menu_relate`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_request`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_request_relate`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_user`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_user_group`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_user_relate`
    AUTO_INCREMENT = 5000;
ALTER TABLE `admin_user_group_relate`
    AUTO_INCREMENT = 5000;

