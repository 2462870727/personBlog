import React from "react";
import {useRouter} from "next/router";
import { Row, Col, Avatar, Switch, notification, Space } from "antd";
import styles from "./header.module.scss";
import {
  EditTwoTone,
  FireTwoTone,
  FlagTwoTone,
  UserOutlined,
} from "@ant-design/icons";
// import logo from '../../images/logo.svg'

const Header = () => {

  const router = useRouter()
  
  /**
   * TODO 进入blog页面
   */
  const goBlogPages = () => {
    router.push({
      pathname: "/blogs",
    });
  };

  // 返回首页
  const goIndexPage = () => {
    router.replace({
      pathname: "/",
    });
  };

  /**
   * TODO 切换黑暗模式
   */
   const changeMode = (checked) =>{
    const html = document.getElementsByTagName('html')[0]
    if(checked){
      html.classList.add('dark')
    }else{
      html.classList.remove('dark')

    }
   }

  // 进入视频教程页面
  const goVideoPage = () => {
    notification.info({
      message: "暂未开通!",
      description: "抱歉 ,该板块暂未开通服务,后续更新推出，请耐心等待!",
    });
    // Router.push({
    //   pathname
    // })
  };

  /**
   * TODO 进去工具周边页面
   */
  const goToolPage = () => {
    router.push({
      pathname: '/tools'
    })
  }

  return (
    <header className={styles.headerWrap}>
      <Row align="middle" justify="space-around">
        <Col xxl={14} xl={10} lg={10} md={8} sm={24} xs={24}>
          <Space>
            <Avatar
              icon={<UserOutlined />}
              className={styles.avatar}
              src="/assets/avatar.jpg"
              onClick={goIndexPage}
            />
            小菜鸡的学习笔记及BLOG
          </Space>
          {/* <Avatar icon={<UserOutlined />}  src={process.env.avatarURL}/> */}
        </Col>
        <Col
          xxl={1}
          xl={2}
          lg={2}
          md={3}
          sm={0}
          xs={0}
          className={styles.headerItem}
        >
          <span>
            {/* 学习笔记 */}
            <Switch
            onChange={(checked) =>changeMode(checked)}
              checkedChildren={
                <Avatar className={styles.sun} size="10" src='/assets/moon.svg' />
              }
              unCheckedChildren={
                <Avatar size="10 " className={styles.moon}   src='/assets/sun.svg' />

              }
            />
          </span>
        </Col>
        <Col
          xxl={2}
          xl={3}
          lg={3}
          md={4}
          sm={0}
          xs={0}
          className={styles.headerItem}
        >
          <span onClick={goBlogPages}>
            <EditTwoTone />
            笔记BLOG
          </span>
        </Col>
        <Col
          xxl={2}
          xl={3}
          lg={3}
          md={4}
          sm={0}
          xs={0}
          className={styles.headerItem}
        >
          <span onClick={goVideoPage}>
            <FireTwoTone twoToneColor="#52c41a" />
            资源分享
          </span>
        </Col>
        <Col
          xxl={2}
          xl={3}
          lg={3}
          md={4}
          sm={0}
          xs={0}
          className={styles.headerItem}
        >
          <span onClick={goToolPage}>
            <FlagTwoTone twoToneColor="#68b0ab" />
            工具周边
          </span>
        </Col>
      </Row>
    </header>
  );
};

export default Header;
