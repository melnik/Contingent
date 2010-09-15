DROP TABLE IF EXISTS `study_form`;
CREATE TABLE `study_form` (
  `study_form_id` int(11) NOT NULL auto_increment,
  `code` varchar(5) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`study_form_id`)
) TYPE=MyISAM;

INSERT INTO `study_form` VALUES (1, '33 1', 'очная');
INSERT INTO `study_form` VALUES (2, '33 2', 'очно-заочная (вечернее)');
INSERT INTO `study_form` VALUES (3, '33 3', 'заочная');
INSERT INTO `study_form` VALUES (4, '33 6', 'самообразование');
INSERT INTO `study_form` VALUES (5, '33 4', 'экстернат');
INSERT INTO `study_form` VALUES (6, '', 'посредством дистанционных образовательных технологий');
