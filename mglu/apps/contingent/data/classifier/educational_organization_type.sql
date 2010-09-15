DROP TABLE IF EXISTS `educational_organization_type`;
CREATE TABLE `educational_organization_type` (
  `educational_organization_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`educational_organization_type_id`)
) TYPE=MyISAM;

INSERT INTO `educational_organization_type` VALUES (1,'�������������������','31 10');
INSERT INTO `educational_organization_type` VALUES (2,'���������� ����������������� �����������','31 30');
INSERT INTO `educational_organization_type` VALUES (3,'�������� ����������������� �����������','31 40');
INSERT INTO `educational_organization_type` VALUES (4,'������� ����������������� �����������','31 50');
