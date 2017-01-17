DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE db_dict.dict;
CREATE TABLE db_dict.dict(
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  word  VARCHAR(255) NOT NULL
  COMMENT '热词',
  queryId  VARCHAR(255) NOT NULL
  COMMENT '查询',
  translateId  VARCHAR(255) NOT NULL
  COMMENT '翻译'
)
  COMMENT '词典表';


DROP TABLE db_dict.query;
CREATE TABLE db_dict.query(
  queryId   VARCHAR(255) NOT NULL
  COMMENT 'FK',
  English   VARCHAR(255) NOT NULL
  COMMENT '英文',
  Chinese   VARCHAR(255) NOT NULL
  COMMENT '中文',
  more      VARCHAR(255) NOT NULL
  COMMENT '更多'
)
  COMMENT '查询表';


DROP TABLE db_dict.translate;
CREATE TABLE db_dict.translate(
  translateId  VARCHAR(255) NOT NULL
  COMMENT 'FK',
  basic     VARCHAR(255) NOT NULL
  COMMENT '基本释义',
  specialty  VARCHAR(255) NOT NULL
  COMMENT '专业释义',
  example   MEDIUMTEXT  NOT NULL
  COMMENT '例句'
)
  COMMENT '翻译表';

SELECT *
FROM db_dict.dict;

ALTER TABLE db_dict.query
  ADD CONSTRAINT
  fk_dict_queryId
FOREIGN KEY (queryId)
REFERENCES db_dict.query(id);
