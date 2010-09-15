
--
-- ���������� ����� ����������� � �������������� ���������
-- ������ �����
--

-- Setting speciality 151003 for group ��2-42 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-23 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 160402 for group ��2-101 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-43 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group ��2-102 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��9-61 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��2-41 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-101 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-21 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-103 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group ��8-121 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-102 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��1-22 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150502 for group ��13-41 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-122 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-101 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-121 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-61 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200402 for group ���2-21 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-121 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230100 for group ��7-102 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150204 for group ��5-122 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-62 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��3-122 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-103 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200401 for group ��2-61 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-61 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-81 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-21 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-62 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200401 for group ���1-82 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��11-121 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-81 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-22 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-41 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��11-21 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150206 for group ��12-61 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-42 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 140402 for group �6-81 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-81 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-43 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 200503 for group ��4-81 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-82 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group ��5-101 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group ���4-61 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-81 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group ���4-101 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-102 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group ��3-41 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��1-121 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-82 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���1-41 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���6-101 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-101 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-61 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-41 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-61 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-102 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-101 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-62 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-42 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group �1-21 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-62 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-103 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group ��6-102 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160302 for group �1-22 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��2-121 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-63 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 170102 for group ��6-103 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group ��2-122 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��9-81 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��2-61 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-121 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-41 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-123 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210107 for group ��11-122 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��1-42 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150502 for group ��13-61 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-81 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200402 for group ���2-41 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-121 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-82 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150501 for group ��8-101 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230100 for group ��7-122 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group ��8-102 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-123 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200401 for group ��2-81 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-81 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150207 for group ��13-21 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���4-21 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��6-101 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-21 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-82 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��10-21 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-41 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-22 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��10-22 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150204 for group ��5-42 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-61 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-62 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150206 for group ��12-81 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-63 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group ��11-41 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-21 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-22 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210202 for group ��4-23 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 190202 for group ��9-101 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-24 (from line 88)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 150301 for group ��5-121 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-102 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group ��3-61 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-103 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group ��8-21 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-21 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160801 for group ���4-81 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group ���4-121 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-122 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group �7-21 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-22 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-22 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140305 for group �7-22 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-23 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151001 for group ��3-21 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���1-61 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���6-121 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-121 (from line 129)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 170102 for group ��6-121 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-81 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-61 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-81 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-122 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151003 for group ��2-82 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-62 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160302 for group �1-41 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-101 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-82 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-123 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group ��6-122 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-63 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160302 for group �1-42 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151003 for group ��2-102 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-83 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 230102 for group ��5-101 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170102 for group ��6-123 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210201 for group ��2-81 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-102 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��1-61 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150502 for group ��13-81 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230100 for group ��5-103 (from line 92)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200402 for group ���2-61 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-62 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230100 for group ��5-104 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150501 for group ��8-121 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-21 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��6-121 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-122 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��2-101 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-22 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group ��13-41 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���4-41 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-61 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-41 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��2-21 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-41 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-23 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150204 for group ��5-62 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��9-42 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��10-42 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 010200 for group ��2-101 (from line 26)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '010200'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-81 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-101 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-102 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-82 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200401 for group ���1-102 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210201 for group ��6-21 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-41 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-83 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group ��11-61 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��4-21 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-42 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210202 for group ��4-43 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 190202 for group ��9-121 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-101 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-122 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���2-21 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��3-81 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-41 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-123 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160803 for group ��8-41 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-41 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-101 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-42 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160803 for group ��8-42 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-42 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group ��8-102 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140501 for group �2-101 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-43 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 090105 for group ��8-103 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140501 for group �2-102 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-41 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-21 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-21 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���1-81 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-22 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-81 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-82 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160302 for group �1-61 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-121 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-101 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-83 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 160302 for group �1-62 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151003 for group ��2-122 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-121 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-102 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-122 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��1-81 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-123 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200402 for group ���2-81 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-82 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group ��5-124 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 220402 for group ��10-101 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-41 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-102 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090105 for group ��8-42 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group ��13-61 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-101 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���4-61 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��2-122 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150204 for group ��5-81 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150404 for group ��10-21 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-61 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��2-41 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-61 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-121 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-82 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group ��10-22 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��9-62 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��10-62 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230401 for group ��2-122 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 200401 for group ���1-121 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150801 for group �5-101 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-122 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210201 for group ��6-41 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-61 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group �5-102 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��7-101 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��11-81 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��4-41 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-62 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��7-102 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210202 for group ��4-63 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group ��7-103 (from line 63)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 220402 for group ��7-104 (from line 64)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 151001 for group ��3-121 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���2-41 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-121 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-61 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-61 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-61 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-122 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group �7-62 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-21 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-62 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-62 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-22 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group �2-121 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-63 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 140501 for group �2-122 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-61 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-41 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-41 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-42 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group �1-81 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-121 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group �1-82 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140305 for group �7-122 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group �7-123 (from line 138)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group ���5-21 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���1-101 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-21 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-121 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-22 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 090105 for group ��8-61 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-122 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-101 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-121 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-62 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150207 for group ��13-81 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-102 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-21 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���4-81 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��5-101 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��2-61 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-81 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-22 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150404 for group ��10-41 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-81 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��10-82 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-23 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150404 for group ��10-42 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��9-82 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group ��5-24 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 210201 for group ��6-61 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-81 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150801 for group �5-121 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��4-61 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-101 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-21 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-82 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190202 for group ��9-21 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150801 for group �5-122 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��7-121 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-21 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-21 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-102 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160303 for group �8-22 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 190202 for group ��9-22 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-101 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-122 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150201 for group ��6-22 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160802 for group ��1-21 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-83 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group ��1-102 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-101 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-102 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-102 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��6-103 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 080507 for group ���2-61 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-103 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group ��2-81 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-81 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-81 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-82 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140400 for group ��4-21 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140305 for group �7-82 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = '�'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-41 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-21 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-82 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-83 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220203 for group ��5-42 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group ��4-22 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-81 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-61 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-61 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-62 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200402 for group ���2-101 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-63 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 200402 for group ���2-102 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 080502 for group ���5-41 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-21 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-101 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-21 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���1-121 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-41 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-22 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160703 for group ��3-22 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-121 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-42 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group ��8-81 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-122 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090105 for group ��8-82 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��9-101 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-41 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ��8-83 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group ��9-102 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��5-21 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��2-81 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-42 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150404 for group ��10-61 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group �3-101 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-43 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group ��1-101 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group ��10-62 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-102 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230100 for group ��5-44 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 4;


-- Setting speciality 160402 for group ��1-102 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-103 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 210201 for group ��6-81 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���3-21 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-103 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group ��5-125 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 5;


-- Setting speciality 160403 for group ��4-81 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-41 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-121 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-41 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-41 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-41 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-101 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-42 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-122 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160303 for group �8-42 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190202 for group ��9-42 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-121 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��1-41 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-102 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-121 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-121 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-122 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-122 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��6-122 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-123 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 150202 for group ���6-21 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-123 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230201 for group ��3-21 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���2-81 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140400 for group ��4-41 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230100 for group ��6-124 (from line 97)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 230201 for group ��3-22 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-61 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-41 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-62 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group ��4-42 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��2-81 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-21 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group ���5-81 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-22 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��2-82 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-23 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200402 for group ���2-121 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��2-83 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group ��1-24 (from line 109)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 200402 for group ���2-122 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080502 for group ���5-61 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-121 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-41 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���5-62 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150802 for group �10-101 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-21 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-41 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-42 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150802 for group �10-102 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150802 for group �10-61 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-22 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group �2-42 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230401 for group ��3-101 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-62 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���4-101 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-121 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-61 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-101 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��5-41 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��9-122 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-121 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-62 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170103 for group ��4-102 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150404 for group ��10-81 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140503 for group �3-122 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-63 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 151002 for group ��1-101 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-103 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group ��1-121 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-21 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150404 for group ��10-82 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-123 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230100 for group ��5-64 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 4;


-- Setting speciality 151002 for group ��1-102 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��1-122 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���3-41 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-123 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group ��3-61 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-121 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-61 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-61 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-61 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-62 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150201 for group ��6-62 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-21 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-62 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-21 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-101 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-62 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160802 for group ��1-61 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-21 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-122 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-22 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-22 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150201 for group ��6-102 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-22 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-23 (from line 7)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150202 for group ���6-41 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-41 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140400 for group ��4-61 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-42 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group ��4-61 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-81 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-62 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��12-101 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-82 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-83 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group ��1-41 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-42 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-43 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230101 for group ��6-21 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���5-81 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-121 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-61 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-61 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-22 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 080502 for group ���5-82 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150802 for group �10-122 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230401 for group ��2-41 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-62 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160703 for group ��3-62 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��6-23 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150802 for group �10-81 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-42 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���4-121 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150202 for group ���6-101 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group �10-82 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = '�'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-81 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-121 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��5-61 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��3-123 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 090107 for group ��1-21 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-21 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-21 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-21 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230102 for group ��5-82 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170103 for group ��4-122 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��1-22 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-22 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 280201 for group �9-22 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230102 for group ��5-83 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 170103 for group ��4-123 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160801 for group ��2-21 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-101 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group �6-101 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group ��1-121 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-141 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 14
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-41 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-23 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 230100 for group ��5-84 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 4;


-- Setting speciality 151002 for group ��1-122 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150206 for group ��12-101 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���3-61 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-81 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-81 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-81 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-21 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-81 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��1-81 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-21 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190202 for group ��9-82 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-41 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-82 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150201 for group ��6-82 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210107 for group ��11-22 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-41 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group �8-82 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = '�'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-41 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150201 for group ��6-121 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-22 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-42 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-42 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-42 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150201 for group ��6-122 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��9-121 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-61 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group ���6-61 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-62 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group ��4-81 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��12-121 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-82 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-61 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group �3-21 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-21 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-62 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-22 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170103 for group ��4-22 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151002 for group ��1-21 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-101 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group ��1-22 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-21 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-61 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���2-101 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-41 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��2-101 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-62 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��12-21 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-81 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���2-102 (from line 41)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160703 for group ��3-81 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-42 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group ���6-121 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group �2-82 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = '�'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160703 for group ��3-82 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��6-43 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 080502 for group ���6-21 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��5-81 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 090107 for group ��1-41 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-41 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-41 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-41 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-42 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-42 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 280201 for group �9-42 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��2-41 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-61 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-43 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230201 for group ��3-121 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group �6-121 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200503 for group ��4-101 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230201 for group ��3-122 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���3-81 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group ��12-121 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-101 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-41 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-102 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group ��6-61 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-41 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-61 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-42 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-61 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-103 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group ��6-62 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150301 for group ��5-42 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-62 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-62 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230201 for group ��3-81 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-101 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-104 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150202 for group ���6-81 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-102 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230201 for group ��3-82 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��4-101 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���5-101 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���5-102 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-101 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-81 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-102 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-41 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-41 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-82 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group ��5-103 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140503 for group �3-42 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170103 for group ��4-42 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151002 for group ��1-41 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-121 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group ��1-42 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��3-101 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-61 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-41 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-101 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-81 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���2-121 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-62 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-102 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160802 for group ��2-121 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��2-82 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��12-41 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-103 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group ��3-21 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-21 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-63 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160403 for group ��1-101 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���6-41 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-102 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090107 for group ��1-61 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-61 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-61 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group ��2-101 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-61 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-21 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-103 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200503 for group ��4-21 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-62 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-62 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150502 for group ��13-101 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group ��10-101 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group �6-21 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-62 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��2-61 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-22 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-81 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-63 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 150404 for group ��10-102 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 200503 for group ��4-121 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-121 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-101 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-122 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 280201 for group �9-102 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 190201 for group ��10-21 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-61 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group �5-81 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��2-123 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group ��6-81 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group ��5-61 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group ��3-81 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-22 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210107 for group ��11-62 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group �5-82 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = '�'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group ��2-124 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 170102 for group ��6-82 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group ��5-62 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151001 for group ��3-82 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190201 for group ��10-121 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-122 (from line 72)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 190201 for group ��10-123 (from line 73)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group ���5-121 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-121 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���5-122 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��9-21 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-122 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group ��4-124 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 151002 for group ��1-61 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group ��5-123 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 140503 for group �3-61 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-101 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-61 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-101 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group ��1-62 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-62 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group ��4-102 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-21 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-62 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 210202 for group ��4-102 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-22 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group ��13-101 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-103 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group ��6-81 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-121 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group ��1-61 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-82 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-121 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ��2-21 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-21 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ��6-83 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group ��7-122 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group ��8-22 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��12-61 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-123 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group ��3-41 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-41 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-121 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���6-61 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-81 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-122 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090107 for group ��1-81 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-81 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150202 for group ��7-81 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group ��12-21 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150502 for group ��13-121 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ��2-121 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��2-81 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-82 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group ��7-41 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ��1-123 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200503 for group ��4-41 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ��1-82 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group ��7-82 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group ��10-121 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group �6-41 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-42 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group ��1-83 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group ��7-83 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150404 for group ��10-122 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210107 for group ��11-81 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-121 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group �9-122 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = '�'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group ���4-21 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-41 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��2-101 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group ��11-82 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group ��5-81 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-42 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150301 for group ��5-82 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���3-101 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group �1-101 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-101 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group �1-102 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-21 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-102 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-22 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151003 for group ��2-21 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group �4-23 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151003 for group ��2-22 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230101 for group ��9-41 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = '��'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��2-21 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-121 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160803 for group ��8-101 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-121 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group ��1-81 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150502 for group ��13-21 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140503 for group �3-81 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group ��4-122 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160803 for group ��8-102 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170103 for group ��4-81 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210202 for group ��4-122 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151002 for group ��1-82 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group �3-82 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = '�'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150204 for group ��5-101 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group ��1-41 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group ��4-82 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210202 for group ��4-123 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group ��3-101 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group ��5-102 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = '��'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��1-42 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group ��13-121 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = '��'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-102 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210304 for group ��1-81 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group ��2-41 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-41 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group ��8-42 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = '��'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group ��12-81 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-61 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��11-101 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ��3-61 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group ���1-62 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230105 for group ��7-21 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group ���6-81 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = '���'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group ��12-41 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = '��'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-22 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140402 for group �6-61 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = '�'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-61 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ��7-23 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200503 for group ��4-61 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = '��'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group ��7-62 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = '��'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group ���4-41 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = '���'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-61 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group ��2-121 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group ��3-21 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group ��1-101 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = '��'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190201 for group ��10-62 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = '��'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group ���3-121 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group �1-121 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-121 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group ���1-21 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = '���'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151003 for group ��2-41 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = '��'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230104 for group ��6-21 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group �1-122 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = '�'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-41 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group ��3-122 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = '��'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group ��6-22 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = '��'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140401 for group �4-42 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = '�'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;

