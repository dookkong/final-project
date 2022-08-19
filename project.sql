-- 1. 회사평가 ======================================================================================
CREATE SEQUENCE seq_CompanyVal;

CREATE  TABLE CompanyVal_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT CompanyVal_bno PRIMARY KEY (bno),
CONSTRAINT CompanyVal_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);

ALTER table CompanyVal_TB drop column updatedate;
ALTER TABLE CompanyVal_TB add replyCnt NUMBER(10,0) DEFAULT 0;

select * from CompanyVal_TB; 
drop TABLE CompanyVal_TB;

-- 2. 면접질문공유 ======================================================================================

CREATE SEQUENCE seq_InterViewAns;

CREATE  TABLE InterviewAns_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT InterviewAns_bno PRIMARY KEY (bno),
CONSTRAINT InterviewAns_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);
 
 ALTER table InterviewAns_TB drop column updatedate;
 ALTER TABLE InterviewAns_TB add replyCnt NUMBER(10,0) DEFAULT 0;
 
 select * from InterViewAns_TB;
 drop TABLE InterviewAns_TB;
-- 3. 합격후기 ======================================================================================
CREATE SEQUENCE seq_Passlatter;
  
CREATE  TABLE Passlatter_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT Passlatter_bno PRIMARY KEY (bno),
CONSTRAINT Passlatter_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);

 ALTER table Passlatter_TB drop column updatedate;
 ALTER TABLE Passlatter_TB add replyCnt NUMBER(10,0) DEFAULT 0;
 
 select * from Passlatter_TB;
drop TABLE Passlatter_TB;
  
-- 4. 고민Q&A ======================================================================================
 
CREATE SEQUENCE seq_WorryQnA;
  
CREATE  TABLE WorryQnA_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
category VARCHAR2(50) not null,
CONSTRAINT WorryQnA_bno PRIMARY KEY (bno),
CONSTRAINT WorryQnA_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);

ALTER table WorryQnA_TB drop column updatedate;
 ALTER TABLE WorryQnA_TB add replyCnt NUMBER(10,0) DEFAULT 0;
 select * from WorryQnA_TB;
 drop TABLE WorryQnA_TB;
 
-- 5. 합격자소서공유======================================================================================
CREATE SEQUENCE seq_PassSelfIntroduct;
  
CREATE  TABLE PassSelfIntroduct_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT PassSelfIntroduct_bno PRIMARY KEY (bno),
CONSTRAINT PassSelfIntroduct_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);

ALTER table PassSelfIntroduct_TB drop column updatedate;
 ALTER TABLE PassSelfIntroduct_TB add replyCnt NUMBER(10,0) DEFAULT 0;
 select * from PassSelfIntroduct_TB;
 drop TABLE PassSelfIntroduct_TB;

-- 6. 문의게시판======================================================================================

CREATE SEQUENCE seq_Ask;
  
CREATE  TABLE Ask_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
category VARCHAR2(50) not null,
CONSTRAINT Ask_bno PRIMARY KEY (bno),
CONSTRAINT Ask_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
);

ALTER table  Ask_TB drop column updatedate;
ALTER TABLE Ask_TB add replyCnt NUMBER(10,0) DEFAULT 0;
select * from Ask_TB;
drop TABLE Ask_TB;

select * from Ask_TB where userid='user2' order by regdate desc ;

 -- 7. 회원 ======================================================================================
 
create table Member_TB(
userid VARCHAR2(50) not null primary key,
userpw VARCHAR2(100) not null,
username VARCHAR2(100) not null,
userphone VARCHAR2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
enabled char(1) default '1');

select * from Member_TB; 
drop TABLE Member_TB;

select * from Member_TB order by regdate desc;

delete from Member_TB where userid= '아이디3';

commit;

 -- 8. 회원권한 ======================================================================================
 
CREATE  TABLE Member_Auth_TB(
userid VARCHAR2(50) not null,
auth VARCHAR2(50) DEFAULT 'ROLE_USER',
constraint Member_Auth_fk foreign key(userid)references Member_TB(userid) ON DELETE CASCADE
 );

select * from Member_Auth_TB; 

drop TABLE Member_Auth_TB;

insert into Member_Auth_TB(userid) select userid from Member_TB;

ALTER TABLE Member_Auth_TB ADD CONSTRAINT Member_Auth_fk FOREIGN KEY (userid) REFERENCES Member_TB(userid) ON DELETE CASCADE;

update Member_Auth_TB set auth='ROLE_ADMIN' where userid='user1';

 -- 9. 회사평가 댓글DB ======================================================================================
CREATE SEQUENCE seq_CompanyVal_reply;
 
CREATE TABLE CompanyVal_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 CONSTRAINT CompanyVal_reply_rno PRIMARY KEY (rno),
 CONSTRAINT CompanyVal_reply_bno foreign key(bno) references CompanyVal_TB(bno)ON DELETE CASCADE,
 CONSTRAINT CompanyVal_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
 select * from CompanyVal_reply_TB; 
 drop TABLE CompanyVal_reply_TB;
 
 
 -- 10. 면접질문공유댓글DB ======================================================================================
 CREATE SEQUENCE seq_InterviewAns_reply;
 
CREATE TABLE InterviewAns_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 CONSTRAINT InterviewAns_reply_rno PRIMARY KEY (rno),
 CONSTRAINT InterviewAns_reply_bno foreign key(bno) references InterviewAns_TB(bno)ON DELETE CASCADE,
 CONSTRAINT InterviewAns_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
select * from InterviewAns_reply_TB; 
drop TABLE InterviewAns_reply_TB;
 
 -- 11. 합격후기 댓글DB ======================================================================================
CREATE SEQUENCE seq_Passlatter_reply;
 
CREATE TABLE Passlatter_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 CONSTRAINT Passlatter_reply_rno PRIMARY KEY (rno),
 CONSTRAINT Passlatter_reply_bno foreign key(bno) references Passlatter_TB(bno)ON DELETE CASCADE,
 CONSTRAINT Passlatter_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
 select * from Passlatter_reply_TB; 
 drop TABLE Passlatter_reply_TB;
 
 -- 12. 고민Q&A 댓글DB ======================================================================================
 CREATE SEQUENCE seq_WorryQnA_reply;
 
CREATE TABLE WorryQnA_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT WorryQnA_reply_rno PRIMARY KEY (rno),
 CONSTRAINT WorryQnA_reply_bno foreign key(bno) references WorryQnA_TB(bno)ON DELETE CASCADE,
 CONSTRAINT WorryQnA_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
 select * from WorryQnA_reply_TB; 
 drop TABLE WorryQnA_reply_TB;
 
 -- 13. 합격자소서공유댓글DB ======================================================================================
CREATE SEQUENCE seq_PassSelfIntroduct_reply;
 
CREATE TABLE PassSelfIntroduct_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 CONSTRAINT PassSelfIntroduct_reply_rno PRIMARY KEY (rno),
 CONSTRAINT PassSelfIntroduct_reply_bno foreign key(bno) references PassSelfIntroduct_TB(bno) ON DELETE CASCADE, 
 CONSTRAINT PassSelfIntroduct_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
select * from PassSelfIntroduct_reply_TB;
drop TABLE PassSelfIntroduct_reply_TB;
  
 -- 14. 문의게시판댓글DB ======================================================================================
 
CREATE SEQUENCE seq_Ask_reply;
 
CREATE TABLE Ask_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 CONSTRAINT Ask_reply_rno PRIMARY KEY (rno),
 CONSTRAINT Ask_reply_bno foreign key(bno) references Ask_TB(bno) ON DELETE CASCADE,
 CONSTRAINT Ask_reply_userid foreign key(userid) references Member_TB(userid) ON DELETE CASCADE
 ); 
 
select * from Ask_reply_TB;
drop TABLE Ask_reply_TB;
 
 
 --======================================================================================
