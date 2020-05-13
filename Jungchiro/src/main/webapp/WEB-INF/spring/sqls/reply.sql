DROP SEQUENCE REPLY_SEQ;

DROP TABLE REPLY;

CREATE SEQUENCE REPLY_SEQ;
CREATE TABLE REPLY(
	REPLY_SEQ NUMBER NOT NULL PRIMARY KEY,
	BOARD_SEQ NUMBER NOT NULL,
	MEMBER_SEQ NUMBER NOT NULL,
	REPLY_CONTENT VARCHAR2(1000) NOT NULL,
	REPLY_DATE DATE NOT NULL
);

ALTER TABLE REPLY DROP CONSTRAINT BOARD_SEQ_FK;
ALTER TABLE REPLY DROP CONSTRAINT MEMBER_SEQ_FK_2;

ALTER TABLE REPLY ADD CONSTRAINT BOARD_SEQ_FK FOREIGN KEY (BOARD_SEQ)
REFERENCES BOARD(BOARD_SEQ);

ALTER TABLE REPLY ADD CONSTRAINT MEMBER_SEQ_FK_2 FOREIGN KEY (MEMBER_SEQ)
REFERENCES MEMBER(MEMBER_SEQ);

INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, (SELECT BOARD_SEQ FROM BOARD WHERE BOARD_SEQ = 1), 
(SELECT MEMBER_SEQ FROM MEMBER WHERE MEMBER_SEQ = 1), '테스트 댓글', SYSDATE)

SELECT * FROM REPLY ORDER BY REPLY_SEQ DESC;