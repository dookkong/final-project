 -- 1. ????? ======================================================================================
CREATE SEQUENCE seq_CompanyVal;

CREATE TABLE CompanyVal_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT CompanyVal_bno PRIMARY KEY (bno),
CONSTRAINT CompanyVal_userid foreign key(userid) references Member_TB(userid)
);

select * from CompanyVal_TB; 
drop TABLE CompanyVal_TB;

insert into CompanyVal_TB(bno, title, content, userid)
(select seq_CompanyVal.nextval, title, content, userid from CompanyVal_TB);

INSERT INTO CompanyVal_TB(bno,title,content,userid) VALUES(seq_CompanyVal.nextval,'춘향전1','이춘향과 이몽룡의 이야기','chun');
INSERT INTO CompanyVal_TB(bno,title,content,userid) VALUES(seq_CompanyVal.nextval,'견사라2','견자희의 사연 라디오','gyen');
INSERT INTO CompanyVal_TB(bno,title,content,userid) VALUES(seq_CompanyVal.nextval,'나나양의 우주탐험3','나나양의 우주여행기','nana');
INSERT INTO CompanyVal_TB(bno,title,content,userid) VALUES(seq_CompanyVal.nextval,'픽셀스토어4','픽셀 컴퍼니의 비하인드 스토리','jinu');
INSERT INTO CompanyVal_TB(bno,title,content,userid) VALUES(seq_CompanyVal.nextval,'차비리뷰5','고차비의 게임 모음집','chab');

commit;

-- 2. ???????????? ======================================================================================

CREATE SEQUENCE seq_InterViewAns;

CREATE  TABLE InterviewAns_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT InterviewAns_bno PRIMARY KEY (bno),
CONSTRAINT InterviewAns_userid foreign key(userid) references Member_TB(userid)
);
 
 select * from InterViewAns_TB;
 drop TABLE InterviewAns_TB;
-- 3. ????ı? ======================================================================================
CREATE SEQUENCE seq_Passlatter;
  
CREATE  TABLE Passlatter_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT Passlatter_bno PRIMARY KEY (bno),
CONSTRAINT Passlatter_userid foreign key(userid) references Member_TB(userid)
);

 select * from Passlatter_TB;
drop TABLE Passlatter_TB;
  
-- 4. ????Q&A ======================================================================================
 
CREATE SEQUENCE seq_WorryQnA;
  
CREATE  TABLE WorryQnA_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
category VARCHAR2(50) not null,
CONSTRAINT WorryQnA_bno PRIMARY KEY (bno),
CONSTRAINT WorryQnA_userid foreign key(userid) references Member_TB(userid)
);

 select * from WorryQnA_TB;
 drop TABLE WorryQnA_TB;
 
-- 5. ???????????======================================================================================
CREATE SEQUENCE seq_PassSelfIntroduct;
  
CREATE  TABLE PassSelfIntroduct_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
views NUMBER(10,0) DEFAULT 0,
likes NUMBER(10,0) DEFAULT 0,
CONSTRAINT PassSelfIntroduct_bno PRIMARY KEY (bno),
CONSTRAINT PassSelfIntroduct_userid foreign key(userid) references Member_TB(userid)
);

 select * from PassSelfIntroduct_TB;
 drop TABLE PassSelfIntroduct_TB;

-- 6. ????????======================================================================================

CREATE SEQUENCE seq_Ask;
  
CREATE  TABLE Ask_TB(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
userid VARCHAR2(50) not null,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT sysdate,
category VARCHAR2(50) not null,
CONSTRAINT Ask_bno PRIMARY KEY (bno),
CONSTRAINT Ask_userid foreign key(userid) references Member_TB(userid)
);

 select * from Ask_TB;
drop TABLE Ask_TB;

 -- 7. ??? ======================================================================================

CREATE SEQUENCE seq_Member;

 CREATE  TABLE Member_TB(
 bno NUMBER(10,0),
 username VARCHAR2(50) not null,
 password VARCHAR2(50) not null,
 userid VARCHAR2(50) not null,
 userphone VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 auth VARCHAR2(50) DEFAULT 'ROLE_USER',
 CONSTRAINT Member_userid PRIMARY KEY (userid)
 ); 
 
select * from Member_TB; 

INSERT INTO Member_TB(bno,username, password, userid, userphone)VALUES(seq_Member.nextval,'이춘향','1234','chun','010-1234-5678');
INSERT INTO Member_TB(bno,username, password, userid, userphone)VALUES(seq_Member.nextval,'견자희','5678','gyen','010-7894-6542');
INSERT INTO Member_TB(bno,username, password, userid, userphone)VALUES(seq_Member.nextval,'나나양','9123','nana','010-3597-1597');
INSERT INTO Member_TB(bno,username, password, userid, userphone)VALUES(seq_Member.nextval,'김지누','4567','jinu','010-5287-9574');
INSERT INTO Member_TB(bno,username, password, userid, userphone)VALUES(seq_Member.nextval,'고차비','8912','chab','010-8451-3265');

drop TABLE Member_TB;

commit;

 -- 8. 회사평가 댓글DB ======================================================================================
CREATE SEQUENCE seq_CompanyVal_reply;
 
CREATE TABLE CompanyVal_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT CompanyVal_reply_rno PRIMARY KEY (rno),
 CONSTRAINT CompanyVal_reply_bno foreign key(bno) references CompanyVal_TB(bno),
 CONSTRAINT CompanyVal_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from CompanyVal_reply_TB; 
 
INSERT INTO CompanyVal_reply_TB(rno, bno, reply, userid) VALUES(seq_CompanyVal_reply.nextval, 42, '댓글을 해보자','chun');
INSERT INTO CompanyVal_reply_TB(rno, bno, reply, userid) VALUES(seq_CompanyVal_reply.nextval, 43, '댓글 두번째','gyen');
INSERT INTO CompanyVal_reply_TB(rno, bno, reply, userid) VALUES(seq_CompanyVal_reply.nextval, 44, '댓글을 세번째 해본다','jinu');
INSERT INTO CompanyVal_reply_TB(rno, bno, reply, userid) VALUES(seq_CompanyVal_reply.nextval, 45, '댓글을 네번째나','nana');
 
 commit;
 
 -- 9. 면접질문공유댓글DB ======================================================================================
 CREATE SEQUENCE seq_InterviewAns_reply;
 
CREATE TABLE InterviewAns_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT InterviewAns_reply_rno PRIMARY KEY (rno),
 CONSTRAINT InterviewAns_reply_bno foreign key(bno) references InterviewAns_TB(bno),
 CONSTRAINT InterviewAns_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from InterviewAns_reply_TB; 
 
 -- 10. 합격후기 댓글DB ======================================================================================
CREATE SEQUENCE seq_Passlatter_reply;
 
CREATE TABLE Passlatter_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DA;TE DEFAULT sysdate,
 CONSTRAINT Passlatter_reply_rno PRIMARY KEY (rno),
 CONSTRAINT Passlatter_reply_bno foreign key(bno) references Passlatter_TB(bno),
 CONSTRAINT Passlatter_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from Passlatter_reply_TB; 
 -- 11. 고민Q&A 댓글DB ======================================================================================
 CREATE SEQUENCE seq_WorryQnA_reply;
 
CREATE TABLE WorryQnA_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT WorryQnA_reply_rno PRIMARY KEY (rno),
 CONSTRAINT WorryQnA_reply_bno foreign key(bno) references WorryQnA_TB(bno),
 CONSTRAINT WorryQnA_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from Passlatter_reply_TB; 
 
 -- 12. 합격자소서공유댓글DB ======================================================================================
CREATE SEQUENCE seq_PassSelfIntroduct_reply;
 
CREATE TABLE PassSelfIntroduct_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT PassSelfIntroduct_reply_rno PRIMARY KEY (rno),
 CONSTRAINT PassSelfIntroduct_reply_bno foreign key(bno) references PassSelfIntroduct_TB(bno),
 CONSTRAINT PassSelfIntroduct_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from Passlatter_reply_TB;
 
 -- 13. 문의게시판댓글DB ======================================================================================
 
CREATE SEQUENCE seq_Ask_reply;
 
CREATE TABLE Ask_reply_TB(
 rno NUMBER(10,0),
 bno NUMBER(10,0),
 reply VARCHAR2(1000) not null,
 userid VARCHAR2(50) not null,
 regdate DATE DEFAULT sysdate,
 updatedate DATE DEFAULT sysdate,
 CONSTRAINT Ask_reply_rno PRIMARY KEY (rno),
 CONSTRAINT Ask_reply_bno foreign key(bno) references Ask_TB(bno),
 CONSTRAINT Ask_reply_userid foreign key(userid) references Member_TB(userid)
 ); 
 
 select * from Passlatter_reply_TB;



 