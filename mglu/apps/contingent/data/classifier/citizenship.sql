DROP TABLE IF EXISTS `citizenship`;
CREATE TABLE `citizenship` (
  `citizenship_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `code` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`citizenship_id`)
) TYPE=MyISAM;

INSERT INTO `citizenship` VALUES (1, '��������� ��', '02 1');
INSERT INTO `citizenship` VALUES (2, '��������� �� � ������������ ����������� (������� �����������)', '02 2');
INSERT INTO `citizenship` VALUES (3, '��������� ���������� ��������', '');
INSERT INTO `citizenship` VALUES (4, '����������� ���������, ��������� ����������� �� ���������� ��', '02 3');
INSERT INTO `citizenship` VALUES (5, '����������� ���������, �������� ����������� �� ���������� ��', '02 3');
INSERT INTO `citizenship` VALUES (6, '���� ��� �����������, ��������� ����������� �� ���������� ��', '02 4');
INSERT INTO `citizenship` VALUES (7, '���� ��� �����������, �������� ����������� �� ���������� ��', '02 4');
