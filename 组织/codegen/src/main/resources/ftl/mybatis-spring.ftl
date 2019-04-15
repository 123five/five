<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns="http://www.springframework.org/schema/beans"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/tx
       http://www.springframework.org/schema/tx/spring-tx.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd">

    <!-- 配置加载属性文件 -->
    <context:property-placeholder
            location="classpath*:props/*.properties"/>

    <!-- 配置数据源 -->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource"
          destroy-method="close">
        <property name="url" value="${url}" />
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
        <property name="driverClassName" value="${driver}"/>
        <property name="maxActive" value="${maxActive}"/>
        <property name="minIdle" value="${minIdle}"/>
    </bean>
    <!-- 配置SqlSessionFactory -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <!-- 设置数据源 -->
        <property name="dataSource" ref="dataSource"/>
        <!-- 设置类型别名 (采用包扫描) -->
        <property name="typeAliasesPackage" value="com.${projectName}.pojo"/>
        <!-- 设置SQL映射文件 -->
        <property name="mapperLocations" value="classpath:mappers/**/*.xml"/>
        <!-- 设置mybatis-config.xml -->
        <property name="configLocation" value="classpath:mybatis-config.xml"/>
    </bean>

    <!-- 配置数据访问接口的代理对象 (批量配置)
        到基础包下扫描所有的数据访问接口，再创建它们的代理对象，然后交给Spring容器
        bean的id: 默认为接口的类名，首字母小写
    -->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="${packageName}"/>
    </bean>

    <!-- 配置通用Mapper集成Spring
     (告诉通用Mapper我们的项目中的哪个包下的数据访问接口继承你的Mapper接口) -->
    <bean class="tk.mybatis.spring.mapper.MapperScannerConfigurer">
        <!-- 设置数据访问接口类 -->
        <property name="basePackage" value="${packageName}"/>
    </bean>

    <!-- 配置数据源事务管理器(DataSourceTransactionManager) -->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!-- 配置开启事务注解驱动 -->
    <tx:annotation-driven/>
</beans>