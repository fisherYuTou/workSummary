VMware虚拟机以NAT方式解决无法上网的问题：
http://blog.csdn.net/liaoyu753/article/details/19931919


1. 查看电脑运行时间：
cat /proc/uptime| awk -F. '{run_days=$1 / 86400;run_hour=($1 % 86400)/3600;run_minute=($1 % 3600)/60;run_second=$1 % 60;printf("系统已运行：%d天%d时%d分%d秒",run_days,run_hour,run_minute,recond)}'

2. 内存使用情况 
cat /proc/meminfo |grep 'MemTotal\|MemFree'|awk '{print $2}'

3. cpu 使用情况
top -bn 1 -i -c|grep Cpu|awk '{print $2,$4,$10, $8}'



查Postgresql 数据库、各表占用磁盘大小
http://blog.csdn.net/rocklee/article/details/51251174

   
 select array_to_string(array_agg(''''||to_char(hour1,'fm00')|| ':' ||to_char(min5_slot*5,'fm00'||'''')),',') monitor_time,
        array_to_string(array_agg(upload),',') upload,
        array_to_string(array_agg(download),',') download
        from(
            select extract(hour FROM access_time) hour1,
            (extract(minute FROM access_time)::int / 5) AS min5_slot,
            count(case service_name when 'upload' then 1 end) upload,
            count(case service_name when 'download' then 1 end) download
            from t_user_monitor_log
            where access_time > date_trunc('hour', now()) - interval '1 hours'
            group by 1,2
            order by 1,2
        ) t
		


CREATE USER image_text  PASSWORD 'image_text' SUPERUSER NOINHERIT;
CREATE DATABASE image_text owner image_text template template0;
   
   
实战java高并发程序设计
https://download.csdn.net/download/zymx14/10200872   
   
   
sh /opt/tomcat-transform/bin/shutdown.sh
sh /opt/tomcat-transform/bin/startup.sh
tail -f /opt/tomcat-transform/logs/catalina.out

sh /opt/tomcat-redirect/bin/shutdown.sh
sh /opt/tomcat-redirect/bin/startup.sh 
tail -f /opt/tomcat-redirect/logs/catalina.out


JAVA_OPTS="-Xms1024m -Xmx4096m -Xss1024K -XX:PermSize=512m -XX:MaxPermSize=2048m"


cat /proc/sys/net/ipv4/tcp_keepalive_time



/file_selected/userInfo/userLogin


*/5 * * * * /opt/monitor.sh



bootstrap-table:
https://www.cnblogs.com/wuhuacong/p/7284420.html



遍历map:
https://www.cnblogs.com/zhaoguhong/p/7074597.html?utm_source=itdadao&utm_medium=referral

 
   
 maven 可执行jar
 http://blog.csdn.net/xiao__gui/article/details/47341385
   
	

yum install --downloadonly
cd /var/cache/yum/x86_64/7/base/packages
cd /var/cache/yum/x86_64/7/updates/packages


jenkins 无可选插件
https://zhidao.baidu.com/question/496190163876215164.html

jenkins 插件下载
http://updates.jenkins-ci.org/download/plugins/



INSERT INTO "public"."t_cloud_storage_info" VALUES ('20', 'admin', 'ddd', '10.67.173.159', '6201', 'zhy_test', '2018-01-26 09:22:13', '2018-01-26 09:22:13', 'Gx7RAE00593BS29D57U6q5ld9Q0nH3F0A05TF7CR18bu1oPr0n6kt79NUcbFNsY', '60L60FdiZRC5G0323Ed617Y28RPkb3R89s9B97021s06wk8P1xz5X96fa2ba4Q5', '智慧云存储', '1', '0');
INSERT INTO "public"."t_user_info" VALUES ('10000', 'yuyanwu', 'hik12345+', '2018-01-26 09:24:01', '2018-01-26 09:24:01', '0', null, '222', '20', '0');


查看linux 版本：
cat /etc/redhat-release




安装所有依赖包:
rpm -Uvh --force --nodeps *.rpm  



云存储信息：

Access Key: Gx7RAE00593BS29D57U6q5ld9Q0nH3F0A05TF7CR18bu1oPr0n6kt79NUcbFNsY
Secret Key: 60L60FdiZRC5G0323Ed617Y28RPkb3R89s9B97021s06wk8P1xz5X96fa2ba4Q5 
ip: 10.67.173.159
端口： 6201
bucket: zhy_test



INSERT INTO "public"."t_cloud_storage_info" VALUES ('20', 'admin', 'ddd', '10.67.173.159', '6201', 'zhy_test', '2018-01-26 09:22:13', '2018-01-26 09:22:13', 'Gx7RAE00593BS29D57U6q5ld9Q0nH3F0A05TF7CR18bu1oPr0n6kt79NUcbFNsY', '60L60FdiZRC5G0323Ed617Y28RPkb3R89s9B97021s06wk8P1xz5X96fa2ba4Q5', '智慧云存储', '1', '0');
INSERT INTO "public"."t_user_info" VALUES ('10000', 'yuyanwu', 'hik12345+', '2018-01-26 09:24:01', '2018-01-26 09:24:01', '0', null, '222', '20', '0');

shenzhen-traffic-police-client-test

mvn package -Dmaven.test.skip=true    


java map to jsonstring:

new Gson().toJson(param);         com.google.gson.2.2.2.jar  
JSONUtils.toJSONString(requestMap);    com.alibaba.fastjson.JSON
http://blog.csdn.net/q975583865/article/details/72722364



linux killall安装：
yum install psmisc


centos7 vim 安装： yum -y install vim-enhanced


centos7设置主机名：hostnamectl set-hostname Linuxidc


tgs数据库脚本: https://192.0.0.75/Traffic-2nd/TCRS/trunk/ipss-1.x/public/db/pg


查看linux 操作系统版本： cat /etc/redhat-release


10.15.48.1  root/o7I5D9=##0QDarM


spring整合redis:
http://blog.csdn.net/tzszhzx/article/details/44590871


Java开发之@PostConstruct和@PreConstruct注解：
https://www.cnblogs.com/landiljy/p/5764515.html


IntelliJ Idea解决Could not autowire. No beans of 'xxxx' type found的错误提示
http://blog.csdn.net/u012453843/article/details/54906905


intelliJ idea提示api注释:
http://www.cnblogs.com/guazi/p/6474426.html





mvn install:install-file -Dfile=e:\ojdbc6.jar -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.3 -Dpackaging=jar  

<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>11.2.0.3</version>
</dependency>



安装常用支持库：
    yum install -y gcc gdb strace gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs patch e2fsprogs-devel krb5-devel libidn libidn-devel openldap-devel nss_ldap openldap-clients openldap-servers libevent-devel libevent uuid-devel uuid mysql-devel


centos7 关闭firewall：
systemctl stop firewalld.service #停止firewall
systemctl disable firewalld.service #禁止firewall开机启动
firewall-cmd --state #查看默认防火墙状态（关闭后显示notrunning，开启后显示running）


<script type="text/javascript" src="http://g.alicdn.com/sj/lib/jquery/dist/jquery.min.js"></script>



java模拟后台上传：
http://blog.csdn.net/u014201191/article/details/46597563


10.33.26.65  administrator/hik12345+
虚拟机登陆：root/123456
ip配置：
ONBOOT=yes
BOOTPROTO=static
IPADDR=10.33.26.239
NETMASK=255.255.255.0
GATEWAY=10.33.26.254
DNS1=10.1.7.77
DNS2=10.1.7.88


shenzhen-traffic-police


Pa$$word1,


t_cloud_storage_info


10.33.26.101: administraotr/Pa$$word1,




tomcat 出现的PermGen Space问题:(http://blog.csdn.net/tengdazhang770960436/article/details/51776684)

1.修改 TOMCAT_HOME/bin/catalina.bat文件
在echo "using CATALINA_BASE：$CATALINA_BASE"上面加入这一行内容：

set JAVA_OPTS=%JAVA_OPTS% -server -XX:PermSize=128m -XX:MaxPermSize=512m

2.如果是 linux 环境，则修改 TOMCAT_HOME/bin/catalina.sh：

JAVA_OPTS="$JAVA_OPTS" -server -XX:PermSize=128m -XX:MaxSize=512m

2.修改 TOMCAT_HOME/bin/catalina.bat文件的内容：
在 %_EXECJAVA% %JAVA_OPTS% 后面添加 -Xms=256m -Xmx512m  

注意：前后后有空格的
例如： %_EXECJAVA% %JAVA_OPTS% -Xms=256m -Xmx512m(空格)后面的内容不变






jenkins服务器：
 IP：10.1.65.204
用户：hkws
密码：xjLhy5Q&hz


converity静态代码检测结果查看：
https://sca.hikvision.com.cn/reports.htm#v85852/p12310/fileInstanceId=247359485&defectInstanceId=143451673&mergedDefectId=2204249


jenkins-静态代码检测：
https://sys-ci.hikvision.com.cn/jenkins/job/Traffic_iVMS-8600-TGS-ipss_1.x-WEB-win/32/ 


jenkins-自动测试报告：
https://sys-ci.hikvision.com.cn/jenkins/view/All/job/Traffic_iVMS-8600-TGS-ipss_1.x-WEB-Autotest/HTML_Report/



set path=E:\software\apache-maven-3.5.0\bin;%path%




默认情况下，yum下载的RPM包会保存在下面的目录中:

/var/cache/yum/x86_64/[centos/fedora-version]/[repository]/packages 






inux下有命令dos2unix

yum install dos2unix -y
dos2unix *.sh



Another app is currently holding the yum lock:
rm -f /var/run/yum.pid











postgresql主键递增：

alter table t_screen_device alter column id set default nextval('s_t_screen_device');



10.33.26.102  administrator/hik12345+


linux 配置java 环境变量：

export JAVA_HOME=/usr/java/jdk1.7.0_80
export PATH=$JAVA_HOME/bin:$PATH 
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 



linux tomcat6 配置https：

keytool -genkey -alias tomcat -keyalg RSA -keystore /opt/tomcat.keystore

conf/server.xml配置：

<Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true"
       maxThreads="150" scheme="https" secure="true"
       clientAuth="false" sslProtocol="TLS" 
       keystoreFile="/opt/tomcat.keystore" keystorePass="hik12345+"/>



centos7修改主机名：

 hostnamectl set-hostname Linuxidc



nginx错误日志查看：
/var/log/nginx

nignx 502:
1. nginx.conf 文件中：  user nginx 改成：user root
 
2. 停止nginx -s stop
 
3. 重启nginx -c  nginx.conf


nginx负载均衡配置：

server {
    listen       80;
    server_name  mytomcat;
    client_max_body_size 1024M;

    location / {
        proxy_pass http://myserver;
    }
}

upstream myserver{
  server 192.168.234.202:8080;
  server 192.168.234.203:8080;
}

 停止：nginx -s stop
 
 重启：nginx -c  nginx.conf

 重新加载配置： nginx -s reload



nginx支持https:

upstream myserver{
  server 192.168.234.202:8080;
  server 192.168.234.203:8080;
}

server {
    listen       80;
    server_name  mytomcat;
    client_max_body_size 1024M;
    rewrite ^ https://$http_host$request_uri? permanent;

}

server {
    listen 443 ssl;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;
    keepalive_timeout   70;
    server_name mytomcat;
    #禁止在header中出现服务器版本，防止黑客利用版本漏洞攻击
    server_tokens off;
    #如果是全站 HTTPS 并且不考虑 HTTP 的话，可以加入 HSTS 告诉你的浏览器本网站全站加密，并且强制用 HTTPS 访问
    fastcgi_param   HTTPS               on;
    fastcgi_param   HTTP_SCHEME         https;



    access_log      /var/log/nginx/wiki.xby1993.net.access.log;
    error_log       /var/log/nginx/wiki.xby1993.net.error.log;

    echo 123


    location / {

        proxy_pass http://myserver;
    }


}



Centos7配置国内yum源:
http://blog.csdn.net/y87329396/article/details/51357122




yum安装常用支持库的安装：
yum install -y gcc gdb strace gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs patch e2fsprogs-devel krb5-devel libidn libidn-devel openldap-devel nss_ldap openldap-clients openldap-servers libevent-devel libevent uuid-devel uuid mysql-devel






nginx echo:

http://blog.csdn.net/lanyd/article/details/45647365


 ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module


nginx: [emerg] getpwnam("www") failed:

groupadd -f www
useradd -g www www




OpenResty - 下载：

http://openresty.org/cn/download.html




curl -d "username=wang" 'http://localhost:80/my'


增加虚拟IP：
/sbin/ip addr add 192.168.234.219/24 dev eno16777736










java 历史版本下载：
http://www.oracle.com/technetwork/java/javase/archive-139210.html


tomcat历史版本下载：
https://archive.apache.org/dist/tomcat/



CentOS7 yum 安装 Nginx最新版本
http://blog.csdn.net/allsharps/article/details/52071328

======================================================================

下载对应当前系统版本的nginx包(package)
# wget  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm


建立nginx的yum仓库
# rpm -ivh nginx-release-centos-7-0.el7.ngx.noarch.rpm


下载并安装nginx
# yum install nginx


启动nginx服务
systemctl start nginx

查看是否启动：
netstat -anp | grep :80

======================================================================

centos7 关闭firewall：
systemctl stop firewalld.service #停止firewall
systemctl disable firewalld.service #禁止firewall开机启动
firewall-cmd --state #查看默认防火墙状态（关闭后显示notrunning，开启后显示running）




tgs数据库连接信息：   
ip:10.14.37.17 
端口： 5432 
用户：tgsdb
用户密码：tgsdb
数据库名称：tgsdb

bola数据库连接信息：   
ip:10.14.37.17 
端口： 5432 
用户：boladb
用户密码：boladb
数据库名称：boladb


tomcat通过conf-Catalina-localhost目录发布项目详解:
https://www.cnblogs.com/iyangyuan/p/3316444.html



idea 使用本地archetype-catalog.xml(解决Intellij IDEA 通过archetype创建Maven项目缓慢的问题)
https://www.cnblogs.com/lycsky/p/6144691.html


1. errorHandle相关修改：
define('base/requests/ProgramList', ['core/IO/Rest', 'server/Config','base/requests/ErrorHandler'], function(Rest, serverConfig,ErrorHandler) {

ErrorHandler.error(2,err);
//接口返回异常

ErrorHandler.error(1,data.message);
//调用接口异常


vscode集成eslint:
http://blog.csdn.net/qq_26766789/article/details/74332251




postgresql创建空间数据库
http://blog.csdn.net/longshengguoji/article/details/45769319




postgresql递归查询：

WITH RECURSIVE r AS (SELECT * FROM t_screen_program where code = '487'
union ALL
SELECT t_screen_program.* FROM t_screen_program, r WHERE t_screen_program.parent_program = r.code
)
SELECT * FROM r ORDER BY name



idea Error:java: Compilation failed: internal java compiler error
http://blog.csdn.net/qq_27093465/article/details/53261939



vs 缩进注释代码
//#region 
//#endregion  

多行： rows
总数： total
单行： data


js list 排序：
objectList.sort(function(a,b){
            return a.age-b.age});



yuyanwu@hikvision.com.cn

hikml15.hikvision.com.cn



熟悉公司环境，完成分辨率接口开发， 完成分辨率，节目管理前后端联调



log().info(methodDesc+" start");
log().info(methodDesc+" success -end");
log().info(methodDesc+" fail - end");



mvn surefire-report:report
mvn package -Dmaven.test.skip=true 


mybatis增加sql打印： 在spring-mybatis.xml中增加如下配置
<settings>
    <setting name="logImpl" value="STDOUT_LOGGING"/>
</settings>    




查看js支持情况：
https://developer.mozilla.org/zh-CN/


underscore官网：
http://underscorejs.org/#reduceRight



BR_SYSTEM_HOST=10.33.26.249
kong.indexcode=001030
BR_SYSTEM_PORT=90



项目重新编译：
npm i

conf.getCrcsHttpUrl is not a function

tgcs.js 文件中


Error: Not Found
    at E:\ideaProjects\web\crws\crws\app.js:91:15



定义泛型方法时，必须在返回值前边加一个<T>


接口对应：

接口描述         接口控制类                           对应表

诱导屏：         LedController2                       t_screen_device       
诱导屏-分辨率：  ScreenResolutionController           
诱导屏-节目：    ScreenPlanController
诱导屏-节目单组: ScreenPlangroupController
节目单发布：     未上传



mybatis批量更新
<update id="updateBatch" parameterType="java.util.List">
        update mydata_table
        <trim prefix="set" suffixOverrides=",">
            <trim prefix="status =case" suffix="end,">
                <foreach collection="list" item="item" index="index">
                     when id=#{item.id} then #{item.status}
                </foreach>
            </trim>
        </trim>
        where id in
        <foreach collection="list" index="index" item="item" separator="," open="(" close=")">
            #{item.id,jdbcType=BIGINT}
        </foreach>
</update>



mybatis批量插入

<insert id="addTrainRecordBatch" useGeneratedKeys="true" parameterType="java.util.List">  
    <selectKey resultType="long" keyProperty="id" order="AFTER">  
        SELECT  
        LAST_INSERT_ID()  
    </selectKey>  
    insert into t_train_record (add_time,emp_id,activity_id,flag)   
    values  
    <foreach collection="list" item="item" index="index" separator="," >  
        (#{item.addTime},#{item.empId},#{item.activityId},#{item.flag})  
    </foreach>  
</insert>  


mybatis批量删除

<delete id="deleteByLogIdAndNames">
    delete from attachment_table
    where logid = #{logid,jdbcType=INTEGER} AND NAME IN
    <foreach collection="names" item="item" index="index" open="(" close=")" separator=",">
        #{item}
   </foreach>
</delete>
