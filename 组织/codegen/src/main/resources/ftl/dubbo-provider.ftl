<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://code.alibabatech.com/schema/dubbo
       http://code.alibabatech.com/schema/dubbo/dubbo.xsd">



    <!--######### 配置Dubbo服务提供者 #########-->
    <!-- 配置当前应用名称 -->
    <dubbo:application name="${parentName}-service"/>

    <!-- 配置注册中心Zookeeper，注册服务 -->
    <dubbo:registry protocol="zookeeper" address="192.168.12.131:2181"/>

    <!-- 配置用dubbo协议在20880端口暴露服务 -->
    <dubbo:protocol name="dubbo" port="20880"/>

    <!-- 配置采用包扫描来暴露服务 -->
    <dubbo:annotation package="${packageName}.impl"/>

</beans>