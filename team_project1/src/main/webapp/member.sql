-----1.회원정보테이블

create table member(
mem_id varchar(20) primary key,/*아이디*/
mem_pwd varchar(20) not null,/*비밀번호*/
mem_name varchar(20) not null,/*이름*/
mem_email varchar(30),/*이메일*/
mem_call char(13),/*전화번호*/
mem_postcode varchar(20),/*우편번호*/
mem_address1 Nvarchar(60),/*주소*/
mem_address2 Nvarchar(60),/*상세 주소*/
mem_address3 Nvarchar(60),/*참고사항*/
mem_grade char(1) default '1'/*등급*/
);

insert into member values('tss123','1234','관리자','00000','00000','00000','00000','00000','00000','2');

select * from member;

drop table member;

/****
-----2.관리자정보테이블----보류 
create table admin(
admin_id varchar(20),
admin_pw varchar(20)
);

select * from admin;

drop table admin;
***/

------3.상품정보테이블
create table product(
prod_num varchar(20) primary key,
prod_name varchar(100),
prod_kind varchar(10),
prod_price int(10),
prod_content varchar(1000),
prod_image varchar(10000),
prod_sale char(1),
prod_date date
);

select * from product;

drop table product;


-----4.주문정보테이블

create table orderitem(
order_id varchar(20) primary key,
mem_id varchar(20) ,
prod_num varchar(100),
prod_amount int(10),
prod_content varchar(1000),
order_day date,
order_status char(1)
);

select * from orderitem;

drop table orderitem;


--5.장바구니 테이블
create table cart(
cart_id varchar(20)auto_increment primary key ,
member_id varchar(20),
prod_num varchar(100),
prod_amount int(10)
);

select * from cart;

drop table cart;


/*6.후기게시판*/


create table review(
board_no int auto_increment primary key,
prod_num varchar(100),
mem_id varchar(20),
rev_content varchar(10000),
rev_score char(1),
rev_date date, 
rev_fileName varchar(20),
rev_origfileName varchar(20)
);

select * from review;

drop table review;



insert into review(prod_num,mem_id,rev_content,rev_score,rev_date,rev_fileName,rev_origfileName) 
values('1004','java','만족합니다','5',sysdate(),null,'home2.jpg');

select * from review;
update review set rev_content='제발수정수정수정',rev_score='5',rev_date=sysdate(),rev_fileName='item-4.jpg' where board_no=9;
update review set rev_content='제발수정수정수정',rev_score='5',rev_date=sysdate(),rev_fileName='' where board_no=10;

--글목록 가져오기위한 test 
select board_no,prod_num,rev_content,rev_score,rev_date from review;
select * from review order by board_no desc limit 0,6;
select * from review order by board_no desc limit 5,6;
---7.커뮤니티게시판

CREATE TABLE BOARD(
   BOARD_NUM INT,
    MEM_ID VARCHAR(20),
   BOARD_SUBJECT VARCHAR(50) NOT NULL,
   BOARD_CONTENT VARCHAR(2000),
   BOARD_FILE VARCHAR(50) ,
   BOARD_RE_REF INT NOT NULL,
   BOARD_RE_LEV INT NOT NULL,
   BOARD_RE_SEQ INT NOT NULL,
   BOARD_READCOUNT INT DEFAULT 0,
   BOARD_DATE DATE,
   

   BOARD_PLACELA VARCHAR(100) , 
   BOARD_PLACEMA VARCHAR(100) , 
   
   PRIMARY KEY(BOARD_NUM)
);
select * from board;

delete from board where board_num=3;
delete from board where board_num=5;
drop table board;

---8.문의게시판
create table qna(
board_no int auto_increment primary key,
member_id varchar(20),
qna_subject varchar(50),
qna_content varchar(2000),
qna_date date
);

select * from qna;

drop table qna;

