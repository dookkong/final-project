-- 1. 회사평가 ======================================================================================
CREATE SEQUENCE seq_CompanyVal;

CREATE  TABLE CompanyVal_TB(
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

-- 2. 면접질문공유 ======================================================================================

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
-- 3. 합격후기 ======================================================================================
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
  
-- 4. 고민Q&A ======================================================================================
 
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
 
-- 5. 합격자소서공유======================================================================================
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

-- 6. 문의게시판======================================================================================

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

 -- 7. 회원 ======================================================================================

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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 