/*
Navicat PGSQL Data Transfer

Source Server         : 10.33.26.125
Source Server Version : 90606
Source Host           : 10.33.26.125:5432
Source Database       : image_text
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90500
File Encoding         : 65001

Date: 2018-03-16 16:51:04
*/


-- ----------------------------
-- Sequence structure for seq_t_compute_monitor_log
-- ----------------------------
DROP SEQUENCE IF EXISTS "seq_t_compute_monitor_log";
CREATE SEQUENCE "seq_t_compute_monitor_log"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 375
 CACHE 1;
SELECT setval('"public"."seq_t_compute_monitor_log"', 375, true);

-- ----------------------------
-- Table structure for t_compute_monitor_log
-- ----------------------------
DROP TABLE IF EXISTS "t_compute_monitor_log";
CREATE TABLE "t_compute_monitor_log" (
"id" int8 NOT NULL,
"ip" varchar(30) COLLATE "default",
"monitor_time" timestamp(0),
"cpu_user" varchar(20) COLLATE "default",
"cpu_sys" varchar(20) COLLATE "default",
"cpu_wait" varchar(20) COLLATE "default",
"cpu_idle" varchar(20) COLLATE "default",
"cpu_others" varchar(20) COLLATE "default",
"mem_total" varchar(20) COLLATE "default",
"mem_used" varchar(20) COLLATE "default",
"mem_free" varchar(20) COLLATE "default",
"disk_usage" varchar(1000) COLLATE "default",
"network_receive" varchar(20) COLLATE "default",
"network_send" varchar(20) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "t_compute_monitor_log"."id" IS '序列号';
COMMENT ON COLUMN "t_compute_monitor_log"."ip" IS 'ip地址';
COMMENT ON COLUMN "t_compute_monitor_log"."monitor_time" IS '监测时间';
COMMENT ON COLUMN "t_compute_monitor_log"."cpu_user" IS '用户占用cpu百分比';
COMMENT ON COLUMN "t_compute_monitor_log"."cpu_sys" IS '系统占用cpu百分比';
COMMENT ON COLUMN "t_compute_monitor_log"."cpu_wait" IS 'IO等待占用cpu百分比';
COMMENT ON COLUMN "t_compute_monitor_log"."cpu_idle" IS '空闲CPU百分比';
COMMENT ON COLUMN "t_compute_monitor_log"."cpu_others" IS '其它占用CPU百分比';
COMMENT ON COLUMN "t_compute_monitor_log"."mem_total" IS '内存总量(M)';
COMMENT ON COLUMN "t_compute_monitor_log"."mem_used" IS '内存使用量(M)';
COMMENT ON COLUMN "t_compute_monitor_log"."mem_free" IS '内存剩余量(M)';
COMMENT ON COLUMN "t_compute_monitor_log"."disk_usage" IS '磁盘使用情况';
COMMENT ON COLUMN "t_compute_monitor_log"."network_receive" IS '网卡接收总量(M)';
COMMENT ON COLUMN "t_compute_monitor_log"."network_send" IS '网卡发送总量(M)';


-- ----------------------------
-- Table structure for t_node_info
-- ----------------------------
DROP TABLE IF EXISTS "t_node_info";
CREATE TABLE "t_node_info" (
"id" int4 NOT NULL,
"ip" varchar(50) COLLATE "default",
"node_name" varchar(50) COLLATE "default",
"process_name" varchar(50) COLLATE "default",
"is_deleted" varchar(1) COLLATE "default",
"status" varchar(1) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "t_node_info"."id" IS '序列号';
COMMENT ON COLUMN "t_node_info"."ip" IS 'ip地址';
COMMENT ON COLUMN "t_node_info"."node_name" IS '节点名称';
COMMENT ON COLUMN "t_node_info"."process_name" IS '进程名称';
COMMENT ON COLUMN "t_node_info"."is_deleted" IS '是否删除( 1: 已删除  0： 正常)';
COMMENT ON COLUMN "t_node_info"."status" IS '状态（1：正常； 0：异常）';

-- ----------------------------
-- Records of t_node_info
-- ----------------------------
BEGIN;
INSERT INTO "t_node_info" VALUES ('8', '10.33.26.125', 'redis', 'redis', '0', '1');
INSERT INTO "t_node_info" VALUES ('9', '10.33.26.125', 'postgresql', 'postgresql', '0', '1');
INSERT INTO "t_node_info" VALUES ('10', '10.33.26.125', '重定向', 'tomcat-redirect', '0', '1');
INSERT INTO "t_node_info" VALUES ('11', '10.33.26.125', '上传下载', 'tomcat-transform', '0', '1');
INSERT INTO "t_node_info" VALUES ('12', '10.33.26.125', 'keepalived', 'keepalived', '0', '0');
INSERT INTO "t_node_info" VALUES ('13', '10.33.26.125', 'nginx', 'nginx', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for t_server_info
-- ----------------------------
DROP TABLE IF EXISTS "t_server_info";
CREATE TABLE "t_server_info" (
"id" int4 NOT NULL,
"ip" varchar(20) COLLATE "default",
"username" varchar(50) COLLATE "default",
"password" varchar(50) COLLATE "default",
"network_card" varchar(50) COLLATE "default",
"is_deleted" varchar(1) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "t_server_info"."id" IS '序列号';
COMMENT ON COLUMN "t_server_info"."ip" IS 'ip地址';
COMMENT ON COLUMN "t_server_info"."username" IS '用户名';
COMMENT ON COLUMN "t_server_info"."password" IS '密码';
COMMENT ON COLUMN "t_server_info"."network_card" IS '网卡名称';
COMMENT ON COLUMN "t_server_info"."is_deleted" IS '是否删除( 1: 已删除  0： 正常)';

-- ----------------------------
-- Records of t_server_info
-- ----------------------------
BEGIN;
INSERT INTO "t_server_info" VALUES ('2', '10.33.26.125', 'root', 'whhikvision', 'enp11s0', '0');
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table t_compute_monitor_log
-- ----------------------------
CREATE INDEX "t_compute_monitor_log_ip_idx" ON "t_compute_monitor_log" USING btree ("ip");

-- ----------------------------
-- Primary Key structure for table t_compute_monitor_log
-- ----------------------------
ALTER TABLE "t_compute_monitor_log" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_node_info
-- ----------------------------
ALTER TABLE "t_node_info" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_server_info
-- ----------------------------
CREATE UNIQUE INDEX "t_server_info_ip_idx" ON "t_server_info" USING btree ("ip");

-- ----------------------------
-- Primary Key structure for table t_server_info
-- ----------------------------
ALTER TABLE "t_server_info" ADD PRIMARY KEY ("id");
