/*
 Navicat Premium Data Transfer

 Source Server         : BLOG
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 39.104.66.213:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 29/01/2021 19:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `userId` int NOT NULL,
  `userName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------

-- ----------------------------
-- Table structure for article_info
-- ----------------------------
DROP TABLE IF EXISTS `article_info`;
CREATE TABLE `article_info`  (
  `articleId` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articleTitle` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `articleDesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `articleContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `articleOrder` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `articleType` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `articleDate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `articleTags` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `viewCount` int NULL DEFAULT NULL,
  `articleIndex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_info
-- ----------------------------
INSERT INTO `article_info` VALUES ('1610522999752', 'Vue和React的比较', '`Vue` 和 `React` 的比较', '## 1、根本理念上的不同\nVue 和 React 之间最根本的区别在于 它们对待自己的定位是不一样的。\n\n从它们官网直观来看，React 把自己描述为  “一个用于构建用户界面的 JavaScript 库” ，而 Vue.js 则把自己描述为 “渐进式 JavaScript 框架”。一个是库 一个是框架。从历史上看，库和框架都专注于让它们的工作表现得更出色，但 框架的要求和提供的能力更全面详尽，而库则更少更轻量。\n\n## 2、单文件组件\n\nVue 和 React 都有用来创建 UI 的组件。\n\n组件通常由 3 部分组成：\n1. UI (HTML)\n2. 行为 (JavaScript)\n3. 外观 (CSS)\n\nVue 是单文件 开箱即可使用 一个 .vue 文件已经帮你区分好了基本的三大模块\n\n ```javascript\n<template>\n  <p>{{ greeting }} World!</p>\n</template>\n\n// 行为\n<script>\n\n</script>\n\n\n// 样式\n<style scoped>\n\n</style>\n```\n\nReact 组件提供了开箱即用的 UI 和 行为部分  ，但是样式在很大程度上不受限制.\n ```javascript\n import React, { useState } from \'react\';\n\nfunction Button() {\n  const [count, setCount] = useState(0);\n\n  return (\n    <button onClick={() => setCount(count + 1)}>\n      Current count: {count}\n      <br />\n      Click me\n    </button>\n  );\n}\n```\n\n当然了，React 有一个非常活跃的社区，所以如果你想包含样式，可以轻松使用第三方的库 比如 ==Emotion== 或 ==Styled Components== 等 来填补样式的空缺，但是：\n	1. 它们是非内置的；\n	3. 你必须知道这些库才能使用他们。\ntips: 官方的 推荐`css`方案是 `css in js` 像  `Styled Components`  这种就是 ==css in js== 方案\n\n## 3. 开发当中的不同 \n\n### 3.1 v-model （最重要的一个部分）\n通俗来说 Vue 和React 他们 很大的一个使用上的区别是 `Vue` 是自动挡 而React 是手动挡。Vue 当中 你使用`v-model` 就会自动为你进行 视图与数据的统一， 而`React` 则需要你 自己手动去触发 `this.setState`。\n\n### 3.2  插槽\n在 Vue 中 会有插槽这个概念 而 React 当中是没有的\n```javascript\n<!-- A Vue.js component template named \"base-layout\" -->\n<div class=\"container\">\n  <header>\n    <slot name=\"header\"></slot>\n  </header>\n  <main>\n    <slot></slot>\n  </main>\n  <footer>\n    <slot name=\"footer\"></slot>\n  </footer>\n</div>\n\n<!-- When \"base-layout\" is used -->\n<base-layout>\n  <template v-slot:header>\n    <h1>Here might be a page title</h1>\n  </template>\n\n  <template v-slot:default>\n    <p>A paragraph for the main content.</p>\n    <p>And another one.</p>\n  </template>\n\n  <template v-slot:footer>\n    <p>Here\'s some contact info</p>\n  </template>\n</base-layout>\n```\n### 3.3 指令\n\nVue.js 确实关注“代码重用和抽象的主要形式是组件”，有官方的一些指令 比如 `v-show` `v-if` `v-bind` `v-model` 等 。当然还可以 自定义指令 这里有一个使用自定义指令不错的例子，通过v-focus在 mount 时自动聚焦到元素上：\n```javascript\nconst app = Vue.createApp({})\n// Register a global custom directive called `v-focus`\napp.directive(\'focus\', {\n  // When the bound element is mounted into the DOM...\n  mounted(el) {\n    // Focus the element\n    el.focus()\n  }\n})\n\n// 使用\n<input v-focus />\n```\n\nReact 当中没指令这个概念\n', '1', '文章BLOG', '2021-01-01', '[{\"title\":\"Vue\",\"color\":\"#a28e54\"},{\"title\":\"React\",\"color\":\"#f4ad4a\"}]', 12, NULL);
INSERT INTO `article_info` VALUES ('1610523647607', '我的VUE中Axios接口管理规范', '`Axios` 请求封装', '# 1. axios 的封装\n######  1.1 安装axios\n```javascript\n	npm install axios;\n```\n\n###### 1.2 引入\n一般我会在项目的src目录中，新建一个request文件夹，然后在里面新建一个http.js和一个api.js文件。http.js文件用来封装我们的axios，api.js用来统一管理我们的接口。\n```java\n// 在http.js中引入axios\nimport axios from \'axios\'; // 引入axios\nimport QS from \'qs\'; // 可有可没有看实际项目情况 引入qs模块，用来序列化post类型的数据，后面会提到\n// vant的toast提示框组件，大家可根据自己的ui组件更改。\nimport { Toast } from \'vant\'; 	// 进行报错等\n```\n###### 1.3 环境的切换\n我们的项目环境可能有开发环境、测试环境和生产环境。我们通过node的环境变量来匹配我们的默认的接口url前缀。axios.defaults.baseURL可以设置axios的默认请求地址就不多说了。\n```java\n// 环境的切换\nif (process.env.NODE_ENV == \'development\') {    \n    axios.defaults.baseURL = \'https://www.baidu.com\';} \nelse if (process.env.NODE_ENV == \'debug\') {    \n    axios.defaults.baseURL = \'https://www.ceshi.com\';\n} \nelse if (process.env.NODE_ENV == \'production\') {    \n    axios.defaults.baseURL = \'https://www.production.com\';\n}\n```\n###### 1.4 设置请求超时\n通过axios.defaults.timeout设置默认的请求超时时间。例如超过了10s，就会告知用户当前请求超时，请刷新等。\n```jav\naxios.defaults.timeout = 10000;       	//单位毫秒\n```\n###### 1.5 设置请求头\npost请求的时候，我们需要加上一个请求头，所以可以在这里进行一个默认的设置，即设置post的请求头为application/x-www-form-urlencoded;charset=UTF-8\n```ja\naxios.defaults.headers.post[\'Content-Type\'] = \'application/x-www-form-urlencoded;charset=UTF-8\';\n```\n###### 1.6 请求拦截\n会首先从本地存储中读取token，如果token存在说明用户已经登陆过，则更新vuex中的token状态。然后，在每次请求接口的时候，都会在请求的header中携带token，后台人员就可以根据你携带的token来判断你的登录是否过期，如果没有携带，则说明没有登录过。 一般我们会在里面放入token 这是最常见的形式了，当然不排除其他的东西\n```ja\n// 先导入vuex,因为我们要使用到里面的状态对象 可根据情况来定 需不需要 \n// vuex的路径根据自己的路径去写\nimport store from \'@/store/index\';\n\n// 请求拦截器\naxios.interceptors.request.use(    \n    config => {        \n        // 每次发送请求之前判断vuex中是否存在token        \n        // 如果存在，则统一在http请求的header都加上token，这样后台根据token判断你的登录情况\n        // 即使本地存在token，也有可能token是过期的，所以在响应拦截器中要对返回状态进行判断 \n        const token = store.state.token;        \n        token && (config.headers.Authorization = token);        \n        return config;    \n    },    \n    error => {        \n        return Promise.error(error);    \n})\n```\n###### 1.7 响应的拦截\n```jav\n/ 响应拦截器\naxios.interceptors.response.use(    \n    response => {   \n        // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据     \n        /**\n        *否则的话抛出错误 还有一种情况就算接口是成功了 \n        *但是 可能是一些异常操作比如已经操作过了的这种情况（如下图）\n        *后端会给你一个反馈可以进行更加细化的一些操作。我们可以直接判断响应体里面的code \n        *这个需要和后端约定\n        /\n        if (response.status === 200) {            \n            return Promise.resolve(response);        \n        } else {            \n            return Promise.reject(response);        \n        }    \n    },    \n    // 服务器状态码不是2开头的的情况\n    // 这里可以跟你们的后台开发人员协商好统一的错误状态码    \n    // 然后根据返回的状态码进行一些操作，例如登录过期提示，错误提示等等\n    // 下面列举几个常见的操作，其他需求可自行扩展\n    error => {            \n        if (error.response.status) {            \n            switch (error.response.status) {                \n                // 401: 未登录\n                // 未登录则跳转登录页面，并携带当前页面的路径\n                // 在登录成功后返回当前页面，这一步需要在登录页操作。                \n                case 401:                    \n                    router.replace({                        \n                        path: \'/login\',                        \n                        query: { \n                            redirect: router.currentRoute.fullPath \n                        }\n                    });\n                    break;\n\n                // 403 token过期\n                // 登录过期对用户进行提示\n                // 清除本地token和清空vuex中token对象\n                // 跳转登录页面                \n                case 403:\n                     Toast({\n                        message: \'登录过期，请重新登录\',\n                        duration: 1000,\n                        forbidClick: true\n                    });\n                    // 清除token\n                    localStorage.removeItem(\'token\');\n                    store.commit(\'loginSuccess\', null);\n                    // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面 \n                    setTimeout(() => {                        \n                        router.replace({                            \n                            path: \'/login\',                            \n                            query: { \n                                redirect: router.currentRoute.fullPath \n                            }                        \n                        });                    \n                    }, 1000);                    \n                    break; \n\n                // 404请求不存在\n                case 404:\n                    Toast({\n                        message: \'网络请求不存在\',\n                        duration: 1500,\n                        forbidClick: true\n                    });\n                    break;\n                // 其他错误，直接抛出错误提示\n                default:\n                    Toast({\n                        message: error.response.data.message,\n                        duration: 1500,\n                        forbidClick: true\n                    });\n            }\n            return Promise.reject(error.response);\n        }\n    }    \n});\n```\n响应拦截器很好理解，就是服务器返回给我们的数据，我们在拿到之前可以对他进行一些处理。例如上面的思想：如果后台返回的状态码是200，则正常返回数据，否则的根据错误的状态码类型进行一些我们需要的错误，其实这里主要就是进行了错误的统一处理和没登录或登录过期后调整登录页的一个操作。下图是上面说的细化情况  ==**要注意的是，上面的Toast()方法，是我引入的vant库中的toast轻提示组件，你根据你的ui库，对应使用你的一个提示组件。**==\n![在这里插入图片描述](https://img-blog.csdnimg.cn/2020111118040492.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxNjI5NTIy,size_16,color_FFFFFF,t_70#pic_center)\n###### 1.8  封装get方法和post方法\n我们常用的ajax请求方法有get、post、put等方法，相信小伙伴都不会陌生。axios对应的也有很多类似的方法，不清楚的可以看下文档。但是为了简化我们的代码，我们还是要对其进行一个简单的封装。下面我们主要封装两个方法：get和post。\n\n==get方法==：我们通过定义一个get函数，get函数有两个参数，第一个参数表示我们要请求的url地址，第二个参数是我们要携带的请求参数。get函数返回一个promise对象，当axios其请求成功时resolve服务器返回 值，请求失败时reject错误值。最后通过export抛出get函数。\n```ja\n/**\n * get方法，对应get请求\n * @param {String} url [请求的url地址]\n * @param {Object} params [请求时携带的参数]\n */\nexport function get(url, params){    \n    return new Promise((resolve, reject) =>{        \n        axios.get(url, {            \n            params: params        \n        }).then(res => {\n            resolve(res.data);\n        }).catch(err =>{\n            reject(err.data)        \n    })    \n});}\n\n```\n==post方法==:原理同get基本一样，但是要注意的是，post方法必须要使用对提交从参数对象进行序列化的操作，所以这里我们通过node的qs模块来序列化我们的参数。这个很重要，如果没有序列化操作，后台是拿不到你提交的数据的。这就是文章开头我们import QS from \'qs\';的原因。如果不明白序列化是什么意思的，就百度一下吧，答案一大堆。\n```js\n/** \n * post方法，对应post请求 \n * @param {String} url [请求的url地址] \n * @param {Object} params [请求时携带的参数] \n */\nexport function post(url, params) {\n    return new Promise((resolve, reject) => {\n         axios.post(url, QS.stringify(params)) //也可以使用 JSON的方法\n        .then(res => {\n            resolve(res.data);\n        })\n        .catch(err =>{\n            reject(err.data)\n        })\n    });\n}\n```\n## ==axios的封装基本就完成了，下面再简单说下api的统一管理==\n###### 首先我们在api.js中引入我们封装的get和post方法\n```js\n/**   \n * api接口统一管理\n */\nimport { get, post } from \'./http\'\n```\n现在，例如我们有这样一个接口，是一个post请求：\n```js\nhttp://www.baiodu.com/api/v1/users/my_address/address_edit_before\n```\n我们可以在api.js中这样封装：\n```js\nexport const apiAddress = p => post(\'api/v1/users/my_address/address_edit_before\', p);\n```\n我们定义了一个apiAddress方法，这个方法有一个参数p，p是我们请求接口时携带的参数对象。而后调用了我们封装的post方法，post方法的第一个参数是我们的接口地址，第二个参数是apiAddress的p参数，即请求接口时携带的参数对象。最后通过export导出apiAddress。\n\n然后在我们的页面中可以这样调用我们的api接口：\n\n```js\nimport { apiAddress } from \'@/request/api\';// 导入我们的api接口\nexport default {        \n    name: \'Address\',    \n    created () {\n        this.onLoad();\n    },\n    methods: {            \n        // 获取数据            \n        onLoad() {\n            // 调用api接口，并且提供了两个参数                \n            apiAddress({                    \n                type: 0,                    \n                sort: 1                \n            }).then(res => {\n                // 获取数据成功后的其他操作\n                ………………                \n            })            \n        }        \n    }\n}\n```\n其他的api接口，就在pai.js中继续往下面扩展就可以了。友情提示，为每个接口写好注释哦！！！\n\n==api接口管理的一个好处就是，我们把api统一集中起来，如果后期需要修改接口，我们就直接在api.js中找到对应的修改就好了，而不用去每一个页面查找我们的接口然后再修改会很麻烦。关键是，万一修改的量比较大，就规格gg了。还有就是如果直接在我们的业务代码修改接口，一不小心还容易动到我们的业务代码造成不必要的麻烦。==\n\n### 优化\n\n#### 1. 优化http.js\n```js\n/**\n * axios封装\n * 请求拦截、响应拦截、错误统一处理\n */\nimport axios from \'axios\';\nimport router from \'../router\';\nimport store from \'../store/index\';\nimport { Toast } from \'vant\';\n\n/** \n * 提示函数 \n * 禁止点击蒙层、显示一秒后关闭\n */\nconst tip = msg => {    \n    Toast({        \n        message: msg,        \n        duration: 1000,        \n        forbidClick: true    \n    });\n}\n\n/** \n * 跳转登录页\n * 携带当前页面路由，以期在登录页面完成登录后返回当前页面\n */\nconst toLogin = () => {\n    router.replace({\n        path: \'/login\',        \n        query: {\n            redirect: router.currentRoute.fullPath\n        }\n    });\n}\n\n/** \n * 请求失败后的错误统一处理 \n * @param {Number} status 请求失败的状态码\n */\nconst errorHandle = (status, other) => {\n    // 状态码判断\n    switch (status) {\n        // 401: 未登录状态，跳转登录页\n        case 401:\n            toLogin();\n            break;\n        // 403 token过期\n        // 清除token并跳转登录页\n        case 403:\n            tip(\'登录过期，请重新登录\');\n            localStorage.removeItem(\'token\');\n            store.commit(\'loginSuccess\', null);\n            setTimeout(() => {\n                toLogin();\n            }, 1000);\n            break;\n        // 404请求不存在\n        case 404:\n            tip(\'请求的资源不存在\'); \n            break;\n        default:\n            console.log(other);   \n        }}\n\n// 创建axios实例\nvar instance = axios.create({    timeout: 1000 * 12});\n// 设置post请求头\ninstance.defaults.headers.post[\'Content-Type\'] = \'application/x-www-form-urlencoded\';\n/** \n * 请求拦截器 \n * 每次请求前，如果存在token则在请求头中携带token \n */ \ninstance.interceptors.request.use(    \n    config => {        \n        // 登录流程控制中，根据本地是否存在token判断用户的登录情况        \n        // 但是即使token存在，也有可能token是过期的，所以在每次的请求头中携带token        \n        // 后台根据携带的token判断用户的登录情况，并返回给我们对应的状态码        \n        // 而后我们可以在响应拦截器中，根据状态码进行一些统一的操作。        \n        const token = store.state.token;        \n        token && (config.headers.Authorization = token);        \n        return config;    \n    },    \n    error => Promise.error(error))\n\n// 响应拦截器\ninstance.interceptors.response.use(    \n    // 请求成功\n    res => res.status === 200 ? Promise.resolve(res) : Promise.reject(res),    \n    // 请求失败\n    error => {\n        const { response } = error;\n        if (response) {\n            // 请求已发出，但是不在2xx的范围 \n            errorHandle(response.status, response.data.message);\n            return Promise.reject(response);\n        } else {\n            // 处理断网的情况\n            // eg:请求超时或断网时，更新state的network状态\n            // network状态在app.vue中控制着一个全局的断网提示组件的显示隐藏\n            // 关于断网组件中的刷新重新获取数据，会在断网组件中说明\n            if (!window.navigator.onLine) {\n               store.commit(\'changeNetwork\', false);\n            } else {\n                return Promise.reject(error);\n            }\n        }\n    });\n\nexport default instance;\n```\n\n这个axios和之前的大同小异，做了如下几点改变：\n\n1.去掉了之前get和post方法的封装，通过创建一个axios实例然后export default方法导出，这样使用起来更灵活一些。\n\n2.去掉了通过环境变量控制baseUrl的值。考虑到接口会有多个不同域名的情况，所以准备通过js变量来控制接口域名。这点具体在api里会介绍。\n\n3.增加了请求超时，即断网状态的处理。说下思路，当断网时，通过更新vuex中network的状态来控制断网提示组件的显示隐藏。断网提示一般会有重新加载数据的操作，这步会在后面对应的地方介绍。\n\n4.公用函数进行抽出，简化代码，尽量保证单一职责原则。\n#### 2. api 接口的优化\n1.更加模块化\n\n2.更方便多人开发，有效减少解决命名冲突\n\n3.处理接口域名有多个情况\n\n这里这里呢新建了一个api文件夹，里面有一个index.js和一个base.js，以及多个根据模块划分的接口js文件。index.js是一个api的出口，base.js管理接口域名，其他js则用来管理各个模块的接口。\n\n先放index.js代码：\n\n```js\n/** \n * api接口的统一出口\n */\n// 文章模块接口\nimport article from \'@/api/article\';\n// 其他模块的接口……\n\n// 导出接口\nexport default {    \n    article,\n    // ……\n}\n```\n\nindex.js是一个api接口的出口，这样就可以把api接口根据功能划分为多个模块，利于多人协作开发，比如一个人只负责一个模块的开发等，还能方便每个模块中接口的命名哦。\n\nbase.js:\n\n```js\n/**\n * 接口域名的管理\n */\nconst base = {    \n    sq: \'https://xxxx111111.com/api/v1\',    \n    bd: \'http://xxxxx22222.com/api\'\n}\n\nexport default base;\n```\n\n通过base.js来管理我们的接口域名，不管有多少个都可以通过这里进行接口的定义。即使修改起来，也是很方便的。\n\n最后就是接口模块的说明，例如上面的article.js:\n```js\n/**\n * article模块接口列表\n */\n\nimport base from \'./base\'; // 导入接口域名列表\nimport axios from \'@/utils/http\'; // 导入http中创建的axios实例\nimport qs from \'qs\'; // 根据需求是否导入qs模块 可要可不要 JSON的方法也是可以的 parse（）\n\nconst article = {    \n    // 新闻列表    \n    articleList () {        \n        return axios.get(`${base.sq}/topics`);    \n    },    \n    // 新闻详情,演示    \n    articleDetail (id, params) {        \n        return axios.get(`${base.sq}/topic/${id}`, {            \n            params: params        \n        });    \n    },\n    // post提交    \n    login (params) {        \n        return axios.post(`${base.sq}/accesstoken`, qs.stringify(params));    \n    }\n    // 其他接口…………\n}\n\nexport default article;\n```\n\n最后，为了方便api的调用，我们需要将其挂载到vue的原型上。在main.js中：\n\n```js\nimport Vue from \'vue\'\nimport App from \'./App\'\nimport router from \'./router\' // 导入路由文件\nimport store from \'./store\' // 导入vuex文件\nimport api from \'./api\' // 导入api接口\n\nVue.prototype.$api = api; // 将api挂载到vue的原型上\n```\n\n然后我们可以在页面中这样调用接口，\n\n```\nmethods: {    \n    onLoad(id) {      \n        this.$api.article.articleDetail(id, {        \n            api: 123      \n        }).then(res=> {\n            // 执行某些操作      \n        })    \n    }  \n}\n```\n\n', '1', '文章BLOG', '2021-01-07', '[{\"title\":\"Axios\",\"color\":\"#8ac07f\"}]', 22, NULL);
INSERT INTO `article_info` VALUES ('1610523727244', 'Vue2 开发中的骚操作', 'Vue的这些骚操作, 一看就会', '**优雅更新props**\n在子组件中不允许直接修改 props，因为这种做法不符合单向数据流的原则，在开发模式下还会报出警告。因此大多数人会通过 $emit 触发自定义事件，在父组件中接收该事件的传值来更新 prop。\n\n```\n        //child.vue\nexport defalut {\n    props: {\n        title: String  \n    },\n    methods: {\n        changeTitle(){\n            this.$emit(\'change-title\', \'hello\')\n        }\n    }\n}\n\n```\n\n```\n        //parent.vue\n        <child :title=\"title\" @change-title=\"changeTitle\"></child>\n\nexport default {\n    data(){\n        return {\n            title: \'title\'\n        }  \n    },\n    methods: {\n        changeTitle(title){\n            this.title = title\n        }\n    }\n}\n\n```\n这种做法没有问题，就是单纯更新 props。没有其他操作。那么使用 .sync修饰符让做法变得简单\n\n```\n<child :title.sync=\"title\"></child>\n\nexport defalut {\n    props: {\n        title: String  \n    },\n    methods: {\n        changeTitle(){\n            this.$emit(\'update:title\', \'hello\')\n        }\n    }\n}\n\n\n```\n只需要在绑定的属性上面添加 .sync 在子组件内部就可以触发 update:属性名 来更新 prop。可以看到这种手段确实简洁且优雅。TIPS: 但是据说在快要到来的vue3中将**不再支持** .sync修饰符。但是还有一个细节性的东西 **  this.$emit(\'update:title\', \'hello\')** update的 : 和title之间不能存在空格 ', '1', '文章BLOG', '2020-11-04', '[{\"title\":\"Vue2\",\"color\":\"#7bc2b3\"}]', 13, NULL);
INSERT INTO `article_info` VALUES ('1610524059053', 'Vue 数据更新但页面没有更新的 7 种情况，你遇到过几种', '遇到页面数据没有及时更新怎么办', '# 1. Vue 无法检测实例被创建时不存在于 data 中的 property\n\n**原因：**  由于 Vue 会在初始化实例时对 `property` 执行 `getter/setter` 转化，所以 `property `必须在 `data` 对象上存在才能让 Vue 将它转换为响应式的。   	   **简单的说就是没有在data中进行一个定义**\n## 错误\n\n```\nvar vm = new Vue({\n  data:{},\n  // 页面不会变化\n  template: \'<div>{{message}}</div>\'\n})\nvm.message = \'Hello!\' // `vm.message` 不是响应式的\n```\n\n## 正确解决\n```\nvar vm = new Vue({\n  data: {\n    // 声明 a、b 为一个空值字符串\n    message: \'\',\n  },\n  template: \'<div>{{ message }}</div>\'\n})\nvm.message = \'Hello!\'\n```\n\n# 2.Vue 无法检测对象 property 的添加或移除\n\n** 原因：** 由于 JavaScript（ES5） 的限制，Vue.js 不能检测到对象属性的添加或删除。因为 Vue.js 在初始化实例时将属性转为 getter/setter，所以属性必须在 data 对象上才能让 Vue.js 转换它，才能让它是响应的。 \n**简单地说就是vue无法捕捉到对象，已经数组督办函对象当中更深层次属性的变化**\n## 错误\n```\nvar vm = new Vue({\n  data:{\n    obj: {\n      id: 001\n    }\n  },\n  // 页面不会变化\n  template: \'<div>{{ obj.message }}</div>\'\n})\n\nvm.obj.message = \'hello\' // 不是响应式的\ndelete vm.obj.id       // 不是响应式的\n```\n## 正确解决\n**使用$set方法**\n```\n// 动态添加 - Vue.set\nVue.set(vm.obj, propertyName, newValue)\n\n// 动态添加 - vm.$set\nvm.$set(vm.obj, propertyName, newValue)\n\n// 动态添加多个\n// 代替 Object.assign(this.obj, { a: 1, b: 2 })\nthis.obj = Object.assign({}, this.obj, { a: 1, b: 2 })\n\n// 动态移除 - Vue.delete\nVue.delete(vm.obj, propertyName)\n\n// 动态移除 - vm.$delete\nvm.$delete(vm.obj, propertyName)\n```\n# 3. Vue 不能检测通过数组索引直接修改一个数组项\n\n由于 JavaScript 的限制，Vue 不能检测数组和对象的变化；尤雨溪 - 性能代价和获得用户体验不成正比。\n\n## 错误\n```\nvar vm = new Vue({\n  data: {\n    items: [\'a\', \'b\', \'c\']\n  }\n})\nvm.items[1] = \'x\' // 不是响应性的\n```\n\n## 正确解决\n```\nVue.set(vm.items, indexOfItem, newValue)\n\n// vm.$set\nvm.$set(vm.items, indexOfItem, newValue)\n\n// Array.prototype.splice\nvm.items.splice(indexOfItem, 1, newValue)\n```\n\n**tips:**  **Object.defineProperty()**  可以监测数组的变化。但对数组新增一个属性（index）不会监测到数据变化，因为无法监测到新增数组的下标（index），删除一个属性（index）也是。\n```\nvar arr = [1, 2, 3, 4]\narr.forEach(function(item, index) {\n    Object.defineProperty(arr, index, {\n    set: function(value) {\n      console.log(\'触发 setter\')\n      item = value\n    },\n    get: function() {\n      console.log(\'触发 getter\')\n      return item\n    }\n  })\n})\narr[1] = \'123\'  // 触发 setter\narr[1]          // 触发 getter 返回值为 \"123\"\narr[5] = 5      // 不会触发 setter 和 getter\n```\n# 4.Vue 不能监测直接修改数组长度的变化\n## 错误\n```\nvar vm = new Vue({\n  data: {\n    items: [\'a\', \'b\', \'c\']\n  }\n})\nvm.items.length = 2 // 不是响应性的\n```\n\n## 正确解决\n```\nvm.items.splice(newLength)\n```\n\n** tips**  vue 官方为我们提供了数组的方法 如 ```splice() slice() pop() shift() unshfit() push() pop()```\n\n# 5. 在异步更新执行之前操作 DOM 数据不会变化\nVue 在更新 DOM 时是异步执行的。只要侦听到数据变化，Vue 将开启一个队列，并缓冲在同一事件循环中发生的所有数据变更。如果同一个 watcher 被多次触发，只会被推入到队列中一次。这种在缓冲时去除重复数据对于避免不必要的计算和 DOM 操作是非常重要的。然后，在下一个的事件循环“tick”中，Vue 刷新队列并执行实际 (已去重的) 工作。 ** 简单地说 就是数据更新了，然后又更新的dom 覆盖了前面的数据更新**\n## 错误\n```\n<div id=\"example\">{{message}}</div>\n```\n```\nvar vm = new Vue({\n  el: \'#example\',\n  data: {\n    message: \'123\'\n  }\n})\nvm.message = \'new message\' // 更改数据\nvm.$el.textContent === \'new message\' // false  操作dom\nvm.$el.style.color = \'red\' // 页面没有变化\n```\n## 正确解决 使用$nextTick()在dom更新之后去更新数据\n```\nvar vm = new Vue({\n  el: \'#example\',\n  data: {\n    message: \'123\'\n  }\n})\nvm.message = \'new message\' // 更改数据\n//使用 Vue.nextTick(callback) callback 将在 DOM 更新完成后被调用\nVue.nextTick(function () {\n  vm.$el.textContent === \'new message\' // true\n  vm.$el.style.color = \'red\' // 文字颜色变成红色\n})\n```\n# 6. 循环嵌套层级太深，视图不更新？\n数据结果太深了 比如\n## 错误\n```\n[\n	{\n    	id: 1,\n        children: [\n        	id: \"\",\n            item: [\n            	···甚至更多\n            ],\n        ]\n    }\n]\n```\n## 正确解决\n```\nvm.$forceUpdate()				//使用 $forceUpdate()\n```\n\n# 7. 拓展：路由参数变化时，页面不更新（数据不更新）\n\n路由视图组件引用了相同组件时，当路由参会变化时，会导致该组件无法更新，也就是我们常说中的页面无法更新的问题。\n```\n<div id=\"app\">\n  <ul>\n    <li><router-link to=\"/home/foo\">To Foo</router-link></li>    \n    <li><router-link to=\"/home/baz\">To Baz</router-link></li>    \n    <li><router-link to=\"/home/bar\">To Bar</router-link></li>    \n  </ul>    \n  <router-view></router-view>\n</div>\n```\n```\nonst Home = {\n  template: `<div>{{message}}</div>`,\n  data() {\n    return {\n      message: this.$route.params.name\n    }\n  }\n}\n\nconst router = new VueRouter({\n  mode:\'history\',\n    routes: [\n    {path: \'/home\', component: Home },\n    {path: \'/home/:name\', component: Home }\n  ]\n})\n\nnew Vue({\n  el: \'#app\',\n  router\n})\n```\n上段代码中，我们在路由构建选项 routes 中配置了一个动态路由 `\'/home/:name\'`，它们共用一个路由组件` Home`，这代表他们复用 `RouterView `。\n当进行路由切换时，页面只会渲染第一次路由匹配到的参数，之后再进行路由切换时，`message` 是没有变化的。\n## 解决\n1. 通过 `watch` 监听 `$route` 的变化。 **推荐使用**\n```\n const Home = {\n      template: `<div>{{message}}</div>`,\n      data() {\n        return {\n          message: this.$route.params.name\n        }\n      },\n      watch: {\n       \'$route\': function() {\n       this.message = this.$route.params.name\n        }\n        }\n    }\n    ...\n    new Vue({\n      el: \'#app\',\n      router\n    })\n```\n2.给` <router-view>` 绑定 `key `属性，这样 `Vue` 就会认为这是不同的 `<router-view>`。\n\n**弊端：** 如果从 /home 跳转到 /user 等其他路由下，我们是不用担心组件更新问题的，所以这个时候 key 属性是多余的。\n```\n    <div id=\"app\">\n      ...\n  <router-view :key=\"key\"></router-view>\n    </div>\n```', '1', '文章BLOG', '2020-12-04', '[{\"title\":\"Vue.js\",\"color\":\"#556638\"}]', 25, NULL);
INSERT INTO `article_info` VALUES ('1610524059054', 'vue3 和vue2 开发组件的区别', 'Vue3 已经出来一段时间了, 让我们来了解一下他怎么使用吧', '# 1.建立data\r\n\r\n## vue2中\r\nvue2我们就不说了 ，data中放入两个属性 `username` `password`。\r\n\r\n```\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  data () {\r\n    return {\r\n      username: \'\',\r\n      password: \'\'\r\n    }\r\n  }\r\n}\r\n\r\n```\r\n\r\n## vue3中\r\n在Vue3.0，我们就需要使用一个新的setup()方法，此方法在组件初始化构造的时候触发。\r\n为了可以让开发者对反应型数据有更多的控制，我们可以直接使用到 Vue3 的反应API（reactivity API）\r\n\r\n**使用以下三步来建立反应性数据:**\r\n\r\n1. 从`vue`引入`reactive`\r\n\r\n2. 使用`reactive()`方法来声明我们的数据为反应性数据\r\n3. 使用`setup()`方法来返回我们的反应性数据，从而我们的template可以获取这些反应性数据\r\n上一波代码，让大家更容易理解是怎么实现的。\r\n\r\n```\r\nimport { reactive } from \'vue\'\r\n\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  setup () {\r\n    const state = reactive({\r\n      username: \'\',\r\n      password: \'\'\r\n    })\r\n\r\n    return { state }		//记得return\r\n  }\r\n}\r\n```\r\n\r\n#  2.`methods` 的编写\r\n\r\n## vue2\r\n\r\nvue2中我们直接放到`methods`这个方法里面\r\n\r\n```export default {\r\n  props: {\r\n    title: String\r\n  },\r\n  data () {\r\n    return {\r\n      username: \'\',\r\n      password: \'\'\r\n    }\r\n  },\r\n  methods: {\r\n    login () {\r\n      // 登陆方法\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n## vue3中\r\n\r\nvue3中`setup()`方法也是可以用来操控methods的。创建声明方法其实和声明数据状态是一样的。 我们需要先声明一个方法然后在setup()方法中返回(return)， 这样我们的组件内就可以调用这个方法了。\r\n\r\n```\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  setup () {\r\n    const state = reactive({\r\n      username: \'\',\r\n      password: \'\'\r\n    })\r\n\r\n    const login = () => {\r\n      // 登陆方法\r\n    }\r\n    return {\r\n      login,\r\n      state\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n## 3.生命周期函数\r\n\r\n在 Vue2，我们可以直接在组件属性中调用Vue的生命周期的钩子。以下使用一个组件已挂载`mounted` `befortMounted`生命周期触发钩子。\r\n```\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  data () {\r\n    return {\r\n      username: \'\',\r\n      password: \'\'\r\n    }\r\n  },\r\n  created(){},		\r\n  mounted () {\r\n    console.log(\'组件已挂载\')\r\n  },\r\n  methods: {\r\n    login () {\r\n      // login method\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n## vue3中\r\n首先`setup()`中自带 `beforeCreated` `created` 也就是说 我们不用在想vue2中一样去`created`中去调用获取数据了。但是在 Vue3 生周期钩子不是全局可调用的了，需要另外从vue中引入。和刚刚引入`reactive`一样，生命周期的挂载钩子叫`onMounted`。\r\n引入后我们就可以在`setup()`方法里面使用`onMounted`挂载的钩子了\r\n\r\n```\r\nimport { reactive, onMounted } from \'vue\'\r\n\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  setup () {\r\n    // ..\r\n    const getData = ()=> {\r\n    	$axios()	//获取数据\r\n    }\r\n\r\n    onMounted(() => {\r\n      console.log(\'组件已挂载\')\r\n    })\r\n\r\n    // ...\r\n    return {\r\n    	getData\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n# 4. 计算属性 - `Computed`\r\n\r\n## vue2中\r\n在 Vue2 中实现，我们只需要在组件内的选项属性中添加即可\r\n```\r\nexport default {\r\n  // ..\r\n  computed: {\r\n    lowerCaseUsername () {\r\n      return this.username.toLowerCase()\r\n    }\r\n  }\r\n}\r\n```\r\n\r\n## vue3中\r\n\r\nVue3 的设计模式给予开发者们按需引入需要使用的依赖包。这样一来就不需要多余的引用导致性能或者打包后太大的问题。Vue2就是有这个一直存在的问题。\r\n所以在 Vue3 使用计算属性，我们先需要在组件内引入`computed`。\r\n```\r\nimport { reactive, onMounted, computed } from \'vue\'\r\n//引入 computed\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  setup () {\r\n    const state = reactive({\r\n      username: \'\',\r\n      password: \'\',\r\n      lowerCaseUsername: computed(() => state.username.toLowerCase())\r\n    })\r\n\r\n    // ...\r\n  }\r\n  ```\r\n# 4.接受props\r\n\r\n## vue2中\r\n\r\n在 Vue2，`this`代表的是当前组件，不是某一个特定的属性。所以我们可以直接使用`this`访问`prop`属性值。就比如下面的例子在挂载完成后打印出当前传入组件的参数`title`。\r\n```\r\nexport default {\r\n  props: {\r\n    title: String\r\n  },\r\n  data () {\r\n    return {\r\n      username: \'\',\r\n      password: \'\'\r\n    }\r\n  },\r\n  created(){},		\r\n  mounted () {\r\n    console.log(\'组件已挂载\')\r\n  },\r\n  methods: {\r\n    login () {\r\n      // login method\r\n     console.log( this.props.title	)		//打印title\r\n    }\r\n  }\r\n}\r\n```\r\n## vue3中\r\nvue3中取消了this。不过全新的`setup()`方法可以接收两个参数：\r\n1.  `props` 组件参数\r\n2. `ccontext` vue3 暴露属性 比如  `emit` `attrs`\r\n所以 vue3中接受`props`\r\n```\r\nsetup (props) {\r\n    // ...\r\n\r\n    onMounted(() => {\r\n      console.log(\'title: \' + props.title)\r\n    })\r\n\r\n    // ...\r\n}\r\n```\r\n# 5.emit\r\n## vue2中\r\n Vue2 中我们会调用到`this.$emit`然后传入事件名和参数对象。\r\n ```\r\n login () {\r\n      this.$emit(\'login\', {			//触发父组件方法\r\n        username: this.username,\r\n        password: this.password\r\n      })\r\n }\r\n ```\r\n\r\n## vue3中\r\n在`setup()`中的第二个参数`context`对象中就有`emit`，这个是和`this.$emit`是一样的。那么我们只要在`setup()`接收第二个参数中使用分解对象法取出emit就可以在`setup`方法中随意使用了。\r\n\r\n```\r\nsetup (props, { emit }) {\r\n    // ... 暴露属性 emit\r\n		//相当于 this.$emit = emit\r\n    const login = () => {\r\n      emit(\'login\', {\r\n        username: state.username,\r\n        password: state.password\r\n      })\r\n    }\r\n\r\n    // ...\r\n}\r\n\r\n```\r\n## 总结一下\r\n总结一下，我觉得 Vue3 给我们前端开发者带来了全新的开发体验，更好的使用弹性，可控度也得到了大大的提升。如果你是一个学过或者接触过 **React** 然后现在想使用**Vue**的话，应该特别兴奋，因为很多使用方式都和**React hooks**非常相近了 🎉,**vue3** 借鉴了很多**react hooks**。**vue3**中不再提供 **this**  。对于 ** this** 而言 ，相对于初学者来说是固定的 **this** 指向当前这个实例，我需要啥就去**this**中拿， 容易理解使用。而**vue3** 更自定义 ，我需要啥就要先引入或者先暴露啥，不再是像**vue2**中一样 this中都给你包含了。\r\n', '1', '文章BLOG', '2020-01-11', '[{\"title\":\"Vue\",\"color\":\"#3b0d51\"}]', 13, NULL);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `typeId` int NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (1, '视频教程');
INSERT INTO `article_type` VALUES (2, 'BILG文章');
INSERT INTO `article_type` VALUES (3, '资源分享');

SET FOREIGN_KEY_CHECKS = 1;