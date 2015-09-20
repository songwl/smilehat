insert into t_user (id, login_name, name, password, salt, roles, register_date) values(1,'system','System','96e79218965eb72c92a549dd5a330112','7efbd59d9741d34f','admin','2015-09-20 01:00:00');
insert into t_user (id, login_name, name, password, salt, roles, register_date) values(2,'admin','Admin','96e79218965eb72c92a549dd5a330112','7efbd59d9741d34f','admin','2015-09-20 01:00:00');


insert into t_role (id,name) values (1,'role_sys');
insert into t_role (id,name) values (2,'role_admin');
insert into t_role (id,name) values (3,'role_person');
insert into t_role (id,name) values (4,'role_dealer');
insert into t_role (id,name) values (5,'role_famer');

insert into t_role (id,name) values (14,'role_dealer_lack');
insert into t_role (id,name) values (15,'role_famer_lack');

insert into t_user_role (user_id,role_id) values (1,1);
insert into t_user_role (user_id,role_id) values (2,2);


insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100000, 109900, 'url', '/sys/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100100, 100100, 'url', '/sys/loginlog/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100200, 100200, 'url', '/sys/syslog/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100300, 100399, 'url', '/sys/dict/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100310, 100310, 'url', '/sys/dict/typelist/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100311, 100311, 'url', '/sys/dict/selectByTypeJSON/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100312, 100312, 'url', '/sys/dict/typelisttest/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100313, 100313, 'url', '/sys/dict/typealltest/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100400, 100400, 'url', '/sys/resource/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100500, 100599, 'url', '/sys/authority/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100510, 100510, 'url', '/sys/authority/select/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100600, 100699, 'url', '/sys/role/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100610, 100610, 'url', '/sys/role/select/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100700, 100700, 'url', '/sys/user/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100800, 100800, 'url', '/sys/attachType/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100314, 100314, 'url', '/sys/dict/selectByType/**');
insert into T_RESOURCE (ID, POSITION, RESOURCE_TYPE, VAL)
values (100315, 100315, 'url', '/sys/dict/dictlist/**');