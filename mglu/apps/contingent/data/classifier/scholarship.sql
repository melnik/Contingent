DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`scholarship_id`)
) TYPE=MyISAM;

INSERT INTO `scholarship` VALUES (1, '��������������� ������������� ���������');
INSERT INTO `scholarship` VALUES (2, '���������� ��������������� ������������� ���������');
INSERT INTO `scholarship` VALUES (3, '��������� ����� �. ������');
INSERT INTO `scholarship` VALUES (4, '��������� ������� ������ ���� ��. �. �. �������');
INSERT INTO `scholarship` VALUES (5, '��������� ������� ������ ����������');
INSERT INTO `scholarship` VALUES (6, '������� ��������� �. �. ����������');
INSERT INTO `scholarship` VALUES (7, '��������������� ������������� ��������� ��� ��������� 1 ����� 1 ��������');
INSERT INTO `scholarship` VALUES (8, '��������� ���������� ���������� ���������');
INSERT INTO `scholarship` VALUES (9, '����������� ��������������� ��������� ������������� ���������� ���������');
INSERT INTO `scholarship` VALUES (10, '��������������� ���������� ���������');
INSERT INTO `scholarship` VALUES (11, '��������������� ��������� ��� ����������');
INSERT INTO `scholarship` VALUES (12, '��������������� ��������� ��� �����������');
INSERT INTO `scholarship` VALUES (13, '������ ����� �. ������');
