DROP TABLE IF EXISTS `identity_document_type`;
CREATE TABLE `identity_document_type` (
  `identity_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`identity_document_type_id`)
) TYPE=MyISAM;

INSERT INTO `identity_document_type` VALUES (1, '������� ���������� ��');
INSERT INTO `identity_document_type` VALUES (2, '����������� �������');
INSERT INTO `identity_document_type` VALUES (3, '������������� ��������');
INSERT INTO `identity_document_type` VALUES (4, '������� �����');
INSERT INTO `identity_document_type` VALUES (6, '������� ������������ ����������');
INSERT INTO `identity_document_type` VALUES (5, '�������, �������������� �������� ���������� �� �� ��������� ��');
