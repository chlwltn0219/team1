--
-- DROP table
--
--
--  DROP TABLE tbl_message;
--
DROP TABLE tbl_user;
DROP TABLE tbl_message;
DROP TABLE tbl_member;
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
   uname 		  VARCHAR(100) NOT NULL,
   sex			  VARCHAR(50) NOT NULL,
   bir			  int NOT NULL,
   conti		  VARCHAR(100) NOT NULL,
   upoint         int NOT NULL DEFAULT 0,
   sessionkey     varchar(50) NOT NULL DEFAULT 'none',
   sessionlimit   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(uid)
);

INSERT INTO tbl_user(UID, upw, uname, sex, bir, conti)
     VALUES ('user00', 'user00', 'IRON@MAN', 'Female', '1988', 'ASIA');
 INSERT INTO tbl_user(UID, upw, uname, sex, bir, conti)
     VALUES ('user01', 'user01', 'SMITHN@WOW', 'Male', '1989', 'EUROPE');
 INSERT INTO tbl_user(UID, upw, uname, sex, bir, conti)
     VALUES ('user02', 'user02', 'SAGA@GO', 'Female', '1990', 'NORTH AMERICA');
 INSERT INTO tbl_user(UID, upw, uname, sex, bir, conti)
     VALUES ('user03', 'user03', 'JOHN@US', 'Male', '1991', 'SOUTH AMERICA');
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
   contitle   text NOT NULL,
   PRIMARY KEY(bno)
);

INSERT INTO tbl_jboard(title, content, writer, contentid, contitle)
     VALUES ('억새 축체 가실분 ??', '분위기 짱짱', 'user03', 626944, "억새");
INSERT INTO tbl_jboard(title, content, writer, contentid, contitle)
     VALUES ('창덕궁 야간 개장 얼마 안남았데요!', '서둘러 같이 가실 분 구해요!', 'user02', 1291408, "창덕궁 야간");
INSERT INTO tbl_jboard(title, content, writer, contentid, contitle)
     VALUES ('아 맥주 마시고 싶다', '혼술 하시는 분 함께하요', 'user03', 2034310, "맥주축제");
INSERT INTO tbl_jboard(title, content, writer, contentid, contitle)
     VALUES ('이 축제의 스타일은?', 'Gang-Nam Style! Go With Me!', 'user02', 737479, "강남축제");
INSERT INTO tbl_jboard(title, content, writer, contentid, contitle)
     VALUES ('보드겜 한판 하실래요?', '제가 좀 잘합니다.', 'user01', 2410727, "보드게임 컨벤션");

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
  ADD CONSTRAINT fk_jboard_reply FOREIGN KEY(bno) REFERENCES tbl_jboard(bno);

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
