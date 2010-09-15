DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`scholarship_id`)
) TYPE=MyISAM;

INSERT INTO `scholarship` VALUES (1, 'государственная академическая стипендия');
INSERT INTO `scholarship` VALUES (2, 'повышенная государственная академическая стипендия');
INSERT INTO `scholarship` VALUES (3, 'стипендия Мэрии г. Москвы');
INSERT INTO `scholarship` VALUES (4, 'стипендия Ученого Совета МГТУ им. Н. Э. Баумана');
INSERT INTO `scholarship` VALUES (5, 'стипендия Ученого Совета факультета');
INSERT INTO `scholarship` VALUES (6, 'именная стипендия Л. А. Чижевского');
INSERT INTO `scholarship` VALUES (7, 'государственная академическая стипендия для студентов 1 курса 1 семестра');
INSERT INTO `scholarship` VALUES (8, 'стипендия Президента Российской Федерации');
INSERT INTO `scholarship` VALUES (9, 'специальная государственная стипендия Правительства Российской Федерации');
INSERT INTO `scholarship` VALUES (10, 'государственная социальная стипендия');
INSERT INTO `scholarship` VALUES (11, 'государственная стипендия для аспирантов');
INSERT INTO `scholarship` VALUES (12, 'государственная стипендия для докторантов');
INSERT INTO `scholarship` VALUES (13, 'гранты Мэрии г. Москвы');
