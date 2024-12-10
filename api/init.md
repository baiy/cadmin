### 系统登录

| action | 请求方式 |
| --- | --- |
| /login | POST |

> 无需`token`参数
 
##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| username | 是 |  用户名 | 
| password | 是 |  密码 | 

##### 响应

```json
{"token": "6bb74bd2d4842b6b6bd7939e65e721bf"}
```

### 系统退出

| action | 请求方式 |
| --- | --- |
| /logout | GET |

> 该接口无业务请求参数/响应参数,该接口服务端只需要验证登录即可,无需校验其他权限

### 系统数据加载

| action | 请求方式 |
| --- | --- |
| /load | GET |

> 该接口无业务请求参数,该接口服务端只需要验证登录即可,无需校验其他权限

##### 调用场景
该接口在用户登录完成以后调用, 初始化用户相关数据(用户信息/菜单/权限)等基础数据. 客户端可定期调用该接口来更新客户端基础数据

##### 响应

| 参数 | 类型|描述 |
| --- | --- | --- |
| user |object| 当前登录用户信息 |
| allUser| array | 系统所有用户的信息 |
| menu | array|用户已授权菜单数据(无需排序) |
| request| array | 用户已授权请求数据 |
| auth| array | 用户已授权权限 |
| userGroup| array | 用户已授权用户组 |

```json
{
    "user": {
        "id": 1,
        "username": "admin",
        "last_login_ip": "0.0.0.0",
        "last_login_time": "2019-09-23 18:16:30",
        "status": 1,
        "description": "",
        "create_time": "2019-09-20 16:26:13",
        "update_time": "2019-09-23 18:16:30"
    },
    "allUser": [
        {
            "id": 1,
            "username": "admin",
            "last_login_ip": "0.0.0.0",
            "last_login_time": "2019-09-23 18:16:30",
            "status": 1,
            "description": "",
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-23 18:16:30"
        }
    ],
    "menu": [
        {
            "id": 1,
            "parent_id": 0,
            "title": "系统设置",
            "name": "",
            "url": "",
            "url_template": "",
            "description": "",
            "sort": 1,
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-20 16:26:13"
        }
    ],
    "request": [
        {
            "id": 10,
            "type": "default",
            "name": "用户管理-用户-列表数据",
            "action": "\/system\/user\/lists",
            "call": "Baiy.Cadmin.System.User.lists",
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-20 16:26:13"
        }
    ],
    "auth": [
        {
            "id": 1,
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-20 16:26:13",
            "name": "系统设置-用户管理",
            "description": ""
        }
    ],
    "userGroup": [
        {
            "id": 1,
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-20 17:42:41",
            "name": "超级管理员",
            "description": "123123123143423"
        }
    ]
}
```

### 当前用户设置

| action | 请求方式 |
| --- | --- |
| /setting/user/current | POST |

> 该接口服务端只需要验证登录即可,无需校验其他权限

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| username | 是 |  用户名 | 
| password | - |  密码 | 
| repeatPassword | - |  重复密码 |



