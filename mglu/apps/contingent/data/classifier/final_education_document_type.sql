DROP TABLE IF EXISTS `final_education_document_type`;
CREATE TABLE `final_education_document_type` (
  `final_education_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`final_education_document_type_id`)
) TYPE=MyISAM;

INSERT INTO `final_education_document_type` VALUES (1, '������ � �������� ������ �����������');
INSERT INTO `final_education_document_type` VALUES (2, '������ � ������ ���������������� �����������');
INSERT INTO `final_education_document_type` VALUES (3, '������������� � �������������� ���������������� �����������');
