DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `degree_code` char(2) NOT NULL default '00',
  `name` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`degree_code`)
) TYPE=MyISAM;

INSERT INTO `degree` VALUES ('62', '��������');
INSERT INTO `degree` VALUES ('65', '��������������� ����������');
INSERT INTO `degree` VALUES ('68', '�������');
