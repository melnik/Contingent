DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL auto_increment,
  `code` varchar(4) default NULL,
  `name` varchar(8) NOT NULL default '',
  PRIMARY KEY  (`gender_id`)
) TYPE=MyISAM;

INSERT INTO `gender` VALUES (1, '01 1', 'мужской');
INSERT INTO `gender` VALUES (2, '01 2', 'женский');
