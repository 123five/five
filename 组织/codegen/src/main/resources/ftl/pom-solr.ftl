<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>${parentName}-parent</artifactId>
        <groupId>${groupId}</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <artifactId>${moduleName}</artifactId>
    <packaging>jar</packaging>

    <dependencies>
        <!-- 配置spring-data-solr -->
        <dependency>
            <groupId>org.springframework.data</groupId>
            <artifactId>spring-data-solr</artifactId>
            <version>1.5.6.RELEASE</version>
        </dependency>
    </dependencies>

</project>