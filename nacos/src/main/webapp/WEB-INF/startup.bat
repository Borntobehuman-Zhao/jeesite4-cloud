@echo off
rem /**
rem  * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
rem  *
rem  * Author: ThinkGem@163.com
rem  * 
rem  */
echo.
echo [信息] 运行Web工程。
echo.
rem pause
rem echo.

%~d0
cd %~dp0

title %cd%

rem 优化JVM参数
set JAVA_OPTS=-Xms256m -Xmx1024m -Dfile.encoding=utf-8

rem 方式一、配置外部自定义的属性文件（建议）
rem set JAVA_OPTS=%JAVA_OPTS% -Dspring.config.location=%cd%\app.yml

rem 方式二、配置环境名称，加载不同的属性文件
rem set JAVA_OPTS=%JAVA_OPTS% -Dspring.profiles.active=prod

if "%JAVA_HOME%" == "" goto noJavaHome
if not "%JAVA_HOME%" == "" goto gotJavaHome
goto end

:noJavaHome
set RUN_JAVA=java
goto runJava

:gotJavaHome
set "RUN_JAVA=%JAVA_HOME%\bin\java"
goto runJava

:runJava
call "%RUN_JAVA%" -cp %cd%/../ %JAVA_OPTS% org.springframework.boot.loader.WarLauncher
goto end

:end
pause
