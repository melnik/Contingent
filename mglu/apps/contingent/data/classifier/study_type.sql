DROP TABLE IF EXISTS `study_type`;
CREATE TABLE `study_type` (
  `study_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`study_type_id`)
) TYPE=MyISAM;

INSERT INTO `study_type` VALUES (1, '���������');
INSERT INTO `study_type` VALUES (2, '�������');
INSERT INTO `study_type` VALUES (4, '�� �����������');
