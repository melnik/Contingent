DROP TABLE IF EXISTS `student_status`;
CREATE TABLE `student_status` (
  `student_status_id` int(11) NOT NULL auto_increment,
  `name` varchar(120) default NULL,
  PRIMARY KEY  (`student_status_id`)
) TYPE=MyISAM;

INSERT INTO `student_status` VALUES (1, '�������');
INSERT INTO `student_status` VALUES (2, '���������');
INSERT INTO `student_status` VALUES (3, '��������');
