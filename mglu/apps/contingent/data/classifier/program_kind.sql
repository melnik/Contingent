DROP TABLE IF EXISTS `program_kind`;
CREATE TABLE `program_kind` (
  `program_kind_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  PRIMARY KEY  (`program_kind_id`)
) TYPE=MyISAM;

INSERT INTO `program_kind` VALUES (1,'основная');
INSERT INTO `program_kind` VALUES (2,'второе образование');
