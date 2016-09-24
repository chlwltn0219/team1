--
-- DROP table
--
DROP TABLE tbl_member;
DROP TABLE tbl_user;

DROP TABLE tbl_attach;
DROP TABLE tbl_reply;
DROP TABLE tbl_board;
DROP TABLE tbl_jboard;

--
-- tbl_member
--
CREATE TABLE tbl_member
(
   userid       VARCHAR(50) NOT NULL,
   userpw       VARCHAR(50) NOT NULL,
   username     VARCHAR(100) NOT NULL,
   email        VARCHAR(100),
   regdate      TIMESTAMP DEFAULT now(),
   updatedate   TIMESTAMP DEFAULT now(),
   PRIMARY KEY(userid)
);

--
-- tbl_user
--
CREATE TABLE tbl_user
(
   uid            VARCHAR(50) NOT NULL,
   upw            VARCHAR(50) NOT NULL,
   uname          VARCHAR(100) NOT NULL,
   upoint         int NOT NULL DEFAULT 0,
   sessionkey     varchar(50) NOT NULL DEFAULT 'none',
   sessionlimit   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(uid)
);


INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user00', 'user00', 'IRON MAN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user01', 'user01', 'CAPTAIN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user02', 'user02', 'HULK');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user03', 'user03', 'Thor');




--
-- tbl_board
--
CREATE TABLE tbl_board
(
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NOT NULL,
   regdate    timestamp NOT NULL DEFAULT now(),
   viewcnt    int DEFAULT 0,
   replycnt   int DEFAULT 0,
   PRIMARY KEY(bno)
);


--
-- tbl_jboard
--
CREATE TABLE tbl_jboard
(
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NOT NULL,
   regdate    timestamp NOT NULL DEFAULT now(),
   viewcnt    int DEFAULT 0,
   replycnt   int DEFAULT 0,
   contentid  varchar(20) NOT NULL,
   PRIMARY KEY(bno)
);

INSERT INTO tbl_jboard(title, content, writer, contentid)
     VALUES ('억새 축체 가실분 ??', '분위기 짱짱', 'user01', 626944);
INSERT INTO tbl_jboard(title, content, writer, contentid)
     VALUES ('찿덕궁 야간 개장 얼마 안남았데요!', '서둘러 같이 가실 분 구해요!', 'user02', 1291408);
INSERT INTO tbl_jboard(title, content, writer, contentid)
     VALUES ('아 맥주 마시고 싶다', '혼술 하시는 분 함께하요', 'user03', 2034310);
INSERT INTO tbl_jboard(title, content, writer, contentid)
     VALUES ('이 축제의 스타일은?', 'Gang-Nam Style! Go With Me!', 'user01', 737479);
INSERT INTO tbl_jboard(title, content, writer, contentid)
     VALUES ('보드겜 한판 하실래요?', '내가 좀 잘함', 'user01', 2410727);

--
-- tbl_reply
--
CREATE TABLE tbl_reply
(
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);

ALTER TABLE tbl_reply
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(bno) REFERENCES tbl_board(bno);

--
-- tbl_attach
--
CREATE TABLE tbl_attach
(
   fullName   VARCHAR(150) NOT NULL,
   bno        INT NOT NULL,
   regdate    TIMESTAMP DEFAULT now(),
   PRIMARY KEY(fullName)
);

ALTER TABLE tbl_attach
  ADD CONSTRAINT fk_borad_attach FOREIGN KEY(bno) REFERENCES tbl_board(bno);
