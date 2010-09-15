DROP TABLE IF EXISTS `citizenship`;
CREATE TABLE `citizenship` (
  `citizenship_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `code` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`citizenship_id`)
) TYPE=MyISAM;

INSERT INTO `citizenship` VALUES (1, 'гражданин РФ', '02 1');
INSERT INTO `citizenship` VALUES (2, 'гражданин РФ и иностранного государства (двойное гражданство)', '02 2');
INSERT INTO `citizenship` VALUES (3, 'гражданин Республики Беларусь', '');
INSERT INTO `citizenship` VALUES (4, 'иностранный гражданин, постоянно проживающий на территории РФ', '02 3');
INSERT INTO `citizenship` VALUES (5, 'иностранный гражданин, временно проживающий на территории РФ', '02 3');
INSERT INTO `citizenship` VALUES (6, 'лицо без гражданства, постоянно проживающее на территории РФ', '02 4');
INSERT INTO `citizenship` VALUES (7, 'лицо без гражданства, временно проживающее на территории РФ', '02 4');
