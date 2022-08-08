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

 -- 7. 회원 ======================================================================================
 CREATE  TABLE Member_TB(
 username VARCHAR2(50) not null,
 password VARCHAR2(50) not null,
 userid VARCHAR2(50) not null,
 userphone VARCHAR2(50) not null,
 auth VARCHAR2(50) DEFAULT 'ROLE_USER',
 CONSTRAINT Member_userid PRIMARY KEY (userid)
 ); 
 
select * from Member_TB; 

commit;




 
