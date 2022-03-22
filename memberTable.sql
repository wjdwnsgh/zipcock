/****************************
    zipcock ����
*****************************/

-- System�������� ����
create user zipcock identified by 1234;
grant connect, resource to zipcock;

-- ������� zipcock���� ����
-- ��� ���̺� ����
create table member (
    member_name varchar2(50) not null,
    member_id varchar2(20) primary key,
    member_pass varchar2(20) not null,
    member_email varchar2(50) not null,
    member_age varchar2(10) not null,
    member_sex number not null,
    member_phone varchar2(20) not null,
    member_missionN number,
    member_status number default 1 not null,
    member_bank varchar(50),
    member_account varchar(50),
    member_vehicle number,
    member_introduce varchar2(500),
    member_ofile varchar2(200),
    member_sfile varchar2(200),
    member_review number,
    member_missionC number,
    member_point number
);
drop table member;
commit;

--����
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('����', 'admin', '1234', 'tigsnor@naver.com',
'0', '1', '010-1111-2222', '0');

--�Ϲݻ���� �� ���� ������
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('ȫ�浿', 'hong', '1234', 'hong@naver.com',
'0', '1', '01022223333', '1');

--�Ϲݻ���� �� ���� ������
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('��û��', 'sim', '1234', 'sim@naver.com',
'0', '2', '01033334444', '1');

--���� ���� ������
insert into member 
(member_name, member_id, member_pass, member_email, member_age, member_sex,
member_phone,member_status, member_bank, member_account, member_vehicle, member_introduce, member_review
,member_missionC, member_point)
values ('����', 'helper', '1234', 'helper@naver.com', '24', '1',
'01055556666', 2, '��������', '12341241242', '0', '�������ϰڽ��ϴ�.', '4', '10', '2000');

--������Ʈ����� ���� ������
insert into member (member_name, member_id, member_pass, member_email,
member_age, member_sex, member_phone, member_status) VALUES ('��', 'black', '1234', 'black@naver.com',
'0', '1', '01066667777', '3');

commit;

select * from member;

------------------------------------------------------------------------------------------------------------
create table qboard (
    num number primary key,
    title varchar2(30) not null,
    content varchar2(200) not null,
    id varchar2(20) not null,
    postdate date default sysdate not null,
    visitcount number default 0 not null
);
drop table qboard;
create sequence seq_qboard
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
drop sequence seq_qboard;
--qna���̵�����
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, 'ť����1', 'ť����1', '���̾��̵�', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, 'ť����2', 'ť����2', '���̾��̵�', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, 'ť����3', 'ť����3', '���̾��̵�', sysdate, 0);
insert into qboard
(num, title, content, id, postdate, visitcount)
values (seq_qboard.nextval, 'ť����4', 'ť����4', '���̾��̵�', sysdate, 0);

commit;


create table qreview (
    num number primary key,
    content varchar2(200) not null,
    id varchar2(20) not null
);

insert into qreview
(num, content, id)
values (1, '���䳻��1', '���������');

commit;
------------------------------------------------------------------------------------------------------------
create table mission (
    mission_num number primary key,
    mission_id varchar2(20) not null,
    mission_category varchar(50) not null,
    mission_name varchar2(50) not null,
    mission_content varchar2(300) not null,
    mission_ofile varchar2(200),
    mission_sfile varchar2(200),
    mission_sex number default 1 not null,
    mission_Hid varchar2(20),
    mission_start varchar2(200),
    mission_waypoint varchar2(200),
    mission_end varchar2(200) not null,
    mission_mission number not null,
    mission_reservation varchar2(50),
    mission_time varchar(20) not null,
    mission_cost number not null,
    mission_status number default 1 not null 
);

drop table mission;

create sequence mission_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
drop sequence mission_seq;


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '�������������̹�����ּ���', '������ ������ּ���~~!!', '�����ǥ', '������ǥ', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���', '������ ������ּ���~~^^', '�����ǥ', '������ǥ', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���2', '������ ������ּ���~~2', '�����ǥ', '������ǥ', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���3', '������ ������ּ���~~3', '�����ǥ', '������ǥ', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���4', '������ ������ּ���~~4', '�����ǥ', '������ǥ', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���5', '������ ������ּ���~~5', '�����ǥ', '������ǥ', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���6', '������ ������ּ���~~6', '�����ǥ', '������ǥ', '1', '1', '4000', '1');

insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'test1', '���,�庸��', '������ּ���7', '������ ������ּ���~~7', '�����ǥ', '������ǥ', '1', '1', '4000', '1');


insert into mission 
(mission_num, mission_id, mission_category, mission_name, mission_content,
mission_start, mission_end, mission_mission, mission_reservation, mission_time, mission_cost, mission_status)
values (mission_seq.nextval, 'hong', 'û��,������', 'û�ҿ�û!', '�����ϰ� û�Һ�Ź�ؿ�^^', '�����ǥ', '������ǥ', '2', '2022-02-20', '4', '10000', '2');



commit;
select * from mission;

----------------------------------------------------------------------------------------------
create table mboard (
    mboard_num number primary key,
    mboard_id varchar2(20) not null,
    mboard_title varchar2(30) not null,
    mboard_content varchar2(200) not null,
    mboard_date date default sysdate not null,
    mboard_count number default 0 not null
); 

create sequence mboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache; 

insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '������', '�̰� ��������', '�̰ǰ������׳����̳�', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '������1', '�̰� ��������1', '�̰ǰ������׳����̳�1', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '������2', '�̰� ��������2', '�̰ǰ������׳����̳�2', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '������3', '�̰� ��������3', '�̰ǰ������׳����̳�3', sysdate, 0);
insert into mboard
(mboard_num, mboard_id, mboard_title, mboard_content, mboard_date, mboard_count)
values (mboard_seq.nextval, '������4', '�̰� ��������4', '�̰ǰ������׳����̳�4', sysdate, 0);

commit;
select * from mboard;

----------------------------------------------------------------------------------------------

create table review(
    review_num number primary key not null,
    mission_num number not null,
    review_id varchar2(10) not null,
    review_content varchar2(200) not null,
    review_point number not null,
    review_date date default sysdate not null
);
--���� ������
create sequence review_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--���� ���̵�����
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo', '�̰��� �����Դϴ�','5' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'kosmo2', '�̰��� �����Դϴ�','2' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,3,'kosmo3', '�̰��� �����Դϴ�','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo4', '�̰��� �����Դϴ�','4' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmo5', '�̰��� �����Դϴ�','1' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmoh123', '�̰��� �����Դϴ�','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,0,'kosmoh123', '��û ���ƿ�','5' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,1,'kosmoh123', '����','3' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'kosmoh123', '�Ⱦ��','2' ,sysdate);

insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'helper', '��������','2' ,sysdate);
insert into review
(review_num, mission_num, review_id, review_content, review_point, review_date)
values (review_seq.nextval,2,'helper', 'good��333','5' ,sysdate);
commit;

