### 用户

#### 列表

| action | 请求方式 |
| --- | --- |
| /system/user/lists | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| keyword | 否 |  筛选关键字 | 
| offset | 否 |  分页起始位置 | 
| pageSize | 否 |  分页大小 | 

##### 响应

| 参数 | 类型|描述 |
| --- | --- | --- |
| lists |array | 用户列表数据 |
| lists.userGroup | array | 用户关联的用户组信息 |
| total | int | 列表总数 |

```json
{
    "lists": [
        {
            "id": 1,
            "username": "admin",
            "last_login_ip": "0.0.0.0",
            "last_login_time": "2019-09-23 18:36:02",
            "status": 1,
            "description": "",
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-23 18:36:02",
            "userGroup": [
                {
                    "id": 1,
                    "name": "超级管理员",
                    "description": "123123123143423",
                    "create_time": "2019-09-20 16:26:13",
                    "update_time": "2019-09-20 17:42:41"
                }
            ]
        }
    ],
    "total": 2
}
```

#### 添加/编辑用户

| action | 请求方式 |
| --- | --- |
| /system/user/save | POST |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | - |  用户ID 有值为编辑 否则为添加 | 
| username | 是 |  用户名 | 
| password | - |  密码 添加必填 | 
| status | 是 |  状态 |

#### 删除用户

| action | 请求方式 |
| --- | --- |
| /system/user/remove | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | 是 |  用户ID| 

### 用户组

#### 列表

| action | 请求方式 |
| --- | --- |
| /system/userGroup/lists | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| keyword | 否 |  筛选关键字 | 
| offset | 否 |  分页起始位置 | 
| pageSize | 否 |  分页大小 | 

##### 响应

| 参数 | 类型    | 描述       |
| --- |-------|----------|
| lists | array | 用户组列表数据  |
| lists.auth | array | 用户组已关联权限 |
| lists.user | int   | 关联用户数量   |
| total | int   | 列表总数     |

```json
{
    "lists": [
        {
            "id": 1,
            "name": "超级管理员",
            "description": "123123123143423",
            "create_time": "2019-09-20 16:26:13",
            "update_time": "2019-09-20 17:42:41",
            "auth": [
                {
                    "id": 1,
                    "name": "系统设置-用户管理",
                    "description": "",
                    "create_time": "2019-09-20 16:26:13",
                    "update_time": "2019-09-20 16:26:13"
                }
            ],
            "user": [
                {
                    "id": 1,
                    "username": "admin",
                    "last_login_ip": "0.0.0.0",
                    "last_login_time": "2019-09-23 18:36:02",
                    "status": 1,
                    "description": "",
                    "create_time": "2019-09-20 16:26:13",
                    "update_time": "2019-09-23 18:36:02"
                }
            ]
        }
    ],
    "total": 1
}
```

#### 添加/编辑用户组

| action | 请求方式 |
| --- | --- |
| /system/userGroup/save | POST |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | - |  用户组ID 有值为编辑 否则为添加 | 
| name | 是 |  名称 | 
| description | 否 |  描述 |

#### 删除用户组

| action | 请求方式 |
| --- | --- |
| /system/userGroup/remove | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | 是 |  用户组ID|

#### 获取用户组用户关联信息

| action | 请求方式 |
| --- | --- |
| /system/userGroup/getUser | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | 是 |  用户组ID | 
| keyword | 否 |  未关联用户筛选关键字 | 
| offset | 否 |  分页起始位置 | 
| pageSize | 否 |  分页大小 | 

> 分页是相对于未关联用户而言的

##### 响应

| 参数 | 类型|描述 |
| --- | --- | --- |
| lists.assign |array | 已关联全部用户列表 |
| lists.noAssign | array | 未关联用户列表(分页) |
| total | int | 未关联用户总数 |

```json
{
    "lists": {
        "assign": [
            {
                "id": 1,
                "username": "admin",
                "last_login_ip": "0.0.0.0",
                "last_login_time": "2019-09-23 18:36:02",
                "status": 1,
                "description": "",
                "create_time": "2019-09-20 16:26:13",
                "update_time": "2019-09-23 18:36:02"
            }
        ],
        "noAssign": [
            {
                "id": 2,
                "username": "test",
                "last_login_ip": "",
                "last_login_time": "",
                "status": 1,
                "description": "",
                "create_time": "2019-09-20 18:13:35",
                "update_time": "2019-09-20 18:13:35"
            }
        ]
    },
    "total": 1
}
```

#### 添加用户到用户组

| action | 请求方式 |
| --- | --- |
| /system/userGroup/assignUser | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | 是 |  用户组ID | 
| userId | 是 |  用户ID | 

#### 移除用户从用户组

| action | 请求方式 |
| --- | --- |
| /system/userGroup/removeUser | GET |

##### 参数

| 参数名 | 必填 | 说明 |
| --- | --- | --- |
| id | 是 |  用户组ID | 
| userId | 是 |  用户ID | 
