DROP TABLE IF EXISTS `identity_document_type`;
CREATE TABLE `identity_document_type` (
  `identity_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`identity_document_type_id`)
) TYPE=MyISAM;

INSERT INTO `identity_document_type` VALUES (1, 'паспорт гражданина РФ');
INSERT INTO `identity_document_type` VALUES (2, 'заграничный паспорт');
INSERT INTO `identity_document_type` VALUES (3, 'удостоверение личности');
INSERT INTO `identity_document_type` VALUES (4, 'военный билет');
INSERT INTO `identity_document_type` VALUES (6, 'паспорт иностранного гражданина');
INSERT INTO `identity_document_type` VALUES (5, 'паспорт, удостоверяющий личность гражданина РФ за пределами РФ');
