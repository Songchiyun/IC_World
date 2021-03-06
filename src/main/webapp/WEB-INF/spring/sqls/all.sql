-- [회원]
DROP TABLE USERS;
-- [게시판]
DROP TABLE POSTS;
DROP SEQUENCE BOARDNUMSEQ;
-- [게시판 댓글]
DROP TABLE POSTSCOMM;
DROP SEQUENCE COMMNUM; 
DROP SEQUENCE GROUPNO;
-- [방명록]
DROP TABLE GUESTBOOK;
DROP SEQUENCE BOARDNUM;
-- [방명록 댓글]
DROP TABLE GUESTBOOKCOMM;


-- [친구]
DROP TABLE NOTIFICATION;
-- [다이어리]
DROP TABLE DIARY;
DROP SEQUENCE DIARYSEQ;

-- [사진첩]
DROP TABLE CLOUD;
DROP SEQUENCE CLOUDNUMSEQ;
DROP SEQUENCE INFOSEQ;


CREATE TABLE users(
	USERNAME VARCHAR2(20) NOT NULL,	--아이디
	PASSWORD VARCHAR2(100) NOT NULL ,	--비밀번호
	ENABLED INTEGER NULL ,			--탈퇴여부
	AUTHORITY VARCHAR2(100)	NOT NULL,	--권한
	NICKNAME VARCHAR2(100) NOT NULL,	--닉네임
	GENDER VARCHAR2(100) NOT NULL,		--성별
	EMAIL VARCHAR2(100) NOT NULL,		--이메일
	BIRTH DATE NOT NULL,			--생일
	USERMINI VARCHAR2(1000) NULL,		--미니미
	BGM	VARCHAR2(4000) NULL,		--배경음악...
	STATUS VARCHAR2(2000) NULL		--상태메시지
);


CREATE SEQUENCE BOARDNUMSEQ;
CREATE TABLE POSTS(
   BOARDNUM NUMBER NOT NULL,         --게시판번호
   USERNAME VARCHAR2(20) NOT NULL,      --아이디
   POSTCOMM VARCHAR2(300) NOT NULL,      --게시글내용
   POST_CONTENT CLOB NULL,            --사진경로
   POST_THUMBNAIL CLOB NULL,         --썸네일
   POSTDATE DATE NOT NULL,            --게시날짜
   HASHTAG VARCHAR2(500)            --해시태그

);



CREATE SEQUENCE COMMNUM;
CREATE SEQUENCE GROUPNO;
CREATE TABLE POSTSCOMM(
   COMMNUM NUMBER NOT NULL,   			--댓글 번호
   BOARDNUM NUMBER NOT NULL,  			--게시글 번호
   USERNAME VARCHAR2(500) NOT NULL,   		--사용자이름
   POSTSCOMM VARCHAR2(400) NOT NULL,   		--내용
   REPORTING_DATE DATE NOT NULL,      		--날짜
   GROUPNO NUMBER NOT NULL,         		--그룹번호
   GROUPSQ NUMBER NOT NULL,         		--그룹순서
   TITLETAB NUMBER NOT NULL         		--타이틀탭
);

CREATE SEQUENCE BOARDNUM;
CREATE TABLE GUESTBOOK(
	BOARDNUM NUMBER PRIMARY KEY NOT NULL,		--글번호
	USERNAME VARCHAR2(500) NOT NULL,		--사용자이름
	NICKNAME VARCHAR2(500) NOT NULL,		--닉네임
	CONTENT VARCHAR2(4000) NOT NULL,		--내용
	REPORTING_DATE DATE NOT NULL,			--작성일
	SENDTO VARCHAR2(400) NOT NULL,			--방명록대상
	SECRET VARCHAR2(10) NOT NULL			--비밀글

);




CREATE TABLE GUESTBOOKCOMM(
	COMMNUM NUMBER NOT NULL,			--댓글번호
	BOARDNUM NUMBER NOT NULL,			--방명록번호
	USERNAME VARCHAR2(500) NOT NULL,		--아이디
	NICKNAME VARCHAR2(500) NOT NULL,		--닉네임
	GUESTBOOKCOMM VARCHAR2(400) NOT NULL,		--댓글내용
	REPORTING_DATE DATE NOT NULL			--작성일
				
);


CREATE TABLE NOTIFICATION(
      USERNAME VARCHAR2(20) NOT NULL,		--아이디
      FRIEND VARCHAR2(300) NOT NULL,		--친구아이디
      ALLOW  VARCHAR2(100) DEFAULT 'N'		--팔로우상태
);




CREATE SEQUENCE DIARYSEQ;
CREATE TABLE DIARY(
	SCHEDULENO NUMBER NOT NULL,			--일정번호
	USERNAME VARCHAR2(20) NOT NULL,			--아이디
	TITLE VARCHAR2(100) NOT NULL,			--일정제목
	START_DATE DATE NOT NULL,			--시작날짜
	END_DATE DATE NOT NULL,				--끝나는날짜
	START_TIME VARCHAR2(10) NOT NULL,		--시작시간
	END_TIME VARCHAR2(10) NOT NULL			--끝나는시간
);




CREATE SEQUENCE CLOUDNUMSEQ;
CREATE SEQUENCE INFOSEQ;
CREATE TABLE CLOUD(
      
	  SEQ NUMBER NOT NULL,			--번호
      CLOUDNUM NUMBER,				--그룹번호
      USERNAME VARCHAR2(20) NOT NULL,		--아이디
      CLOUDCOMM VARCHAR2(300),			--업로드시 사진내용
      CONTENT    CLOB,				--업로드경로 + 사진이름
      CONTENTNAME VARCHAR2(500),			--사진이름
      CLOUDDATE DATE,				--날짜
      CLOUDFOLDER VARCHAR2(500)			--폴더명
      
);

