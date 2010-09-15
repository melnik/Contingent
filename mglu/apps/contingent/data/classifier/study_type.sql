DROP TABLE IF EXISTS `study_type`;
CREATE TABLE `study_type` (
  `study_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`study_type_id`)
) TYPE=MyISAM;

INSERT INTO `study_type` VALUES (1, 'бюджетная');
INSERT INTO `study_type` VALUES (2, 'платная');
INSERT INTO `study_type` VALUES (4, 'по направлению');
