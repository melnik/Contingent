
CREATE TABLE military (
	military_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)
);

INSERT INTO military (military_id, name) VALUES
	(1, '1-� ���'),
	(2, '2-� ���'),
	(3, '3-� ���'),
	(4, '���������'),
	(5, '�������� ���������');

ALTER TABLE student CHANGE military_year military_id INT NULL;

UPDATE student SET military_id = 4 WHERE military_id = -2;
UPDATE student SET military_id = 5 WHERE military_id = -1;
UPDATE student SET military_id = NULL WHERE military_id = 0;


