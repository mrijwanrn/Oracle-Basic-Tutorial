-----------------START TABLE SCRIPT ----------------------------------

--
-- Copyright (c) 2026
-- All Rights Reserved.
--
-- NAME
--   course_management_bld.sql
--
-- DESCRIPTION
--   This script creates COURSE MANAGEMENT demonstration tables
--   in the current Oracle schema.
--
--   Tables included:
--   1. courses
--   2. course_cards
--   3. course_topics
--
-- USAGE
--   START course_management_bld.sql
--


-- DROP TABLES


DROP TABLE course_topics;
DROP TABLE course_cards;
DROP TABLE courses;
/


---- TABLE CREATION START



-- COURSES TABLE

CREATE TABLE courses (
    course_id        NUMBER PRIMARY KEY,
    course_code      VARCHAR2(30) NOT NULL,
    course_title     VARCHAR2(100) NOT NULL,
    course_desc      VARCHAR2(300),

    -- WHO / AUDIT columns
    created_by       VARCHAR2(50),
    created_date     DATE DEFAULT SYSDATE,
    updated_by       VARCHAR2(50),
    updated_date     DATE,

    -- Feature columns
    attribute1       VARCHAR2(100),
    attribute2       VARCHAR2(100),
    attribute3       VARCHAR2(100),
    attribute4       VARCHAR2(100)
);
/

CREATE SEQUENCE seq_courses START WITH 1;
/

CREATE OR REPLACE TRIGGER trg_courses_pk
BEFORE INSERT ON courses
FOR EACH ROW
BEGIN
  IF :NEW.course_id IS NULL THEN
    SELECT seq_courses.NEXTVAL INTO :NEW.course_id FROM dual;
  END IF;
END;
/


-- COURSE_CARDS TABLE


CREATE TABLE course_cards (
    card_id         NUMBER PRIMARY KEY,
    card_title      VARCHAR2(100) NOT NULL,
    card_subtitle   VARCHAR2(200),
    image_url       VARCHAR2(500),
    page_link       VARCHAR2(200),
    display_order   NUMBER,
    status          VARCHAR2(20) DEFAULT 'ACTIVE',
    created_at      DATE DEFAULT SYSDATE,

    -- WHO / AUDIT columns
    created_by      VARCHAR2(50),
    updated_by      VARCHAR2(50),
    updated_date    DATE,

    -- Feature columns
    attribute1      VARCHAR2(100),
    attribute2      VARCHAR2(100),
    attribute3      VARCHAR2(100),
    attribute4      VARCHAR2(100)
);
/

CREATE SEQUENCE seq_course_cards START WITH 1;
/

CREATE OR REPLACE TRIGGER trg_course_cards_pk
BEFORE INSERT ON course_cards
FOR EACH ROW
BEGIN
  IF :NEW.card_id IS NULL THEN
    SELECT seq_course_cards.NEXTVAL INTO :NEW.card_id FROM dual;
  END IF;
END;
/

-- COURSE_TOPICS TABLE


CREATE TABLE course_topics (
    topic_id           NUMBER PRIMARY KEY,
    category           VARCHAR2(50) NOT NULL,
    topic_no           NUMBER NOT NULL,
    title              VARCHAR2(100) NOT NULL,
    summary            VARCHAR2(500),
    last_updated_date  DATE DEFAULT SYSDATE,
    test_rating        VARCHAR2(5),
    feedback           VARCHAR2(250),
    start_date         DATE,
    end_date           DATE,

    -- WHO / AUDIT columns
    created_by         VARCHAR2(50),
    created_date       DATE DEFAULT SYSDATE,
    updated_by         VARCHAR2(50),
    updated_date       DATE,

    -- Feature columns
    attribute1         VARCHAR2(100),
    attribute2         VARCHAR2(100),
    attribute3         VARCHAR2(100),
    attribute4         VARCHAR2(100)
);
/

CREATE SEQUENCE seq_course_topics START WITH 1;
/

CREATE OR REPLACE TRIGGER trg_course_topics_pk
BEFORE INSERT ON course_topics
FOR EACH ROW
BEGIN
  IF :NEW.topic_id IS NULL THEN
    SELECT seq_course_topics.NEXTVAL INTO :NEW.topic_id FROM dual;
  END IF;
END;
/


-- OPTIONAL PERFORMANCE INDEXES


CREATE INDEX idx_course_cards_status ON course_cards(status);
CREATE INDEX idx_course_topics_category ON course_topics(category);
/

-------------------- END SCRIPT -------------------
SELECT 
       CARD_ID,
       CARD_TITLE,
       CARD_SUBTITLE,
       '#APP_FILES#' || IMAGE_URL AS IMAGE_URL,
       DISPLAY_ORDER,
       STATUS,
       CREATED_AT,

       APEX_PAGE.GET_URL(
           p_page => CASE CARD_ID
                        WHEN 1 THEN 4
                        WHEN 2 THEN 5
                        WHEN 3 THEN 6
                        WHEN 4 THEN 100
                        WHEN 5 THEN 1100
                        WHEN 6 THEN 1200
                        WHEN 7 THEN 1300
                        ELSE 14000
                     END
       ) AS TARGET_URL

FROM COURSE_CARDS
WHERE STATUS = 'ACTIVE'
ORDER BY DISPLAY_ORDER;



/

SELECT
    topic_id,
    CATEGORY AS card_categ,
    topic_no || ': ' || title AS card_title,
    summary AS card_text,
    CASE
       
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 0 THEN 'Last Updated :  Today updated'
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 1 THEN 'Last Updated : 1 day ago'
        ELSE 'Last Updated : '|| ROUND(SYSDATE - LAST_UPDATED_DAYS) || ' days ago'
    END AS card_subtext,

    APEX_PAGE.GET_URL(
        p_page => CASE topic_id
                    WHEN 1 THEN 7
                    WHEN 2 THEN 8
                    WHEN 3 THEN 9
                    WHEN 4 THEN 10
                    WHEN 5 THEN 11
                    WHEN 6 THEN 12
                    WHEN 7 THEN 13
                    ELSE 14
                  END
    ) AS URL
FROM course_topics where CATEGORY LIKE'Orac%'
ORDER BY topic_no;
/
SELECT
    topic_id,
    CATEGORY AS card_categ,
    topic_no || ': ' || title AS card_title,
    summary AS card_text,
    CASE
       
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 0 THEN 'Last Updated :  Today updated'
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 1 THEN 'Last Updated : 1 day ago'
        ELSE 'Last Updated : '|| ROUND(SYSDATE - LAST_UPDATED_DAYS) || ' days ago'
    END AS card_subtext,

    APEX_PAGE.GET_URL(
        p_page => CASE topic_id
                    WHEN 8 THEN 17
                    WHEN 9 THEN 18
                    WHEN 10 THEN 19
                    WHEN 11 THEN 20
                    WHEN 12 THEN 21
                    WHEN 13 THEN 22
                    WHEN 14 THEN 23
                    WHEN 15 THEN 24
                    WHEN 16 THEN 25
                    WHEN 17 THEN 26

                    ELSE 100
                  END
    ) AS URL
FROM course_topics WHERE CATEGORY LIKE 'PL%'
ORDER BY topic_no;
/
SELECT
    topic_id,
    CATEGORY AS card_categ,
    topic_no || ': ' || title AS card_title,
    summary AS card_text,
    CASE
       
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 0 THEN 'Last Updated :  Today updated'
        WHEN ROUND(SYSDATE - LAST_UPDATED_DAYS) = 1 THEN 'Last Updated : 1 day ago'
        ELSE 'Last Updated : '|| ROUND(SYSDATE - LAST_UPDATED_DAYS) || ' days ago'
    END AS card_subtext,

    APEX_PAGE.GET_URL(
        p_page => CASE topic_id
                    WHEN 18 THEN 27
                    WHEN 19 THEN 28
                    WHEN 20 THEN 29
                    WHEN 21 THEN 30
                    WHEN 22 THEN 31
                    WHEN 23 THEN 32
                    WHEN 24 THEN 33
                    WHEN 25 THEN 34
                    WHEN 26 THEN 35
                    WHEN 27 THEN 36
                    WHEN 28 THEN 37
                    WHEN 29 THEN 38

                    ELSE 100
                  END
    ) AS URL
FROM course_topics WHERE CATEGORY LIKE 'APEX%'
ORDER BY topic_no;

/
