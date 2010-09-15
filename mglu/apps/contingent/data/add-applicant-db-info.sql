
DELETE FROM abiturient_category;

DROP TABLE IF EXISTS abiturient_medal;
CREATE TABLE abiturient_medal (
	abiturient_medal_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)
);

DROP TABLE IF EXISTS abiturient_school;
CREATE TABLE abiturient_school (
	abiturient_school_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)
);

ALTER TABLE student_education_basic CHANGE COLUMN category_id abiturient_category_id INT NULL;
ALTER TABLE student_education_basic ADD COLUMN abiturient_medal_id INT NULL;
ALTER TABLE student_education_basic ADD COLUMN abiturient_school_id INT NULL;

ALTER TABLE student_education_basic ADD COLUMN cert_marks TEXT;
ALTER TABLE student_education_basic ADD COLUMN exam_marks TEXT;
