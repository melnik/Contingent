DROP TABLE IF EXISTS `student_state`;
CREATE TABLE `student_state` (
  `student_state_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`student_state_id`)
) TYPE=MyISAM;

INSERT INTO `student_state` VALUES (2, '���������');
INSERT INTO `student_state` VALUES (3, '������. ������');
INSERT INTO `student_state` VALUES (4, '��������');
INSERT INTO `student_state` VALUES (6, '�������');
INSERT INTO `student_state` VALUES (7, '�� ����������');
