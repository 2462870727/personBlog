# personal-blog

## 项目简介
这是一个全栈搭建的个人博客项目 个人使用 `nginx` + 阿里云 部署，点击下方连接进行预览， 管理后台暂时没有对第三方进入查看后续加入。

[前端项目预览](https://blog.happynewball.com)
[管理后台预览](https://admin.happynewball.com)


 前端使用 `next.js + antd + fetch` 来搭建利于seo(出于seo考虑) ，

 管理后台使用 `react hook + antd + ant-design/charts` 来搭建。

 后端使用 `egg + mysql`
## 文件介绍
*  admin ······ **使用 `React Hook + Andt + Axios` 搭建的blog管理后台**
*  blog-app ······ **使用 `Next.js + Antd + fetch` 搭建的blog前端页面**
*  service ······ **使用egg.js 搭建的后端 `api` 服务**
*  blog.sql ······ **数据库表**

## 运行项目
1.  安装依赖

    `npm i or yarn `
	
2. 运行项目

    前端项目使用 `npm run dev` or `yarn dev`
	
    管理后台使用 `npm run start` or `yarn start`
	
    后端项目： 该项目我配置了三个环境：

    1.  `dev` 为本地开发环境需要链接本地的数据库 对应 **config** 文件夹中的 **config.default.js** 文件，
     
     2. `debug` 线上调试环境 对应 **config** 文件夹中的 **config.local.js** 文件，
     
     3. `start`是线上生产环境，对应 **config** 文件夹中的 **config.prod.js** 文件。运行项目前请确认是否有安装mysql，如果你是前端开发者，对后端的了解不深，建议你使用mysql 5.0的版本。mysql8 的版本会因为加密方式不同 需要你进行配置。当然了，如果你很了解后端，我相信您很快就可以运行起来了。下面我说不了解后端的运行步骤(默认已安装好 `mysql` )：
	
    2.1 service 文件夹下有 mysql 的连接配置, 具体在 service > config 文件夹中

    ```js
    config.mysql = {
    client: {
        host: 'localhost',   // 填写你的连接地址
        port: '3306',			// 连接端口 默认3306
        user: 'root',			// 连接用户名 默认 root 需根据自己情况填写
        password: '123456',		// 连接密码 需根据自己情况填写
        database: 'blog',			// 连接数据库名
        },
    }
    ```
	
    注意： config 下的不同文件对应不同的环境配置 default 是默认配置 本地开发环境配置，local 是线上测试环境 prod是 生成环境配置
		
    2.2  项目根目录下有一个 `blog.sql` 文件 新建一个名为 `blog` 的数据库，然后导入 `blog.sql` 即可。里面有简单的三张数据表。

    2.3  接下来就是使用`yarn dev` 运行 `service` 项目了。打开浏览器访问 `http://127.0.0.1:7001/admin/index`, 当你看到页面显示出来 `Hi Blog Api`。

    最后记得 更改 `blog-app`项目的请求地址 在 `next.config.js`中。 恭喜你 已经完成了后端项目的运行了。接下来我们就可以运行前端项目了。相信对你来说不是什么难事了。

## 目前实现功能

前端
1. 文章高亮展示。
2. `markdown` 在线编辑文章，预览及发布。
3. 管理后台浏览数据信息可视化图表展示。
4. 粗略实现暗黑模式

后端
1. 用户登陆
2. 文章分页，排序

## 后续慢慢完善追加新的功能与页面，敬请期待感谢。