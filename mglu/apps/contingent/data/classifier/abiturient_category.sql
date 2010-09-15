DROP TABLE IF EXISTS `abiturient_category`;
CREATE TABLE `abiturient_category` (
  `abiturient_category_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`abiturient_category_id`)
) TYPE=MyISAM;

INSERT INTO `abiturient_category` VALUES (1,'������� �������� \"������������\"');
INSERT INTO `abiturient_category` VALUES (2,'������� �������� \"��� � �������\"');
INSERT INTO `abiturient_category` VALUES (3,'������� �������� \"��� � �������, ������\"');
INSERT INTO `abiturient_category` VALUES (4,'����������, ������������ ������� ��� ���������� �������');
INSERT INTO `abiturient_category` VALUES (5,'����������, ���������� ��������������� ���������� ����������������� ����������� � ��������');
INSERT INTO `abiturient_category` VALUES (6,'����������, ��������� ��������� ����');
INSERT INTO `abiturient_category` VALUES (7,'����������, ��������� ������������� ����');
INSERT INTO `abiturient_category` VALUES (8,'��������');
