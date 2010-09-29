DROP TABLE IF EXISTS `education_level`;
CREATE TABLE `education_level` (
  `education_level_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`education_level_id`)
) TYPE=MyISAM;

INSERT INTO `education_level` VALUES (1,'среднее (полное) общее','30 07');
INSERT INTO `education_level` VALUES (2,'начальное профессиональное','30 10');
INSERT INTO `education_level` VALUES (3,'среднее профессиональное','30 11');
INSERT INTO `education_level` VALUES (4,'неполное высшее','30 15');
INSERT INTO `education_level` VALUES (5,'высшее профессиональное','30 18');
INSERT INTO `education_level` VALUES (6,'послевузовское профессиональное','30 19');

