-- 멤버 테이블
ALTER TABLE member DROP PRIMARY KEY CASCADE;
DROP TABLE member;
CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY,
pwd VARCHAR2(20),
name VARCHAR2(40),
email VARCHAR2(40),
regidentNum VARCHAR2(15),
postNum VARCHAR2(7),
addr1 VARCHAR2(100),
addr2 VARCHAR2(100),
phone VARCHAR2(20),
useyn VARCHAR2(1) DEFAULT 'y',
regdate DATE DEFAULT SYSDATE,
authority NUMBER(1) DEFAULT '1'
);

-- 상품 테이블
ALTER TABLE product DROP PRIMARY KEY CASCADE;
DROP TABLE product;
CREATE TABLE product(
pseq NUMBER(5) PRIMARY KEY,
name VARCHAR2(100) DEFAULT 0,
kind CHAR(1), -- 1 피아노, 2 기타, 3 베이스, 4 드럼, 5 미디, 6 악세사리
price1 NUMBER(7) DEFAULT 0,
price2 NUMBER(7) DEFAULT 0,
price3 NUMBER(7) DEFAULT 0,
content VARCHAR2(1000) DEFAULT NULL,
image VARCHAR2(50) DEFAULT 'default.jpg',
useyn CHAR(1) DEFAULT 'y',
bestyn CHAR(1) DEFAULT 'n',
regdate DATE DEFAULT SYSDATE
);
DROP SEQUENCE product_seq;
CREATE SEQUENCE product_seq START WITH 1;

-- 주소 테이블
ALTER TABLE address DROP PRIMARY KEY CASCADE;
DROP TABLE address;
CREATE TABLE address(
postNum VARCHAR2(7),
sido VARCHAR2(30),
gugun VARCHAR2(30),
dong VARCHAR2(100),
zipCode VARCHAR2(30),
bunji VARCHAR2(30)
);

-- 장바구니 테이블
ALTER TABLE cart DROP PRIMARY KEY CASCADE;
DROP TABLE cart;
CREATE TABLE cart(
cseq NUMBER(10) PRIMARY KEY,
id VARCHAR2(20),                -- 주문자 아이디
pseq NUMBER(5),                 -- 주문 상품번호
quantity NUMBER(5) DEFAULT 1,   -- 주문 수량
result CHAR(1) DEFAULT 1,       -- 주문 처리 여부, 1: 미처리, 2: 처리
indate DATE DEFAULT sysdate,
FOREIGN KEY (id) REFERENCES member (id),
FOREIGN KEY (pseq) REFERENCES product (pseq)
);
DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq START WITH 1;

-- 주문 테이블
ALTER TABLE orders DROP PRIMARY KEY CASCADE;
DROP TABLE orders;
CREATE TABLE orders(
oseq NUMBER(10) PRIMARY KEY,
id VARCHAR2(20) REFERENCES member (id),
regdate DATE DEFAULT sysdate
);

-- 주문 상세 테이블
ALTER TABLE order_detail DROP PRIMARY KEY CASCADE;
DROP TABLE order_detail;
CREATE TABLE order_detail(
odseq NUMBER(10) PRIMARY KEY,
oseq NUMBER(10) REFERENCES orders (oseq),
pseq number(5) REFERENCES product (pseq),
quantity NUMBER(5),
addr1 VARCHAR2(100),
addr2 VARCHAR2(100),
postNum VARCHAR2(7),
result CHAR(1) DEFAULT 1
);
DROP SEQUENCE order_detail_seq;
CREATE SEQUENCE order_detail_seq START WITH 1;

-- 문의 테이블
ALTER TABLE contact DROP PRIMARY KEY CASCADE;
DROP TABLE contact;
CREATE TABLE contact(
cseq NUMBER(5) PRIMARY KEY,
title VARCHAR2(500),
content VARCHAR2(1000),
id VARCHAR2(20) REFERENCES member (id), -- 작성자
reply VARCHAR2(1000),                   -- 답변 내용
rep CHAR(1) DEFAULT '1',                -- 답변 유무 
regdate DATE DEFAULT sysdate
);
DROP SEQUENCE contact_seq;
CREATE SEQUENCE contact_seq START WITH 1;

-- 작업실 테이블
ALTER TABLE room DROP PRIMARY KEY CASCADE;
DROP TABLE room;
CREATE TABLE room(
roomNum NUMBER(5) PRIMARY KEY,
person NUMBER(1),
price NUMBER(8),
image VARCHAR2(50) DEFAULT 'default.jpg'
);

-- 예약 테이블
ALTER TABLE booking DROP PRIMARY KEY CASCADE;
drop table booking;
create table booking(
bseq number(5) PRIMARY KEY,
id varchar2(30) REFERENCES member (id),
name varchar2(40),
phone varchar2(20),
reserveDate date,
roomNum NUMBER(5) REFERENCES room (roomNum),
person number(3),
price number(8),
result CHAR(1) DEFAULT 1,
regDate date default sysdate
);

-- 댓글 테이블
ALTER TABLE comments DROP PRIMARY KEY CASCADE;
DROP TABLE comments;
CREATE TABLE comments(
    coseq NUMBER(8) PRIMARY KEY,
    pseq NUMBER(5) REFERENCES product (pseq), -- 제품번호
    roomNum NUMBER(5) REFERENCES room (roomNum), -- 방번호
    content VARCHAR2(1024),  -- 상품평
    writer VARCHAR2(20) REFERENCES member (id),     -- 작성자 ID
    regdate TIMESTAMP DEFAULT SYSDATE,
    modifydate TIMESTAMP DEFAULT SYSDATE
);
DROP SEQUENCE comments_seq;
CREATE SEQUENCE comments_seq START WITH 1;

-- 베스트 상품 보기 뷰
create or replace view best_pro_view
    as
select pseq, name, price2, image
  from (select rownum, pseq, name, price2, image
          from product
         where bestyn = 'y'
           and useyn = 'y'
         order by regdate desc)
 where rownum <= 4;
 
 -- 신규 상품 보기 뷰
create or replace view new_pro_view
    as
select pseq, name, price2, image
  from (select rownum, pseq, name, price2, image
          from product
         where useyn = 'y'
         order by regdate desc)
 where rownum <= 4;

-- 장바구니 보기 뷰
create or replace view cart_view
    as
select c.cseq, c.id, p.pseq, m.name mname, p.name pname, p.price2, c.quantity, c.indate, c.result
  from cart c, member m, product p
 where c.id = m.id 
   and c.pseq = p.pseq
   and result = 1;
   
-- 주문내역 보기 뷰
create or replace view order_view
    as
select o.oseq, d.odseq, d.pseq, d.quantity, p.name pname, m.id, m.name mname, 
       o.regdate, m.postNum, m.addr1, m.addr2, m.phone, p.price2, d.result
  from orders o, member m, order_detail d, product p
 where p.pseq = d.pseq 
   and o.oseq = d.oseq 
   and o.id = m.id;

commit;
-- 기본 데이터
insert into member(id, pwd, name, email, regidentNum, postNum, addr1, addr2, phone, authority) values('admin', '1234', '홍길동', 'test@email.com', '800612-1065484', '164-722', '서울 서초구 반포1동 서초한양아파트', '106동 1105호', '010-4864-4654', '2'); -- 관리자
insert into member(id, pwd, name, email, regidentNum, postNum, addr1, addr2, phone, authority) values('test', '1234', '이순신', 'asdf@email.com', '960830-2468145', '151-882', '서울 관악구 신림3동 646', '301호', '010-8651-2641', '1'); -- 사용자
-- 상품
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '피아노', 1, 10000, 30000, 20000, '좋아용', 'y', 'piano.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '기타', 2, 10000, 30000, 20000, '좋아용', 'y', 'elecGuitar.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '드럼', 4, 10000, 30000, 20000, '좋아용', 'y', 'drum.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '베이스', 3, 10000, 30000, 20000, '좋아용', 'y', 'bass.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '마스터키보드', 1, 10000, 30000, 20000, '좋아용', 'n', 'masterKey.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '신디사이저', 1, 10000, 30000, 20000, '좋아용', 'n', 'synth.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '통기타', 2, 10000, 30000, 20000, '좋아용', 'n', 'guitar.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '드럼패드', 5, 10000, 30000, 20000, '좋아용', 'n', 'drumPad.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '스피커', 5, 10000, 30000, 20000, '좋아용', 'n', 'speaker.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '인터페이스', 5, 10000, 30000, 20000, '좋아용', 'n', 'interface.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '다이나믹 마이크', 5, 10000, 30000, 20000, '좋아용', 'n', 'dynamic.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '콘덴서 마이크', 5, 10000, 30000, 20000, '좋아용', 'n', 'conmic.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '이펙터', 6, 10000, 30000, 20000, '좋아용', 'n', 'effector.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, bestyn, image) values(product_seq.nextval, '기타줄', 6, 10000, 30000, 20000, '좋아용', 'n', 'guitarLine.jpg');
-- 스튜디오
insert into room(roomNum, person, price, image) values(101, 4, 30000, '4.jpg');
insert into room(roomNum, person, price, image) values(102, 5, 50000, '5.jpg');
insert into room(roomNum, person, price, image) values(103, 6, 70000, '6.jpg');
insert into room(roomNum, person, price, image) values(104, 6, 100000, '62.jpg');
insert into room(roomNum, person, price, image) values(201, 4, 30000, '4.jpg');
insert into room(roomNum, person, price, image) values(202, 6, 70000, '6.jpg');
insert into room(roomNum, person, price, image) values(203, 5, 50000, '5.jpg');
insert into room(roomNum, person, price, image) values(204, 6, 100000, '62.jpg');
-- 주소
@zip
