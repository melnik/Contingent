DROP TABLE IF EXISTS `educational_organization_kind`;
CREATE TABLE `educational_organization_kind` (
  `educational_organization_kind_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`educational_organization_kind_id`)
) TYPE=MyISAM;

INSERT INTO `educational_organization_kind` VALUES (1,'школа','31 19');
INSERT INTO `educational_organization_kind` VALUES (2,'специальная (коррекционная) школа','31 62');
INSERT INTO `educational_organization_kind` VALUES (3,'гимназия','31 17');
INSERT INTO `educational_organization_kind` VALUES (4,'лицей','31 18');
INSERT INTO `educational_organization_kind` VALUES (5,'профессиональное училище','31 31');
INSERT INTO `educational_organization_kind` VALUES (6,'профессиональный лицей','');
INSERT INTO `educational_organization_kind` VALUES (7,'техникум (училище)','31 42');
INSERT INTO `educational_organization_kind` VALUES (8,'колледж','31 43');
INSERT INTO `educational_organization_kind` VALUES (9,'институт','31 54');
INSERT INTO `educational_organization_kind` VALUES (10,'академия','31 56');
INSERT INTO `educational_organization_kind` VALUES (11,'университет','31 55');
