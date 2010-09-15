DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
	`profession_code` varchar(6) NOT NULL default '',
	`name` varchar(128) NOT NULL default '',
	PRIMARY KEY (`profession_code`)
) TYPE=MyISAM;

--
-- ������������� ���������� ��������������� ������������
--

INSERT INTO `profession` VALUES ('030501', '�������������');
INSERT INTO `profession` VALUES ('080502', '��������� � ���������� �� ����������� (�� ��������)');
INSERT INTO `profession` VALUES ('080506', '���������');
INSERT INTO `profession` VALUES ('080507', '���������� �����������');
INSERT INTO `profession` VALUES ('090105', '����������� ����������� �������������� ������������ ������������������ ������');
INSERT INTO `profession` VALUES ('140202', '�������������� � �������������� ��������� �������');
INSERT INTO `profession` VALUES ('140305', '������� �������� � �������������� ���������');
INSERT INTO `profession` VALUES ('140401', '������� � ������ ������ ����������');
INSERT INTO `profession` VALUES ('140402', '�����������');
INSERT INTO `profession` VALUES ('140501', '��������� ����������� ��������');
INSERT INTO `profession` VALUES ('140503', '�������������, ������������� ��������� � ���������');
INSERT INTO `profession` VALUES ('140504', '�����������, ���������� ������� � �����������������');
INSERT INTO `profession` VALUES ('140505', '���������� �������������� ���������');
INSERT INTO `profession` VALUES ('150201', '������ � ���������� ��������� �������� ���������');
INSERT INTO `profession` VALUES ('150202', '������������ � ���������� ���������� ������������');
INSERT INTO `profession` VALUES ('150204', '������ � ���������� ��������� ������������');
INSERT INTO `profession` VALUES ('150206', '������ � ���������� ����������������� ��������� ��������� ����������');
INSERT INTO `profession` VALUES ('150207', '��������� ������� � �������� ������������� ������������ � ��������������');
INSERT INTO `profession` VALUES ('150301', '�������� � ��������� �����');
INSERT INTO `profession` VALUES ('150401', '�������������� ����������� � ��������������� ����������');
INSERT INTO `profession` VALUES ('150404', '���������������� ������ � ������������');
INSERT INTO `profession` VALUES ('150501', '���������������� � ��������������');
INSERT INTO `profession` VALUES ('150502', '��������������� � ������������ ������� �� �������������� ����������');
INSERT INTO `profession` VALUES ('150801', '��������� � ������������� ������� ���������� ���������');
INSERT INTO `profession` VALUES ('150802', '�������������� ������, ������������ � ���������������������');
INSERT INTO `profession` VALUES ('151001', '���������� ��������������');
INSERT INTO `profession` VALUES ('151002', '�������������� ������ � ���������');
INSERT INTO `profession` VALUES ('151003', '���������������� ������� ������������������ �����������');
INSERT INTO `profession` VALUES ('160302', '�������� ���������');
INSERT INTO `profession` VALUES ('160303', '��������������� ��������� � �������������� ���������');
INSERT INTO `profession` VALUES ('160402', '������� � ������� ����������, ������������ � ���������');
INSERT INTO `profession` VALUES ('160403', '������� ���������� ������������ ����������');
INSERT INTO `profession` VALUES ('160703', '�������� ������ � ���������� ��������� ����������� ���������');
INSERT INTO `profession` VALUES ('160801', '��������������');
INSERT INTO `profession` VALUES ('160802', '����������� ����������� �������� � ��������� �����');
INSERT INTO `profession` VALUES ('160803', '��������� � ����������� ��������� ����� � ����������� ���������');
INSERT INTO `profession` VALUES ('160804', '������� ���������������� � ������ �������-����������� ���������');
INSERT INTO `profession` VALUES ('170102', '���������-��������, �������������� � �������� ������');
INSERT INTO `profession` VALUES ('170103', '�������� ��������� � ����������');
INSERT INTO `profession` VALUES ('190201', '����������- � ����������������');
INSERT INTO `profession` VALUES ('190202', '������������ ���������� � �������� ������');
INSERT INTO `profession` VALUES ('190205', '��������-������������, ������������, �������� ������ � ������������');
INSERT INTO `profession` VALUES ('200201', '�������� ������� � �������� ����������');
INSERT INTO `profession` VALUES ('200203', '������-����������� ������� � �������');
INSERT INTO `profession` VALUES ('200402', '���������� ���� � ������-������������� ��������');
INSERT INTO `profession` VALUES ('200501', '���������� � ��������������� �����������');
INSERT INTO `profession` VALUES ('200503', '�������������� � ������������');
INSERT INTO `profession` VALUES ('210107', '����������� ��������������');
INSERT INTO `profession` VALUES ('210201', '�������������� � ���������� ���������������� �������');
INSERT INTO `profession` VALUES ('210202', '�������������� � ���������� ����������-�������������� �������');
INSERT INTO `profession` VALUES ('210304', '���������������� �������');
INSERT INTO `profession` VALUES ('210402', '������ � ����������������� �������');
INSERT INTO `profession` VALUES ('220203', '���������� �������������� � ����������� �������');
INSERT INTO `profession` VALUES ('220301', '������������� ��������������� ��������� � ����������� (�� ��������)');
INSERT INTO `profession` VALUES ('220401', '�����������');
INSERT INTO `profession` VALUES ('220402', '������ � ����������������� �������');
INSERT INTO `profession` VALUES ('230101', '�������������� ������, ���������, ������� � ����');
INSERT INTO `profession` VALUES ('230102', '������������������ ������� ��������� ���������� � ����������');
INSERT INTO `profession` VALUES ('230104', '������� ������������������� ��������������');
INSERT INTO `profession` VALUES ('230105', '����������� ����������� �������������� ������� � ������������������ ������');
INSERT INTO `profession` VALUES ('230201', '�������������� ������� � ����������');
INSERT INTO `profession` VALUES ('230401', '���������� ����������');
INSERT INTO `profession` VALUES ('280101', '������������ ����������������� � ���������� ��������');
INSERT INTO `profession` VALUES ('280201', '������ ���������� ����� � ������������ ������������� ��������� ��������');

--
-- ����������� ���������� ���������� � ���������
--

INSERT INTO `profession` VALUES ('010200', '����������, ���������� ����������');
INSERT INTO `profession` VALUES ('080500', '����������');
INSERT INTO `profession` VALUES ('140200', '�����������������');
INSERT INTO `profession` VALUES ('140300', '������� ������ � ����������');
INSERT INTO `profession` VALUES ('140400', '����������� ������');
INSERT INTO `profession` VALUES ('140500', '��������������������');
INSERT INTO `profession` VALUES ('150200', '������������������ ���������� � ������������');
INSERT INTO `profession` VALUES ('150300', '���������� ��������');
INSERT INTO `profession` VALUES ('150400', '��������������� ������ � ������������');
INSERT INTO `profession` VALUES ('150600', '����������������, ���������� ���������� � ��������');
INSERT INTO `profession` VALUES ('150800', '��������������, ��������� � ������������� �������');
INSERT INTO `profession` VALUES ('150900', '����������, ������������ � ������������� ������������������ �����������');
INSERT INTO `profession` VALUES ('151000', '��������������-��������������� ����������� ������������������ �����������');
INSERT INTO `profession` VALUES ('160100', '����- � ��������������');
INSERT INTO `profession` VALUES ('160300', '��������� ����������� ���������');
INSERT INTO `profession` VALUES ('160400', '������� ���������� ��������� � ���������');
INSERT INTO `profession` VALUES ('160700', '����������������� � �������� ������');
INSERT INTO `profession` VALUES ('160800', '�������������� � ������������');
INSERT INTO `profession` VALUES ('170100', '������ � ������� ����������');
INSERT INTO `profession` VALUES ('190100', '�������� ������������ �������');
INSERT INTO `profession` VALUES ('190200', '������������ ������ � �����������-��������������� ���������');
INSERT INTO `profession` VALUES ('200200', '�����������');
INSERT INTO `profession` VALUES ('200300', '�������������� ���������');
INSERT INTO `profession` VALUES ('200400', '�������������� �������');
INSERT INTO `profession` VALUES ('200500', '����������, �������������� � ������������');
INSERT INTO `profession` VALUES ('210100', '����������� � ����������������');
INSERT INTO `profession` VALUES ('210200', '�������������� � ���������� ����������� �������');
INSERT INTO `profession` VALUES ('210300', '������������');
INSERT INTO `profession` VALUES ('220200', '������������� � ����������');
INSERT INTO `profession` VALUES ('220300', '������������������ ���������� � ������������');
INSERT INTO `profession` VALUES ('220400', '����������� � �������������');
INSERT INTO `profession` VALUES ('230100', '����������� � �������������� �������');
INSERT INTO `profession` VALUES ('230200', '�������������� �������');
INSERT INTO `profession` VALUES ('230400', '���������� ����������');
INSERT INTO `profession` VALUES ('280100', '������������ �����������������');
INSERT INTO `profession` VALUES ('280200', '������ ���������� �����');
