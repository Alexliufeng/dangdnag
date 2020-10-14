--����Ա��
create table d_admin(
       id number(10) primary key,
       username varchar2(30),
       password varchar2(30)
);
--����
create sequence seq_admin;
--��
select  *  from d_admin;
--��
insert into d_admin values(seq_admin.nextval,'admin','admin');
--����username��
select * from d_admin where username='admin';

--�����
drop table d_category;
drop table d_category cascade constraints;
create table d_category(
       id number(10) primary key,
       name varchar2(30),
       levels number(10),
       parent_id number(10)
);
--��������
create sequence seq_category;
--������
select * from d_category;
--����
insert into d_category values(seq_category.nextval,'С˵',1,null);
insert into d_category values(seq_category.nextval,'��ѧ',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'�Ļ�',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'��ѧ',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
insert into d_category values(seq_category.nextval,'��ѧ',1,null);
insert into d_category values(seq_category.nextval,'����',1,null);
--���ݸ�����Ų�
select * from d_category where parent_id is null;
--����idɾ��
delete  from d_category where id = 4;

drop table d_book;
--ͼ���    ��Ҫ
create table d_book(
       id number(10) primary key,
       name varchar2(30),
       author varchar2(30),
       cover varchar2(1000),
       press varchar2(30),
       press_date date,
       edition number(10),
       print_date date,
       impression number(10),
       isbn varchar(30),
       word_num number(30),
       page_num number(30),
       sizeb varchar2(30),
       paper  varchar2(30),
       pack varchar2(30),
       price number(10,2),
       dprice number(10,2),
       create_date date,
       editor_recommend varchar2(900),
       content_abstract varchar2(900),
       author_abstract varchar2(900),
       director varchar2(900),
       media_commentary varchar2(300),
       sale number(20),
       stock number(20),
       update_date date,
       category_id number(10) references d_category(id)
);
--��������
create sequence seq_book; 
--������ 
select * from d_book;
--����id��
select * from d_book where id=2;
--����
insert into d_book values(seq_book.nextval,
'��������','����ͷ','1.jpg','���������',sysdate,
12121,sysdate,3213,'isbn',80000,400,'���忪','����ֽ','ӲƤ'
,18.8,16.6,sysdate,'�༭�Ƽ�','����ͷ�Ĵ�ѧ','ĳ��˹����ѧԺ��ҵ��',
'��һ��','����',20000000,90000,sysdate,42
); 
--��ձ�
delete from d_book;
--ɾ��
delete from d_book where id= 2;
--�޸�
update d_book set name='ˮ䰴�',
author='����ͷ',
cover ='2.jpg',
press ='����������',
press_date=sysdate,
edition =32213,
impression=32131,
isbn ='adxafd',
word_num=60000,
page_num=300,
sizeb='���忪',
paper='�Ϻ�ֽ',
pack='��Ƥ',
price=10.0,
dprice=77.8,
create_date=sysdate,
editor_recommend ='������',
content_abstract ='�����Ȳ���',
author_abstract ='һֻС����',
director='������',
media_commentary ='�ÿ�',
sale =600000,
stock=50000,
update_date=sysdate,
category_id=5 where id=32;

drop table d_user;
--�û���  ��Ҫ
--��������
create sequence seq_user;
--������
select * from d_user;
--����
Book [id=null, name=66, author=66, cover=null, press=66, press_date=null, edition=66, printDate=Wed Sep 30 00:00:00 CST 2020, impression=66, isbn=66, wordNum=66, pageNum=66, sizeB=null, paper=66, pack=66, price=66.0, dprice=66.0, createDate=null, editorRecommend=66, contentAbstract=66, authorAbstract=66, director=66, mediaCommentary=66, sale=null, stock=66, updateDate=null, categoryId=42]
insert into d_user values(seq_user.nextval,'444@qq.com','333','salt','СѾѾ',1,'QDEDWHJH',sysdate);
--����email��
select * from d_user where email='444@qq.com';
--�޸�״̬
update d_user set status=0 where id=43;

--��ձ�
delete from d_user;
--������
create table  d_user(
     id number(10) primary key,
     email varchar2(60) unique,
     password varchar2(1000),
     salt varchar2(10),
     nickname varchar2(30),
     status number(1),
     code varchar2(30),
     create_date date  
);
drop table d_address;
--��ַ�� ��Ҫ
create table d_address(
       id number(30) primary key,
       name varchar2(300),--�ռ�������
       mobile varchar2(300),
       province varchar2(300),--ʡ
       city varchar2(300),--��
       district varchar2(300),--��
       town varchar2(300),--��
       address varchar2(300),
       create_date date,
       user_id number(10) references d_user(id)
);
--����user_id��ѯ
select * from d_address where user_id=71;
--��������
create sequence seq_address;
--������
select * from d_address;
--����id��
select * from d_address  where id=3;
--��
insert into d_address  values(seq_address.nextval,'yaya','138383838438','����','����','����','����','�ƼҴ�38��',sysdate,47);
--ɾ��
delete from d_address where id=2;
--�޸�
update d_address set name='jiji',mobile='121212121',province='ɽ��',city='����',district='����',town='��ë',address='��ͷ��39��',create_date=sysdate,user_id=71 where id=21;
select sysdate from dual

select * from d_book where rownum<=8 order by dbms_random.value
select * from d_order;
select * from d_item where order_id = 2;
--������
create table d_order(
       order_id number(10) primary key,
       total number(20,2),
       status number(1),
       name varchar2(300),
       mobile varchar2(300),
       province varchar2(300),
       city varchar2(300),
       district varchar2(300),
       town varchar2(300),
       address varchar2(300),
       create_date date,
       user_id references d_user(id)
);
create sequence seq_order;
create sequence seq_item;
create table d_item(
       id number(10) primary key,
       count number(10),
       create_date date,
       book_id references d_book(id),
       order_id references d_order(order_id)
); 
select * from d_item where order_id = 2
create table  t_test(
       datetime date,
       time TIMESTAMP
);
drop table t_test
insert into t_test values(sysdate);
select * from t_test;
select t1.id,t1.count,t1.create_date,t1.book_id,t1.order_id,t2.name,t2.cover,t2.dprice,t2.price 
from d_item t1 left join d_book t2 on t1.book_id=t2.id 
where t1.order_id  = 1;