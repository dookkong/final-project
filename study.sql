CREATE SEQUENCE seq_board;

CREATE  TABLE t_board(
bno NUMBER(10,0),
title VARCHAR2(200) not null,
content VARCHAR2(2000) not null,
writer VARCHAR2(50) not null,
regdate date DEFAULT sysdate,
updatedate date DEFAULT sysdate
);

alter table t_board add CONSTRAINT pk_bpard PRIMARY key(bno);

INSERT INTO t_board(bno,title,content,writer) VALUES(seq_board.nextval,'테스트제목','테스트내용','user00');
INSERT INTO t_board(bno,title,content,writer) VALUES(seq_board.nextval,'테스트제목01','테스트내용01','user01');
INSERT INTO t_board(bno,title,content,writer) VALUES(seq_board.nextval,'테스트제목02','테스트내용02','user02');
INSERT INTO t_board(bno,title,content,writer) VALUES(seq_board.nextval,'테스트제목03','테스트내용03','user03');
INSERT INTO t_board(bno,title,content,writer) VALUES(seq_board.nextval,'테스트제목04','테스트내용04','user04');

commit;

Select*from t_board;

drop table t_board;

drop sequence seq_board;

Select*from 
(
select /*+ INDEX_DESC(t_board PK_BPARD)*/ rownum rn,bno,title,content from t_board where rownum<=2*10
)
where (2-1)*10<rn
-- ==================================================================================================================
create SEQUENCE seq_reply; --순차적으로 번호를 줌

create table t_reply(
rno NUMBER(10,0),
bno NUMBER(10,0) not null,
reply VARCHAR2(1000) not null,
replyer VARCHAR2(50) not null,
replydate date default sysdate,
updatedate date default sysdate
);
alter table t_reply add constraint pk_reply primary key(rno);
alter table t_reply add constraint fk_reply_board foreign key(bno) references t_board(bno);
commit;

select* from t_reply;
delete from t_reply where rno=21;

create index idx_reply on t_reply(bno desc,rno asc);

select /*+ index(t_reply idx_reply)*/ rownum rn, bno, reply, replyer, replydate, updatedate 
from t_reply where bno=12 and rno>0; 

select rno, bno, reply, replyer, replydate, updatedate
from(
select /*+ index(t_reply idx_reply)*/ rownum rn, rno, bno, reply, replyer, replydate, updatedate 
from t_reply where bno=1 
and rno>0 
and rownum <=10
)
where rn>0;


select rno, bno, reply, replyer, replydate, updatedate
			from(
			select /*+ index(t_reply idx_reply)*/ 
			rownum rn, bno, rno, reply, replyer, replydate, updatedate 
			from t_reply 
			where bno=1
			and rno>0
			and rownum <= (1-1) * 10
			)
		where rn>1-1*10;
 
 alter table t_board add(replycnt number default 0);
 
 update t_board set replycnt= (select count(rno)from t_reply where t_reply.bno= t_board.bno);
 
 select * from t_reply order by bno;
-- ==================================================================================================================

create table t_member(
userid VARCHAR2(50) not null primary key,
userpw VARCHAR2(100) not null,
username VARCHAR2(100) not null,
regdate date default sysdate,
updatedate date default sysdate,
enabled char(1) default '1');

create table t_member_auth(
userid VARCHAR2(50) not null,
auth VARCHAR2(50) not null,
constraint fk_member_auth foreign key(userid) references t_member(userid)
);

 select * from t_member;
 select * from t_member_auth;
 

INSERT INTO t_member(userid,userpw,username) VALUES('user80','1234','일반사용자80');

-- ==================================================================================================================


