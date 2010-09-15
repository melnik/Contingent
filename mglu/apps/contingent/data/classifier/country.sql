DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL auto_increment,
  `code` char(3) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`country_id`)
) TYPE=MyISAM;

INSERT INTO `country` VALUES (1, '036', '���������');
INSERT INTO `country` VALUES (2, '040', '�������');
INSERT INTO `country` VALUES (3, '031', '�����������');
INSERT INTO `country` VALUES (4, '008', '�������');
INSERT INTO `country` VALUES (5, '012', '�����');
INSERT INTO `country` VALUES (6, '024', '������');
INSERT INTO `country` VALUES (7, '020', '�������');
INSERT INTO `country` VALUES (8, '028', '������� � ��������');
INSERT INTO `country` VALUES (9, '530', '���������� �-��');
INSERT INTO `country` VALUES (10, '032', '���������');
INSERT INTO `country` VALUES (11, '051', '�������');
INSERT INTO `country` VALUES (12, '533', '�����');
INSERT INTO `country` VALUES (13, '004', '����������');
INSERT INTO `country` VALUES (14, '044', '������');
INSERT INTO `country` VALUES (15, '050', '���������');
INSERT INTO `country` VALUES (16, '052', '��������');
INSERT INTO `country` VALUES (17, '048', '�������');
INSERT INTO `country` VALUES (18, '112', '��������');
INSERT INTO `country` VALUES (19, '084', '�����');
INSERT INTO `country` VALUES (20, '056', '�������');
INSERT INTO `country` VALUES (21, '204', '�����');
INSERT INTO `country` VALUES (22, '060', '���������� �-��');
INSERT INTO `country` VALUES (23, '100', '��������');
INSERT INTO `country` VALUES (24, '088', '�������');
INSERT INTO `country` VALUES (25, '070', '������ � �����������');
INSERT INTO `country` VALUES (26, '072', '��������');
INSERT INTO `country` VALUES (27, '076', '��������');
INSERT INTO `country` VALUES (28, '096', '������');
INSERT INTO `country` VALUES (29, '854', '�������-����');
INSERT INTO `country` VALUES (30, '108', '�������');
INSERT INTO `country` VALUES (31, '064', '�����');
INSERT INTO `country` VALUES (32, '548', '��������');
INSERT INTO `country` VALUES (33, '826', '��������������');
INSERT INTO `country` VALUES (34, '862', '���������');
INSERT INTO `country` VALUES (35, '704', '�������');
INSERT INTO `country` VALUES (36, '348', '�������');
INSERT INTO `country` VALUES (37, '092', '����������� �-�� (����.)');
INSERT INTO `country` VALUES (38, '850', '����������� �-�� (���)');
INSERT INTO `country` VALUES (39, '266', '�����');
INSERT INTO `country` VALUES (40, '332', '�����');
INSERT INTO `country` VALUES (41, '328', '������');
INSERT INTO `country` VALUES (42, '270', '������');
INSERT INTO `country` VALUES (43, '288', '����');
INSERT INTO `country` VALUES (44, '312', '���������');
INSERT INTO `country` VALUES (45, '320', '���������');
INSERT INTO `country` VALUES (46, '324', '������');
INSERT INTO `country` VALUES (47, '624', '������-�����');
INSERT INTO `country` VALUES (48, '226', '������ ��������������');
INSERT INTO `country` VALUES (49, '276', '��������');
INSERT INTO `country` VALUES (50, '292', '���������');
INSERT INTO `country` VALUES (51, '340', '��������');
INSERT INTO `country` VALUES (52, '344', '�������');
INSERT INTO `country` VALUES (53, '308', '�������');
INSERT INTO `country` VALUES (54, '304', '����������');
INSERT INTO `country` VALUES (55, '300', '������');
INSERT INTO `country` VALUES (56, '268', '������');
INSERT INTO `country` VALUES (57, '208', '�����');
INSERT INTO `country` VALUES (58, '212', '��������');
INSERT INTO `country` VALUES (59, '214', '������������� ����������');
INSERT INTO `country` VALUES (60, '262', '�������');
INSERT INTO `country` VALUES (61, '818', '������');
INSERT INTO `country` VALUES (62, '180', '����');
INSERT INTO `country` VALUES (63, '894', '������');
INSERT INTO `country` VALUES (64, '732', '�������� ������');
INSERT INTO `country` VALUES (65, '716', '��������');
INSERT INTO `country` VALUES (66, '376', '�������');
INSERT INTO `country` VALUES (67, '356', '�����');
INSERT INTO `country` VALUES (68, '360', '���������');
INSERT INTO `country` VALUES (69, '400', '��������');
INSERT INTO `country` VALUES (70, '364', '����');
INSERT INTO `country` VALUES (71, '368', '����');
INSERT INTO `country` VALUES (72, '372', '��������');
INSERT INTO `country` VALUES (73, '352', '��������');
INSERT INTO `country` VALUES (74, '724', '�������');
INSERT INTO `country` VALUES (75, '380', '������');
INSERT INTO `country` VALUES (76, '887', '�����');
INSERT INTO `country` VALUES (77, '132', '����-�����');
INSERT INTO `country` VALUES (78, '398', '���������');
INSERT INTO `country` VALUES (79, '136', '��������� �-��');
INSERT INTO `country` VALUES (80, '116', '��������');
INSERT INTO `country` VALUES (81, '120', '�������');
INSERT INTO `country` VALUES (82, '124', '������');
INSERT INTO `country` VALUES (83, '634', '�����');
INSERT INTO `country` VALUES (84, '404', '�����');
INSERT INTO `country` VALUES (85, '196', '����');
INSERT INTO `country` VALUES (86, '296', '��������');
INSERT INTO `country` VALUES (87, '156', '�����');
INSERT INTO `country` VALUES (88, '170', '��������');
INSERT INTO `country` VALUES (89, '174', '��������� �-��');
INSERT INTO `country` VALUES (90, '178', '�����');
INSERT INTO `country` VALUES (91, '408', '��������� �������-��������������� ����������');
INSERT INTO `country` VALUES (92, '384', '���-�'' �����');
INSERT INTO `country` VALUES (93, '410', '�����, ����������');
INSERT INTO `country` VALUES (94, '188', '����� ����');
INSERT INTO `country` VALUES (95, '192', '����');
INSERT INTO `country` VALUES (96, '414', '������');
INSERT INTO `country` VALUES (97, '184', '���� �-��');
INSERT INTO `country` VALUES (98, '417', '����������');
INSERT INTO `country` VALUES (99, '418', '����');
INSERT INTO `country` VALUES (100, '428', '������');
INSERT INTO `country` VALUES (101, '426', '������');
INSERT INTO `country` VALUES (102, '430', '�������');
INSERT INTO `country` VALUES (103, '434', '�����');
INSERT INTO `country` VALUES (104, '440', '�����');
INSERT INTO `country` VALUES (105, '438', '�����������');
INSERT INTO `country` VALUES (106, '442', '����������');
INSERT INTO `country` VALUES (107, '480', '��������');
INSERT INTO `country` VALUES (108, '478', '����������');
INSERT INTO `country` VALUES (109, '450', '����������');
INSERT INTO `country` VALUES (110, '807', '���������');
INSERT INTO `country` VALUES (111, '454', '������');
INSERT INTO `country` VALUES (112, '458', '��������');
INSERT INTO `country` VALUES (113, '466', '����');
INSERT INTO `country` VALUES (114, '462', '����������� �-��');
INSERT INTO `country` VALUES (115, '470', '������');
INSERT INTO `country` VALUES (116, '504', '�������');
INSERT INTO `country` VALUES (117, '474', '���������');
INSERT INTO `country` VALUES (118, '584', '��������');
INSERT INTO `country` VALUES (119, '446', '�����');
INSERT INTO `country` VALUES (120, '484', '�������');
INSERT INTO `country` VALUES (121, '583', '����������');
INSERT INTO `country` VALUES (122, '508', '��������');
INSERT INTO `country` VALUES (123, '498', '�������');
INSERT INTO `country` VALUES (124, '492', '������');
INSERT INTO `country` VALUES (125, '496', '��������');
INSERT INTO `country` VALUES (126, '104', '������');
INSERT INTO `country` VALUES (127, '516', '�������');
INSERT INTO `country` VALUES (128, '520', '�����');
INSERT INTO `country` VALUES (129, '524', '�����');
INSERT INTO `country` VALUES (130, '562', '�����');
INSERT INTO `country` VALUES (131, '566', '�������');
INSERT INTO `country` VALUES (132, '528', '����������');
INSERT INTO `country` VALUES (133, '558', '���������');
INSERT INTO `country` VALUES (134, '554', '����� ��������');
INSERT INTO `country` VALUES (135, '540', '����� ���������');
INSERT INTO `country` VALUES (136, '578', '��������');
INSERT INTO `country` VALUES (137, '574', '����������� �-��');
INSERT INTO `country` VALUES (138, '784', '������������ �������� �������');
INSERT INTO `country` VALUES (139, '512', '����');
INSERT INTO `country` VALUES (140, '586', '��������');
INSERT INTO `country` VALUES (141, '274', '���������');
INSERT INTO `country` VALUES (142, '591', '������');
INSERT INTO `country` VALUES (143, '598', '�����-����� ������');
INSERT INTO `country` VALUES (144, '600', '��������');
INSERT INTO `country` VALUES (145, '604', '����');
INSERT INTO `country` VALUES (146, '258', '���������');
INSERT INTO `country` VALUES (147, '616', '������');
INSERT INTO `country` VALUES (148, '620', '����������');
INSERT INTO `country` VALUES (149, '630', '������-����');
INSERT INTO `country` VALUES (150, '643', '������');
INSERT INTO `country` VALUES (151, '646', '������');
INSERT INTO `country` VALUES (152, '642', '�������');
INSERT INTO `country` VALUES (153, '222', '���������');
INSERT INTO `country` VALUES (154, '882', '�����');
INSERT INTO `country` VALUES (155, '674', '���-������');
INSERT INTO `country` VALUES (156, '678', '���-���� � ��������');
INSERT INTO `country` VALUES (157, '682', '���������� ������');
INSERT INTO `country` VALUES (158, '748', '���������');
INSERT INTO `country` VALUES (159, '690', '����������� �-��');
INSERT INTO `country` VALUES (160, '686', '�������');
INSERT INTO `country` VALUES (161, '702', '��������');
INSERT INTO `country` VALUES (162, '760', '�����');
INSERT INTO `country` VALUES (163, '703', '��������');
INSERT INTO `country` VALUES (164, '705', '��������');
INSERT INTO `country` VALUES (165, '090', '���������� �-��');
INSERT INTO `country` VALUES (166, '706', '������');
INSERT INTO `country` VALUES (167, '736', '�����');
INSERT INTO `country` VALUES (168, '740', '�������');
INSERT INTO `country` VALUES (169, '840', '���');
INSERT INTO `country` VALUES (170, '694', '������-�����');
INSERT INTO `country` VALUES (171, '762', '�����������');
INSERT INTO `country` VALUES (172, '764', '�������');
INSERT INTO `country` VALUES (173, '834', '��������');
INSERT INTO `country` VALUES (174, '768', '����');
INSERT INTO `country` VALUES (175, '776', '�����');
INSERT INTO `country` VALUES (176, '780', '�������� � ������');
INSERT INTO `country` VALUES (177, '788', '�����');
INSERT INTO `country` VALUES (178, '795', '������������');
INSERT INTO `country` VALUES (179, '792', '������');
INSERT INTO `country` VALUES (180, '800', '������');
INSERT INTO `country` VALUES (181, '860', '����������');
INSERT INTO `country` VALUES (182, '804', '�������');
INSERT INTO `country` VALUES (183, '858', '�������');
INSERT INTO `country` VALUES (184, '242', '�����');
INSERT INTO `country` VALUES (185, '608', '���������');
INSERT INTO `country` VALUES (186, '246', '���������');
INSERT INTO `country` VALUES (187, '238', '������������ �-��');
INSERT INTO `country` VALUES (188, '250', '�������');
INSERT INTO `country` VALUES (189, '346', '��������');
INSERT INTO `country` VALUES (190, '140', '����������-����������� ����������');
INSERT INTO `country` VALUES (191, '148', '���');
INSERT INTO `country` VALUES (192, '203', '�����');
INSERT INTO `country` VALUES (193, '152', '����');
INSERT INTO `country` VALUES (194, '756', '���������');
INSERT INTO `country` VALUES (195, '752', '������');
INSERT INTO `country` VALUES (196, '144', '���-�����');
INSERT INTO `country` VALUES (197, '218', '�������');
INSERT INTO `country` VALUES (198, '232', '�������');
INSERT INTO `country` VALUES (199, '233', '�������');
INSERT INTO `country` VALUES (200, '231', '�������');
INSERT INTO `country` VALUES (201, '710', '���');
INSERT INTO `country` VALUES (202, '891', '���������');
INSERT INTO `country` VALUES (203, '388', '������');
INSERT INTO `country` VALUES (204, '392', '������');