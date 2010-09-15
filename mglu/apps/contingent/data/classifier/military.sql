DROP TABLE IF EXISTS `military`;
CREATE TABLE `military` (
  `military_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`military_id`)
) TYPE=MyISAM;

INSERT INTO `military` VALUES (0, 'не обучается');
INSERT INTO `military` VALUES (1, '1-й год');
INSERT INTO `military` VALUES (2, '2-й год');
INSERT INTO `military` VALUES (3, '3-й год');
INSERT INTO `military` VALUES (4, 'отстранен');
INSERT INTO `military` VALUES (5, 'временно отстранен');
