DROP TABLE IF EXISTS `abiturient_medal`;
CREATE TABLE `abiturient_medal` (
  `abiturient_medal_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`abiturient_medal_id`)
) TYPE=MyISAM;

INSERT INTO `abiturient_medal` VALUES (1, 'Серебр. медаль');
INSERT INTO `abiturient_medal` VALUES (2, 'Золотая медаль');
INSERT INTO `abiturient_medal` VALUES (3, 'Диплом с отлич.');
