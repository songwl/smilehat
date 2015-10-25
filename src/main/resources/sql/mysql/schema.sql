drop database if exists smile_hat;
CREATE DATABASE `smile_hat` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use smile_hat;

drop table if exists t_resource_authority;
drop table if exists t_role_authority;
drop table if exists t_user_role;
drop table if exists t_authority;
drop table if exists t_resource;
drop table if exists t_role;
drop table if exists t_user;
drop table if exists t_system_log;
drop table if exists t_attach;
drop table if exists t_login_log;
drop table if exists t_dict;

create table t_user (
	id bigint not null auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password  varchar(255) not null,
	salt  varchar(64),
	roles  varchar(255),
	register_date datetime,
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	user_type int NOT NULL DEFAULT 1 ,
	is_enabled int NOT NULL DEFAULT 1,
	update_time timestamp,
	photo_attach_id bigint,
	primary key (id)
);



/**
 * 授权表
 */
create table t_authority (
        id bigint not null auto_increment,
        display_name  varchar(255),
        name  varchar(255) not null unique,
        primary key (id)
);


/**
 * 资源表
 */    
create table t_resource (
        id bigint not null auto_increment,
        position double not null,
        resource_type  varchar(255) not null,
        val  varchar(255) not null unique,
        primary key (id)
) ;


create table t_resource_authority (
        resource_id bigint not null,
        authority_id bigint not null
);

/**
 * 角色表
 */
create table t_role (
        id bigint not null auto_increment,
        name  varchar(255) not null unique,
        primary key (id)
);

create table t_role_authority (
        role_id bigint not null,
        authority_id bigint not null
);

 create table t_user_role (
        user_id bigint not null,
        role_id bigint not null
) ;
    
   /**
* 系统操作日志表
*/ 
create table t_system_log (
     id bigint not null auto_increment,
     log_type  varchar(255),
     subtype  varchar(255),
     create_time datetime,
     user_id bigint ,
     user_ip  varchar(255) ,
     log_content  varchar(512) ,
     user_name  varchar(255) ,
     PRIMARY KEY (id)
);
/**
 * 系统附件表
 */
CREATE TABLE t_attach (
  id bigint not null auto_increment,
  name  varchar(255),
  create_time date,
  url_path  varchar(1024),
  file_size bigint ,
  file_type  varchar(255),
  user_id bigint,
  upload_session_id  varchar(1024),
  file_key  varchar(255) not null unique,
  PRIMARY KEY (id)
) ;
/**
 * 用户登录日志
 */
CREATE TABLE t_login_log (
	 id bigint not null auto_increment,
	 create_time datetime,
	 user_id bigint,
	 user_ip  varchar(255),
	 log_content  varchar(512),
	 user_name  varchar(255),
	 PRIMARY KEY (id)
);
 
/** 
 * 数据字典表
 */
CREATE TABLE t_dict (                                          
   id bigint not null auto_increment,               
   type_name  varchar(255),         
   name  varchar(255),         
   code  varchar(255),         
   description  varchar(255),  
   sort int(255),                                      
   PRIMARY KEY  (id)                                               
);
 