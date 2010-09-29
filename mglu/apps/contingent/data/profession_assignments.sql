
--
-- Назначение кодов направлений и специальностей студентам
-- внутри групп
--

-- Setting speciality 151003 for group МТ2-42 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-23 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 160402 for group ИУ2-101 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-43 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group ИУ2-102 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ9-61 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group РТ2-41 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-101 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-21 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-103 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group СМ8-121 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-102 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group ИУ1-22 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150502 for group СМ13-41 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-122 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-101 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-121 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-61 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200402 for group БМТ2-21 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-121 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230100 for group ИУ7-102 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150204 for group МТ5-122 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-62 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ3-122 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-103 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200401 for group ПС2-61 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-61 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-81 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-21 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-62 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200401 for group БМТ1-82 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group СМ11-121 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ3-81 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-22 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-41 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ11-21 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150206 for group МТ12-61 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-42 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 140402 for group Э6-81 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-81 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-43 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 200503 for group МТ4-81 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-82 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group РК5-101 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group РКТ4-61 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-81 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group РКТ4-101 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-102 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group АК3-41 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group АК1-121 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-82 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ1-41 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ6-101 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-101 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-61 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-41 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-61 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-102 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-101 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-62 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-42 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group Э1-21 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-62 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-103 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group СМ6-102 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160302 for group Э1-22 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group ИУ2-121 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-63 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 170102 for group СМ6-103 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group ИУ2-122 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ9-81 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210201 for group РТ2-61 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-121 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-41 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-123 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210107 for group МТ11-122 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group ИУ1-42 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150502 for group СМ13-61 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-81 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200402 for group БМТ2-41 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-121 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-82 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150501 for group МТ8-101 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230100 for group ИУ7-122 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group МТ8-102 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-123 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200401 for group ПС2-81 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-81 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150207 for group МТ13-21 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ4-21 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group РЛ6-101 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-21 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-82 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК10-21 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-41 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-22 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК10-22 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150204 for group МТ5-42 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-61 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-62 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150206 for group МТ12-81 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-63 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group СМ11-41 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-21 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-22 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210202 for group ИУ4-23 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 190202 for group СМ9-101 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-24 (from line 88)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 150301 for group РК5-121 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-102 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group АК3-61 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-103 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group СМ8-21 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-21 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160801 for group РКТ4-81 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group РКТ4-121 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-122 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group Э7-21 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-22 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-22 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140305 for group Э7-22 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-23 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151001 for group РТ3-21 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ1-61 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ6-121 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-121 (from line 129)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 170102 for group СМ6-121 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-81 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-61 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-81 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-122 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151003 for group МТ2-82 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-62 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160302 for group Э1-41 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-101 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-82 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-123 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group СМ6-122 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-63 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160302 for group Э1-42 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151003 for group МТ2-102 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-83 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 230102 for group ИУ5-101 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170102 for group СМ6-123 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210201 for group РТ2-81 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-102 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group ИУ1-61 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150502 for group СМ13-81 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230100 for group ИУ5-103 (from line 92)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200402 for group БМТ2-61 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-62 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230100 for group ИУ5-104 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150501 for group МТ8-121 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-21 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group РЛ6-121 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-122 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group АК2-101 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-22 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group МТ13-41 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ4-41 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-61 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-41 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group СМ2-21 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-41 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-23 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150204 for group МТ5-62 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК9-42 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК10-42 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 010200 for group ФН2-101 (from line 26)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '010200'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-81 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-101 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-102 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-82 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200401 for group БМТ1-102 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210201 for group РЛ6-21 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-41 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-83 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group СМ11-61 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group АК4-21 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-42 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210202 for group ИУ4-43 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 190202 for group СМ9-121 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151001 for group РТ3-101 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-122 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ2-21 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group АК3-81 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-41 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-123 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160803 for group СМ8-41 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-41 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-101 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-42 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160803 for group СМ8-42 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-42 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group ИУ8-102 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140501 for group Э2-101 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-43 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 090105 for group ИУ8-103 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140501 for group Э2-102 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group РТ3-41 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-21 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-21 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ1-81 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-22 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-81 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-82 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160302 for group Э1-61 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-121 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-101 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-83 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 160302 for group Э1-62 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151003 for group МТ2-122 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-121 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-102 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-122 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group ИУ1-81 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-123 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200402 for group БМТ2-81 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-82 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group ИУ5-124 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 220402 for group РК10-101 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-41 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-102 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090105 for group ИУ8-42 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group МТ13-61 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-101 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ4-61 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group АК2-122 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150204 for group МТ5-81 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150404 for group МТ10-21 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-61 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160802 for group СМ2-41 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-61 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-121 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-82 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group МТ10-22 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК9-62 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК10-62 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230401 for group ФН2-122 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 200401 for group БМТ1-121 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150801 for group Э5-101 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-122 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210201 for group РЛ6-41 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-61 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group Э5-102 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220402 for group СМ7-101 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ11-81 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group АК4-41 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-62 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group СМ7-102 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210202 for group ИУ4-63 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group СМ7-103 (from line 63)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 220402 for group СМ7-104 (from line 64)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 151001 for group РТ3-121 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ2-41 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-121 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-61 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-61 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-61 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-122 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group Э7-62 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-21 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-62 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-62 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-22 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group Э2-121 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-63 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 140501 for group Э2-122 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151001 for group РТ3-61 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-41 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-41 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-42 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group Э1-81 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-121 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group Э1-82 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140305 for group Э7-122 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group Э7-123 (from line 138)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group ИБМ5-21 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ1-101 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-21 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-121 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-22 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 090105 for group ИУ8-61 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-122 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-101 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-121 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-62 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150207 for group МТ13-81 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-102 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-21 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ4-81 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group АК5-101 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160802 for group СМ2-61 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-81 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-22 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150404 for group МТ10-41 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-81 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК10-82 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-23 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150404 for group МТ10-42 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК9-82 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group ИУ5-24 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 210201 for group РЛ6-61 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-81 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150801 for group Э5-121 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group АК4-61 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-101 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-21 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-82 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190202 for group СМ9-21 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150801 for group Э5-122 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 220402 for group СМ7-121 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-21 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-21 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-102 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160303 for group Э8-22 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 190202 for group СМ9-22 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group РЛ1-101 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-122 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150201 for group МТ6-22 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160802 for group АК1-21 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-83 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group РЛ1-102 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-101 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-102 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-102 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ6-103 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 080507 for group ИБМ2-61 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-103 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group РЛ2-81 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-81 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-81 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-82 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140400 for group ФН4-21 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140305 for group Э7-82 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'Э'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-41 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-21 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-82 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-83 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220203 for group СМ5-42 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group РК4-22 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group РТ3-81 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-61 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-61 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-62 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200402 for group БМТ2-101 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-63 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 200402 for group БМТ2-102 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 080502 for group ИБМ5-41 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-21 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ2-101 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-21 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ1-121 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-41 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-22 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160703 for group СМ3-22 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-121 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-42 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group ИУ8-81 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-122 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090105 for group ИУ8-82 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group РК9-101 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-41 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group ИУ8-83 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group РК9-102 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group АК5-21 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group СМ2-81 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-42 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150404 for group МТ10-61 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group Э3-101 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-43 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group ПС1-101 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group МТ10-62 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-102 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230100 for group ИУ5-44 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 4;


-- Setting speciality 160402 for group ПС1-102 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-103 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 210201 for group РЛ6-81 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ3-21 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-103 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group АК5-125 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 5;


-- Setting speciality 160403 for group АК4-81 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-41 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-121 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-41 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-41 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-41 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-101 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-42 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-122 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160303 for group Э8-42 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190202 for group СМ9-42 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group РЛ1-121 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160802 for group АК1-41 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-102 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-121 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-121 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-122 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-122 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ6-122 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-123 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 150202 for group РКТ6-21 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-123 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230201 for group ИУ3-21 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ2-81 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140400 for group ФН4-41 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230100 for group ИУ6-124 (from line 97)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 230201 for group ИУ3-22 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-61 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-41 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-62 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group РК4-42 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group ИУ2-81 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-21 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group РКТ5-81 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-22 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group ИУ2-82 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group РЛ1-23 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200402 for group БМТ2-121 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group ИУ2-83 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group РЛ1-24 (from line 109)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 200402 for group БМТ2-122 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080502 for group ИБМ5-61 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ2-121 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-41 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ5-62 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150802 for group Э10-101 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-21 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-41 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-42 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150802 for group Э10-102 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150802 for group Э10-61 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-22 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group Э2-42 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230401 for group АК3-101 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-62 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ4-101 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-121 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-61 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-101 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group АК5-41 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group РК9-122 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'РК'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-121 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-62 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170103 for group СМ4-102 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150404 for group МТ10-81 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140503 for group Э3-122 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-63 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 151002 for group МТ1-101 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-103 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group ПС1-121 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ2-21 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150404 for group МТ10-82 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-123 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230100 for group ИУ5-64 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 4;


-- Setting speciality 151002 for group МТ1-102 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160402 for group ПС1-122 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ3-41 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-123 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group РЛ3-61 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-121 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-61 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-61 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-61 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-62 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150201 for group МТ6-62 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-21 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-62 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-21 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-101 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-62 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160802 for group АК1-61 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-21 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-122 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-22 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-22 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150201 for group МТ6-102 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-22 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-23 (from line 7)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150202 for group РКТ6-41 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-41 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140400 for group ФН4-61 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-42 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group РК4-61 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-81 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-62 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ12-101 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-82 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-83 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group РЛ1-41 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-42 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group РЛ1-43 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230101 for group ИУ6-21 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ5-81 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-121 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-61 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-61 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-22 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 080502 for group ИБМ5-82 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150802 for group Э10-122 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230401 for group ФН2-41 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-62 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160703 for group СМ3-62 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ6-23 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150802 for group Э10-81 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-42 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ4-121 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150202 for group РКТ6-101 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group Э10-82 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'Э'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-81 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-121 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group АК5-61 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group АК3-123 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 090107 for group ЗИ1-21 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'ЗИ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-21 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-21 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-21 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230102 for group ИУ5-82 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170103 for group СМ4-122 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160402 for group ПС1-22 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-22 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 280201 for group Э9-22 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230102 for group ИУ5-83 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 170103 for group СМ4-123 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160801 for group АК2-21 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-101 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group Э6-101 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group МТ1-121 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-141 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 14
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ2-41 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-23 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 230100 for group ИУ5-84 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 4;


-- Setting speciality 151002 for group МТ1-122 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150206 for group МТ12-101 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ3-61 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-81 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-81 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-81 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-21 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-81 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160802 for group АК1-81 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-21 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190202 for group СМ9-82 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-41 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-82 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150201 for group МТ6-82 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210107 for group МТ11-22 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-41 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group Э8-82 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'Э'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-41 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150201 for group МТ6-121 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-22 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-42 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-42 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-42 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150201 for group МТ6-122 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ9-121 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-61 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group РКТ6-61 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-62 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group РК4-81 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ12-121 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-82 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group РЛ1-61 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group Э3-21 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-21 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-62 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-22 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170103 for group СМ4-22 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151002 for group МТ1-21 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group РТ1-101 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group МТ1-22 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group РТ1-21 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-61 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ2-101 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-41 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group СМ2-101 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-62 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ12-21 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-81 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ2-102 (from line 41)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160703 for group СМ3-81 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-42 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group РКТ6-121 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group Э2-82 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'Э'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160703 for group СМ3-82 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ6-43 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 080502 for group ИБМ6-21 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group АК5-81 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'АК'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 090107 for group ЗИ1-41 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'ЗИ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-41 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-41 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-41 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-42 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-42 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 280201 for group Э9-42 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group АК2-41 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ2-61 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-43 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230201 for group ИУ3-121 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group Э6-121 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200503 for group МТ4-101 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230201 for group ИУ3-122 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ3-81 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group МТ12-121 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-101 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-41 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-102 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group СМ6-61 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-41 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-61 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-42 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-61 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-103 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group СМ6-62 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150301 for group РК5-42 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-62 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-62 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230201 for group ИУ3-81 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-101 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-104 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150202 for group РКТ6-81 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-102 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230201 for group ИУ3-82 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160403 for group АК4-101 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ5-101 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ5-102 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-101 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-81 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-102 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-41 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-41 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group РЛ1-82 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group СМ5-103 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140503 for group Э3-42 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170103 for group СМ4-42 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151002 for group МТ1-41 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group РТ1-121 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group МТ1-42 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group ОЭ3-101 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-61 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210304 for group РТ1-41 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-101 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-81 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ2-121 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-62 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-102 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160802 for group СМ2-121 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group ФН2-82 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'ФН'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ12-41 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-103 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group ОЭ3-21 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-21 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-63 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160403 for group ИУ1-101 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ6-41 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-102 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090107 for group ЗИ1-61 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'ЗИ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-61 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-61 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group ПС2-101 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-61 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-21 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-103 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200503 for group МТ4-21 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-62 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-62 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150502 for group СМ13-101 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group МТ10-101 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group Э6-21 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-62 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group АК2-61 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-22 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group ОЭ2-81 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-63 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 150404 for group МТ10-102 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 200503 for group МТ4-121 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-121 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-101 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-122 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 280201 for group Э9-102 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 190201 for group СМ10-21 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-61 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group Э5-81 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ2-123 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group СМ6-81 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group РК5-61 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group МТ3-81 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-22 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210107 for group МТ11-62 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group Э5-82 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'Э'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group РЛ2-124 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 170102 for group СМ6-82 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group РК5-62 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151001 for group МТ3-82 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190201 for group СМ10-121 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-122 (from line 72)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 190201 for group СМ10-123 (from line 73)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group ИБМ5-121 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-121 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ5-122 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ9-21 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-122 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group АК4-124 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'АК'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 151002 for group МТ1-61 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group СМ5-123 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 140503 for group Э3-61 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-101 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-61 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-101 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group МТ1-62 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-62 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group РК4-102 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-21 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-62 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 210202 for group ИУ4-102 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-22 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group МТ13-101 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-103 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group ИУ6-81 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ3-121 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group РТ1-61 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-82 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-121 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ПС2-21 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-21 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group ИУ6-83 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group МТ7-122 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group МТ8-22 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ12-61 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-123 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group ОЭ3-41 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-41 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-121 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ6-61 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-81 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-122 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090107 for group ЗИ1-81 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'ЗИ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-81 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150202 for group МТ7-81 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group МТ12-21 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150502 for group СМ13-121 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ПС2-121 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group АК2-81 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'АК'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-82 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group СМ7-41 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group ИУ1-123 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200503 for group МТ4-41 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ПС1-82 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group МТ7-82 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group МТ10-121 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group Э6-41 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-42 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group ПС1-83 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group МТ7-83 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150404 for group МТ10-122 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210107 for group МТ11-81 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-121 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group Э9-122 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'Э'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group РКТ4-21 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-41 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group РТ2-101 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group МТ11-82 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group РК5-81 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-42 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150301 for group РК5-82 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'РК'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ3-101 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group Э1-101 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-101 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group Э1-102 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-21 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-102 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-22 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151003 for group МТ2-21 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group Э4-23 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151003 for group МТ2-22 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230101 for group ИУ9-41 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group РТ2-21 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-121 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160803 for group СМ8-101 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-121 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group МТ1-81 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150502 for group СМ13-21 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140503 for group Э3-81 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group РК4-122 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'РК'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160803 for group СМ8-102 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170103 for group СМ4-81 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210202 for group ИУ4-122 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151002 for group МТ1-82 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group Э3-82 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'Э'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150204 for group МТ5-101 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group СМ1-41 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group СМ4-82 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210202 for group ИУ4-123 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group РЛ3-101 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group МТ5-102 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ1-42 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group МТ13-121 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group РЛ3-102 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'РЛ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210304 for group РТ1-81 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group ПС2-41 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ПС'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-41 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group МТ8-42 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group СМ12-81 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-61 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ11-101 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ОЭ3-61 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ОЭ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group БМТ1-62 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'БМТ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230105 for group ИУ7-21 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group ИБМ6-81 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group МТ12-41 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-22 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140402 for group Э6-61 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'Э'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-61 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group ИУ7-23 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'ИУ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200503 for group МТ4-61 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group СМ7-62 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group РКТ4-41 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'РКТ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-61 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group РТ2-121 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'РТ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group АК3-21 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'АК'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group АК1-101 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'АК'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190201 for group СМ10-62 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group ИБМ3-121 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group Э1-121 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-121 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group ИБМ1-21 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'ИБМ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151003 for group МТ2-41 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'МТ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230104 for group РК6-21 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group Э1-122 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'Э'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-41 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group СМ3-122 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'СМ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group РК6-22 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'РК'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140401 for group Э4-42 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'Э'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;

