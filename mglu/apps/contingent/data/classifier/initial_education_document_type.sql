DROP TABLE IF EXISTS `initial_education_document_type`;
CREATE TABLE `initial_education_document_type` (
  `initial_education_document_type_id` int(11) NOT NULL default '0',
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`initial_education_document_type_id`)
) TYPE=MyISAM;

INSERT INTO `initial_education_document_type` VALUES (1,'аттестат о среднем (полном) общем образовании');
INSERT INTO `initial_education_document_type` VALUES (2,'диплом о начальном профессиональном образовании');
INSERT INTO `initial_education_document_type` VALUES (3,'диплом о среднем профессиональном образовании');
INSERT INTO `initial_education_document_type` VALUES (4,'диплом о неполном высшем профессиональном образовании');
INSERT INTO `initial_education_document_type` VALUES (5,'диплом о высшем профессиональном образовании');
