# personal-blog

## 项目介绍
这是一个全栈搭建的个人博客项目。
 [前端项目预览](https://blog.happynewball.com)
 [管理后台预览](https://admin.happynewball.com)
 
 全栈个人blog项目，前端使用 `next.js + antd + fetch` 来搭建利于seo ，管理后台使用 `react hook + antd `来搭建。后端使用 `egg + mysql`
 

## 文件介绍
*  admin ······ **使用React Hook + Andt + Axios 搭建的blog管理后台**
*  blog-app ······ **使用Next.js + Antd + fetch 搭建的blog前端页面**
*  service ······ **使用egg.js 搭建的后端服务**
*  blog.sql ······ **数据库表结构**

## 安装
1.  安装依赖

    `npm i or yarn `
	
2. 运行项目

    前端项目使用 `npm run dev` or `yarn dev`
	
    管理后台使用 `npm run start` or `yarn start`
	
    后端项目： 该项目我配置了三个环境， `dev` 是部署线上的远程调试，`start`是生产环境，`debug` 本地开发请使用。运行项目前请确认是否有安装mysql，如果你是前端开发者，对后端的了解不深，建议你使用mysql 5.0的版本。mysql8 的版本会因为加密方式不同 需要你进行配置。当然了，如果你很了解后端，我相信您很快就可以运行起来了。下面我说不了解后端的运行步骤(默认已安装好 `mysql` )：
	
    2.1 service 文件夹下有 mysql 的连接配置, 具体在 service > config 文件夹中

    ```javascript
    config.mysql = {
    client: {
        host: 'localhost',   // 填写你的连接地址
        //   host: "39.104.66.213",				// 这是我部署阿里云的公网ip
        port: '3306',			// 填写连接端口 默认3306
        user: 'root',			// 填写连接用户名 默认 root 需根据自己情况填写
        password: '123456',		// 填写连接密码 需根据自己情况填写
        database: 'blog',			// 填写连接数据库名
        },
    }
    ```
	
    注意： config 下的不同文件对应不同的环境配置 default 是默认配置 本地开发环境配置，local 是线上测试环境 prod是 生成环境配置
		
    2.2  项目根目录下有一个 `blog.sql` 文件 新建一个名为 `blog` 的数据库，然后导入 `blog.sql` 即可。里面有简单的三张数据表。

    2.3  接下来就是使用`yarn dev` 运行 `service` 项目了。打开浏览器访问 `http://127.0.0.1:7001/admin/index`, 当你看到页面显示出来 `Hi Blog Api`。最后记得 更改 `blog-app`项目的请求地址 在 `next.config.js`中。 恭喜你 已经完成了后端项目的运行了。接下来我们就可以运行前端项目了。相信对你来说不是什么难事了。


## 后续慢慢完善追加新的功能与页面，敬请期待感谢。