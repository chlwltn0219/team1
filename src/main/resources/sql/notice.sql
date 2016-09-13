

 DROP TABLE Notice_USER;
 
 
 
 --
-- tbl_board
--
CREATE TABLE Notice_user
(
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NOT NULL,
   replycnt   int DEFAULT 0,
   PRIMARY KEY(bno)
);

 
 
 