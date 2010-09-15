DROP TABLE IF EXISTS `educational_organization_kind`;
CREATE TABLE `educational_organization_kind` (
  `educational_organization_kind_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`educational_organization_kind_id`)
) TYPE=MyISAM;

INSERT INTO `educational_organization_kind` VALUES (1,'�����','31 19');
INSERT INTO `educational_organization_kind` VALUES (2,'����������� (�������������) �����','31 62');
INSERT INTO `educational_organization_kind` VALUES (3,'��������','31 17');
INSERT INTO `educational_organization_kind` VALUES (4,'�����','31 18');
INSERT INTO `educational_organization_kind` VALUES (5,'���������������� �������','31 31');
INSERT INTO `educational_organization_kind` VALUES (6,'���������������� �����','');
INSERT INTO `educational_organization_kind` VALUES (7,'�������� (�������)','31 42');
INSERT INTO `educational_organization_kind` VALUES (8,'�������','31 43');
INSERT INTO `educational_organization_kind` VALUES (9,'��������','31 54');
INSERT INTO `educational_organization_kind` VALUES (10,'��������','31 56');
INSERT INTO `educational_organization_kind` VALUES (11,'�����������','31 55');
