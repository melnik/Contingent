DROP TABLE IF EXISTS `study_form`;
CREATE TABLE `study_form` (
  `study_form_id` int(11) NOT NULL auto_increment,
  `code` varchar(5) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`study_form_id`)
) TYPE=MyISAM;

INSERT INTO `study_form` VALUES (1, '33 1', '�����');
INSERT INTO `study_form` VALUES (2, '33 2', '����-������� (��������)');
INSERT INTO `study_form` VALUES (3, '33 3', '�������');
INSERT INTO `study_form` VALUES (4, '33 6', '���������������');
INSERT INTO `study_form` VALUES (5, '33 4', '���������');
INSERT INTO `study_form` VALUES (6, '', '����������� ������������� ��������������� ����������');
