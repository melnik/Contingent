DROP TABLE IF EXISTS `military`;
CREATE TABLE `military` (
  `military_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`military_id`)
) TYPE=MyISAM;

INSERT INTO `military` VALUES (0, '�� ���������');
INSERT INTO `military` VALUES (1, '1-� ���');
INSERT INTO `military` VALUES (2, '2-� ���');
INSERT INTO `military` VALUES (3, '3-� ���');
INSERT INTO `military` VALUES (4, '���������');
INSERT INTO `military` VALUES (5, '�������� ���������');
