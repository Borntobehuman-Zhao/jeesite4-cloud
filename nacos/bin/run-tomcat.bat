@echo off
rem /**
rem  * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
rem  *
rem  * Author: ThinkGem@163.com
rem  */
echo.
echo [信息] 使用 Spring Boot Tomcat 运行 Web 工程。
echo.

%~d0
cd %~dp0

cd ..
title %cd%
set "MAVEN_OPTS=%MAVEN_OPTS% -Xms512m -Xmx1024m -Dfile.encoding=utf-8"
call mvn clean spring-boot:run -Dmaven.test.skip=true

pause