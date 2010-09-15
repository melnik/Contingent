DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(11) PRIMARY KEY auto_increment,
  `name` varchar(200) default NULL
);

INSERT INTO `scholarship` VALUES
    (1, '��������������� ������������� ���������'),
    (2, '���������� ��������������� ������������� ���������'),
    
    (3, '��������� ����� �. ������'),
    (4, '��������� ������� ������ ���� ��. �. �. �������'),
    (5, '��������� ������� ������ ����������'),
    (6, '������� ��������� �. �. ����������')
;

ALTER TABLE `student` ADD COLUMN scholarship_id INT DEFAULT NULL;
