--
-- DROP table
--
DROP TABLE tbl_user;
DROP TABLE tbl_attach;
DROP TABLE tbl_reply;
DROP TABLE tbl_jboard;


--
-- tbl_user
--
CREATE TABLE tbl_user
(
   uid	VARCHAR2(50) NOT NULL PRIMARY KEY ,
   upw	VARCHAR2(50) NOT NULL,
   uname	VARCHAR2(100) NOT NULL,
   upoint	NUMBER DEFAULT 0,
   sessionkey	VARCHAR2(50) DEFAULT 'none',
   sessionlimit	DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO tbl_user(uid, upw, uname)
     VALUES ('user00', 'user00', 'IRON MAN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user01', 'user01', 'CAPTAIN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user02', 'user02', 'HULK');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user03', 'user03', 'Thor');
	 

--
-- tbl_jboard
--
CREATE TABLE tbl_jboard
(
   bno        NUMBER NOT NULL PRIMARY KEY,
   title      VARCHAR2(200) NOT NULL,
   content    LONG NULL,
   writer     VARCHAR2(50) NOT NULL,
   regdate    DATE DEFAULT SYSDATE NOT NULL ,
   viewcnt    NUMBER DEFAULT 0,
   replycnt   NUMBER DEFAULT 0,
   contentid  VARCHAR2(20) NOT NULL,
   contitle   LONG NOT NULL
);

CREATE SEQUENCE bno START WITH 1 INCREMENT BY 1 MAXVALUE 100000 CYCLE NOCACHE;


--
-- tbl_reply
--
CREATE TABLE tbl_reply
(
   rno          int NOT NULL PRIMARY KEY,
   bno          int DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp DEFAULT SYSDATE NOT NULL ,
   updatedate   timestamp DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE rno START WITH 1 INCREMENT BY 1 MAXVALUE 100000 CYCLE NOCACHE;

ALTER TABLE tbl_reply
  ADD CONSTRAINT fk_jboard_reply FOREIGN KEY(bno) REFERENCES tbl_jboard(bno);
