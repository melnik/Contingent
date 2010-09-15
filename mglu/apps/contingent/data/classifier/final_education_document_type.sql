DROP TABLE IF EXISTS `final_education_document_type`;
CREATE TABLE `final_education_document_type` (
  `final_education_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`final_education_document_type_id`)
) TYPE=MyISAM;

INSERT INTO `final_education_document_type` VALUES (1, 'диплом о неполном высшем образовании');
INSERT INTO `final_education_document_type` VALUES (2, 'диплом о высшем профессиональном образовании');
INSERT INTO `final_education_document_type` VALUES (3, 'удостоверение о послевузовском профессиональном образовании');
