
--
-- îÁÚÎÁÞÅÎÉÅ ËÏÄÏ× ÎÁÐÒÁ×ÌÅÎÉÊ É ÓÐÅÃÉÁÌØÎÏÓÔÅÊ ÓÔÕÄÅÎÔÁÍ
-- ×ÎÕÔÒÉ ÇÒÕÐÐ
--

-- Setting speciality 151003 for group íô2-42 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-23 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 160402 for group éõ2-101 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-43 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group éõ2-102 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ9-61 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group òô2-41 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-101 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-21 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-103 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group óí8-121 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-102 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group éõ1-22 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150502 for group óí13-41 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-122 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-101 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-121 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-61 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200402 for group âíô2-21 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-121 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230100 for group éõ7-102 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150204 for group íô5-122 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-62 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì3-122 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-103 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200401 for group ðó2-61 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-61 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-81 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-21 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-62 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200401 for group âíô1-82 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group óí11-121 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü3-81 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-22 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-41 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí11-21 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150206 for group íô12-61 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-42 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 140402 for group ü6-81 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-81 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-43 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 200503 for group íô4-81 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-82 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group òë5-101 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group òëô4-61 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-81 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group òëô4-101 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-102 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group áë3-41 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group áë1-121 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-82 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí1-41 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí6-101 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-101 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-61 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-41 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-61 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-102 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-101 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-62 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-42 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group ü1-21 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-62 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-103 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group óí6-102 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160302 for group ü1-22 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group éõ2-121 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-63 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 170102 for group óí6-103 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group éõ2-122 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ9-81 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210201 for group òô2-61 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-121 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-41 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-123 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210107 for group íô11-122 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group éõ1-42 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150502 for group óí13-61 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-81 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200402 for group âíô2-41 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-121 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-82 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150501 for group íô8-101 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230100 for group éõ7-122 (from line 99)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group íô8-102 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-123 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200401 for group ðó2-81 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-81 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150207 for group íô13-21 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí4-21 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group òì6-101 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-21 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-82 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë10-21 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-41 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-22 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë10-22 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150204 for group íô5-42 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-61 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-62 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150206 for group íô12-81 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-63 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group óí11-41 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-21 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-22 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210202 for group éõ4-23 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 190202 for group óí9-101 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-24 (from line 88)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 150301 for group òë5-121 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-102 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230401 for group áë3-61 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-103 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160803 for group óí8-21 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-21 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160801 for group òëô4-81 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group òëô4-121 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-122 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group ü7-21 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-22 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-22 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140305 for group ü7-22 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-23 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151001 for group òô3-21 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí1-61 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí6-121 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-121 (from line 129)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 170102 for group óí6-121 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-81 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-61 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-81 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-122 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151003 for group íô2-82 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-62 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160302 for group ü1-41 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-101 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-82 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-123 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group óí6-122 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-63 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160302 for group ü1-42 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151003 for group íô2-102 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-83 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 230102 for group éõ5-101 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170102 for group óí6-123 (from line 60)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 210201 for group òô2-81 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-102 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160403 for group éõ1-61 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150502 for group óí13-81 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230100 for group éõ5-103 (from line 92)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200402 for group âíô2-61 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-62 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230100 for group éõ5-104 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150501 for group íô8-121 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-21 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210201 for group òì6-121 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-122 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group áë2-101 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-22 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group íô13-41 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí4-41 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-61 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-41 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group óí2-21 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-41 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-23 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150204 for group íô5-62 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë9-42 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë10-42 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 010200 for group æî2-101 (from line 26)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '010200'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-81 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-101 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-102 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-82 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200401 for group âíô1-102 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210201 for group òì6-21 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-41 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-83 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group óí11-61 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160403 for group áë4-21 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-42 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210202 for group éõ4-43 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 190202 for group óí9-121 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151001 for group òô3-101 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-122 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí2-21 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group áë3-81 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-41 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-123 (from line 69)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160803 for group óí8-41 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-41 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-101 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-42 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160803 for group óí8-42 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-42 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group éõ8-102 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140501 for group ü2-101 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-43 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 090105 for group éõ8-103 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140501 for group ü2-102 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group òô3-41 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-21 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-21 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí1-81 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-22 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-81 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-82 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160302 for group ü1-61 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-121 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-101 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-83 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 160302 for group ü1-62 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151003 for group íô2-122 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-121 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-102 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-122 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group éõ1-81 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-123 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200402 for group âíô2-81 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-82 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group éõ5-124 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 220402 for group òë10-101 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-41 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-102 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090105 for group éõ8-42 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group íô13-61 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-101 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí4-61 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160801 for group áë2-122 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150204 for group íô5-81 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150404 for group íô10-21 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-61 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160802 for group óí2-41 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-61 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-121 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-82 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group íô10-22 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë9-62 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë10-62 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230401 for group æî2-122 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 200401 for group âíô1-121 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150801 for group ü5-101 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-122 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210201 for group òì6-41 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-61 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group ü5-102 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220402 for group óí7-101 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí11-81 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group áë4-41 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-62 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220402 for group óí7-102 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210202 for group éõ4-63 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 220402 for group óí7-103 (from line 63)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 220402 for group óí7-104 (from line 64)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 151001 for group òô3-121 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí2-41 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-121 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-61 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-61 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-61 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-122 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group ü7-62 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-21 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-62 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-62 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-22 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group ü2-121 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-63 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 140501 for group ü2-122 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151001 for group òô3-61 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-41 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-41 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-42 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160302 for group ü1-81 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-121 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group ü1-82 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140305 for group ü7-122 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140305 for group ü7-123 (from line 138)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group éâí5-21 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí1-101 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-21 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-121 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-22 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 090105 for group éõ8-61 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-122 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-101 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-121 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-62 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150207 for group íô13-81 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-102 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-21 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí4-81 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group áë5-101 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160802 for group óí2-61 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-81 (from line 37)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-22 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150404 for group íô10-41 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-81 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë10-82 (from line 38)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-23 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150404 for group íô10-42 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë9-82 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230100 for group éõ5-24 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 210201 for group òì6-61 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-81 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150801 for group ü5-121 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160403 for group áë4-61 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-101 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-21 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-82 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190202 for group óí9-21 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150801 for group ü5-122 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 220402 for group óí7-121 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-21 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-21 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-102 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160303 for group ü8-22 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 190202 for group óí9-22 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group òì1-101 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-122 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150201 for group íô6-22 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160802 for group áë1-21 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-83 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group òì1-102 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-101 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-102 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-102 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ6-103 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 080507 for group éâí2-61 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-103 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group òì2-81 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-81 (from line 136)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-81 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-82 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140400 for group æî4-21 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'æî'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140305 for group ü7-82 (from line 137)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140305'
WHERE     f.short_name = 'ü'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-41 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-21 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-82 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-83 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220203 for group óí5-42 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group òë4-22 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group òô3-81 (from line 159)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'òô'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-61 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-61 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-62 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 200402 for group âíô2-101 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-63 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 200402 for group âíô2-102 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 080502 for group éâí5-41 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-21 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü2-101 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-21 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí1-121 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-41 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-22 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160703 for group óí3-22 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-121 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-42 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 090105 for group éõ8-81 (from line 102)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-122 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090105 for group éõ8-82 (from line 103)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group òë9-101 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-41 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 090105 for group éõ8-83 (from line 104)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 220402 for group òë9-102 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230101 for group áë5-21 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group óí2-81 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-42 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150404 for group íô10-61 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group ü3-101 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-43 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 160402 for group ðó1-101 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group íô10-62 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-102 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230100 for group éõ5-44 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 4;


-- Setting speciality 160402 for group ðó1-102 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-103 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 210201 for group òì6-81 (from line 116)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òì'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí3-21 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-103 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group áë5-125 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 5;


-- Setting speciality 160403 for group áë4-81 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-41 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-121 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-41 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-41 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-41 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-101 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-42 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-122 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160303 for group ü8-42 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190202 for group óí9-42 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group òì1-121 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160802 for group áë1-41 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-102 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-121 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-121 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-122 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-122 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ6-122 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-123 (from line 34)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 150202 for group òëô6-21 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-123 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230201 for group éõ3-21 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí2-81 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140400 for group æî4-41 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'æî'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230100 for group éõ6-124 (from line 97)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 230201 for group éõ3-22 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-61 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-41 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-62 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group òë4-42 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group éõ2-81 (from line 80)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-21 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group òëô5-81 (from line 150)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-22 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160402 for group éõ2-82 (from line 81)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group òì1-23 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200402 for group âíô2-121 (from line 119)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group éõ2-83 (from line 82)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group òì1-24 (from line 109)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 4;


-- Setting speciality 200402 for group âíô2-122 (from line 120)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200402'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080502 for group éâí5-61 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü2-121 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-41 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí5-62 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150802 for group ü10-101 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-21 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-41 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-42 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150802 for group ü10-102 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150802 for group ü10-61 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-22 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140501 for group ü2-42 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 230401 for group áë3-101 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-62 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí4-101 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-121 (from line 35)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-61 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-101 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group áë5-41 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group òë9-122 (from line 36)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'òë'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-121 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-62 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170103 for group óí4-102 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 150404 for group íô10-81 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 140503 for group ü3-122 (from line 127)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-63 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 151002 for group íô1-101 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-103 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 160402 for group ðó1-121 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü2-21 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150404 for group íô10-82 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-123 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 230100 for group éõ5-64 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 4;


-- Setting speciality 151002 for group íô1-102 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160402 for group ðó1-122 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí3-41 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-123 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group òì3-61 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-121 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-61 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-61 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-61 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-62 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150201 for group íô6-62 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-21 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-62 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-21 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-101 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-62 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160802 for group áë1-61 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-21 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-122 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-22 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-22 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150201 for group íô6-102 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-22 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-23 (from line 7)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150202 for group òëô6-41 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-41 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140400 for group æî4-61 (from line 27)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140400'
WHERE     f.short_name = 'æî'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-42 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 190205 for group òë4-61 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-81 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-62 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí12-101 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-82 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-83 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 210304 for group òì1-41 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-42 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 210304 for group òì1-43 (from line 108)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230101 for group éõ6-21 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí5-81 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-121 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-61 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-61 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-22 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 080502 for group éâí5-82 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150802 for group ü10-122 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230401 for group æî2-41 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-62 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160703 for group óí3-62 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ6-23 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 150802 for group ü10-81 (from line 143)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-42 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí4-121 (from line 43)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150202 for group òëô6-101 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150802 for group ü10-82 (from line 144)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150802'
WHERE     f.short_name = 'ü'
          AND d.department_num = 10
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-81 (from line 89)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-121 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group áë5-61 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230401 for group áë3-123 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 090107 for group úé1-21 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'úé'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-21 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-21 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-21 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230102 for group éõ5-82 (from line 90)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170103 for group óí4-122 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160402 for group ðó1-22 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-22 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 280201 for group ü9-22 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230102 for group éõ5-83 (from line 91)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230102'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 170103 for group óí4-123 (from line 54)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 160801 for group áë2-21 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-101 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group ü6-101 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group íô1-121 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-141 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 14
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü2-41 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-23 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 230100 for group éõ5-84 (from line 93)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230100'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 4;


-- Setting speciality 151002 for group íô1-122 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150206 for group íô12-101 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí3-61 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-81 (from line 67)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-81 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-81 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-21 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-81 (from line 139)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160802 for group áë1-81 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-21 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190202 for group óí9-82 (from line 68)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190202'
WHERE     f.short_name = 'óí'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-41 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-82 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150201 for group íô6-82 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210107 for group íô11-22 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-41 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160303 for group ü8-82 (from line 140)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160303'
WHERE     f.short_name = 'ü'
          AND d.department_num = 8
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-41 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150201 for group íô6-121 (from line 11)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-22 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-42 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-42 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-42 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150201 for group íô6-122 (from line 12)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150201'
WHERE     f.short_name = 'íô'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ9-121 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-61 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group òëô6-61 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-62 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group òë4-81 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí12-121 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-82 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210304 for group òì1-61 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 140503 for group ü3-21 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-21 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-62 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-22 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 170103 for group óí4-22 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151002 for group íô1-21 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210304 for group òô1-101 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group íô1-22 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210304 for group òô1-21 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-61 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí2-101 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-41 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160802 for group óí2-101 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-62 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí12-21 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-81 (from line 124)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí2-102 (from line 41)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160703 for group óí3-81 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-42 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group òëô6-121 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140501 for group ü2-82 (from line 125)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140501'
WHERE     f.short_name = 'ü'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160703 for group óí3-82 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ6-43 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 080502 for group éâí6-21 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group áë5-81 (from line 158)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'áë'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 090107 for group úé1-41 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'úé'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-41 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-41 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-41 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-42 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-42 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 280201 for group ü9-42 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group áë2-41 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü2-61 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-43 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 3;


-- Setting speciality 230201 for group éõ3-121 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group ü6-121 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200503 for group íô4-101 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230201 for group éõ3-122 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí3-81 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group íô12-121 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-101 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-41 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-102 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170102 for group óí6-61 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-41 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-61 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-42 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-61 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-103 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 170102 for group óí6-62 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150301 for group òë5-42 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-62 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-62 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230201 for group éõ3-81 (from line 83)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-101 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-104 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 4;


-- Setting speciality 150202 for group òëô6-81 (from line 149)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-102 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 230201 for group éõ3-82 (from line 84)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230201'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160403 for group áë4-101 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí5-101 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí5-102 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-101 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-81 (from line 106)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-102 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-41 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-41 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group òì1-82 (from line 107)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òì'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220203 for group óí5-103 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 140503 for group ü3-42 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 170103 for group óí4-42 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 151002 for group íô1-41 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210304 for group òô1-121 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group íô1-42 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 200203 for group ïü3-101 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-61 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210304 for group òô1-41 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-101 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-81 (from line 24)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí2-121 (from line 40)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-62 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-102 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160802 for group óí2-121 (from line 49)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'óí'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group æî2-82 (from line 25)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'æî'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí12-41 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-103 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200203 for group ïü3-21 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-21 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-63 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 160403 for group éõ1-101 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí6-41 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-102 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 090107 for group úé1-61 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'úé'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-61 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-61 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group ðó2-101 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-61 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-21 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-103 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 200503 for group íô4-21 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-62 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-62 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150502 for group óí13-101 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150404 for group íô10-101 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 140402 for group ü6-21 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-62 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group áë2-61 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-22 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 200203 for group ïü2-81 (from line 152)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-63 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 3;


-- Setting speciality 150404 for group íô10-102 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 200503 for group íô4-121 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-121 (from line 110)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-101 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-122 (from line 111)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 280201 for group ü9-102 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 190201 for group óí10-21 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-61 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150801 for group ü5-81 (from line 133)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì2-123 (from line 112)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 170102 for group óí6-81 (from line 58)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150301 for group òë5-61 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 151001 for group íô3-81 (from line 5)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-22 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 210107 for group íô11-62 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 150801 for group ü5-82 (from line 134)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150801'
WHERE     f.short_name = 'ü'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 200203 for group òì2-124 (from line 113)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 170102 for group óí6-82 (from line 59)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170102'
WHERE     f.short_name = 'óí'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group òë5-62 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 151001 for group íô3-82 (from line 6)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151001'
WHERE     f.short_name = 'íô'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 190201 for group óí10-121 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-122 (from line 72)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 190201 for group óí10-123 (from line 73)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 080502 for group éâí5-121 (from line 44)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-121 (from line 55)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí5-122 (from line 45)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ9-21 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 9
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-122 (from line 56)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160403 for group áë4-124 (from line 157)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'áë'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 4;


-- Setting speciality 151002 for group íô1-61 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220203 for group óí5-123 (from line 57)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220203'
WHERE     f.short_name = 'óí'
          AND d.department_num = 5
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 140503 for group ü3-61 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-101 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-61 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-101 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 151002 for group íô1-62 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-62 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 190205 for group òë4-102 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-21 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-62 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 210202 for group éõ4-102 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-22 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 150207 for group íô13-101 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-103 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 10
          AND g.group_num = 3;


-- Setting speciality 230101 for group éõ6-81 (from line 94)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü3-121 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 210304 for group òô1-61 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-82 (from line 95)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-121 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ðó2-21 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-21 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 230101 for group éõ6-83 (from line 96)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group íô7-122 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 150501 for group íô8-22 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí12-61 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-123 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group ïü3-41 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-41 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-121 (from line 77)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí6-61 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-81 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-122 (from line 78)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 090107 for group úé1-81 (from line 121)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '090107'
WHERE     f.short_name = 'úé'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-81 (from line 145)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150202 for group íô7-81 (from line 13)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group íô12-21 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 150502 for group óí13-121 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200401 for group ðó2-121 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160801 for group áë2-81 (from line 155)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'áë'
          AND d.department_num = 2
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-82 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 220402 for group óí7-41 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160403 for group éõ1-123 (from line 79)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160403'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200503 for group íô4-41 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160402 for group ðó1-82 (from line 146)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150202 for group íô7-82 (from line 14)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150404 for group íô10-121 (from line 18)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 140402 for group ü6-41 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-42 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160402 for group ðó1-83 (from line 147)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160402'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150202 for group íô7-83 (from line 15)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150202'
WHERE     f.short_name = 'íô'
          AND d.department_num = 7
          AND g.current_term_number = 8
          AND g.group_num = 3;


-- Setting speciality 150404 for group íô10-122 (from line 19)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150404'
WHERE     f.short_name = 'íô'
          AND d.department_num = 10
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 210107 for group íô11-81 (from line 20)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-121 (from line 141)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 280201 for group ü9-122 (from line 142)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '280201'
WHERE     f.short_name = 'ü'
          AND d.department_num = 9
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160801 for group òëô4-21 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-41 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group òô2-101 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210107 for group íô11-82 (from line 21)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210107'
WHERE     f.short_name = 'íô'
          AND d.department_num = 11
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150301 for group òë5-81 (from line 30)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-42 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150301 for group òë5-82 (from line 31)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150301'
WHERE     f.short_name = 'òë'
          AND d.department_num = 5
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí3-101 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group ü1-101 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-101 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160302 for group ü1-102 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-21 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-102 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-22 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 151003 for group íô2-21 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140401 for group ü4-23 (from line 132)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 151003 for group íô2-22 (from line 4)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 230101 for group éõ9-41 (from line 105)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230101'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 9
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 210201 for group òô2-21 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-121 (from line 28)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160803 for group óí8-101 (from line 65)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-121 (from line 85)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 151002 for group íô1-81 (from line 1)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150502 for group óí13-21 (from line 76)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150502'
WHERE     f.short_name = 'óí'
          AND d.department_num = 13
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 140503 for group ü3-81 (from line 126)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 190205 for group òë4-122 (from line 29)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190205'
WHERE     f.short_name = 'òë'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 160803 for group óí8-102 (from line 66)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160803'
WHERE     f.short_name = 'óí'
          AND d.department_num = 8
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 170103 for group óí4-81 (from line 52)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 210202 for group éõ4-122 (from line 86)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 151002 for group íô1-82 (from line 2)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151002'
WHERE     f.short_name = 'íô'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 140503 for group ü3-82 (from line 128)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140503'
WHERE     f.short_name = 'ü'
          AND d.department_num = 3
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 150204 for group íô5-101 (from line 9)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 160801 for group óí1-41 (from line 47)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 170103 for group óí4-82 (from line 53)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '170103'
WHERE     f.short_name = 'óí'
          AND d.department_num = 4
          AND g.current_term_number = 8
          AND g.group_num = 2;


-- Setting speciality 210202 for group éõ4-123 (from line 87)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210202'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 4
          AND g.current_term_number = 12
          AND g.group_num = 3;


-- Setting speciality 200203 for group òì3-101 (from line 114)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 150204 for group íô5-102 (from line 10)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150204'
WHERE     f.short_name = 'íô'
          AND d.department_num = 5
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí1-42 (from line 48)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 1
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 150207 for group íô13-121 (from line 23)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150207'
WHERE     f.short_name = 'íô'
          AND d.department_num = 13
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 200203 for group òì3-102 (from line 115)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'òì'
          AND d.department_num = 3
          AND g.current_term_number = 10
          AND g.group_num = 2;


-- Setting speciality 210304 for group òô1-81 (from line 161)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210304'
WHERE     f.short_name = 'òô'
          AND d.department_num = 1
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group ðó2-41 (from line 148)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'ðó'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-41 (from line 16)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 150501 for group íô8-42 (from line 17)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150501'
WHERE     f.short_name = 'íô'
          AND d.department_num = 8
          AND g.current_term_number = 4
          AND g.group_num = 2;


-- Setting speciality 160801 for group óí12-81 (from line 75)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'óí'
          AND d.department_num = 12
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-61 (from line 117)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí11-101 (from line 74)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 11
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 200203 for group ïü3-61 (from line 153)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200203'
WHERE     f.short_name = 'ïü'
          AND d.department_num = 3
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 200401 for group âíô1-62 (from line 118)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200401'
WHERE     f.short_name = 'âíô'
          AND d.department_num = 1
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 230105 for group éõ7-21 (from line 98)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 080502 for group éâí6-81 (from line 46)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080502'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 6
          AND g.current_term_number = 8
          AND g.group_num = 1;


-- Setting speciality 150206 for group íô12-41 (from line 22)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '150206'
WHERE     f.short_name = 'íô'
          AND d.department_num = 12
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-22 (from line 100)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140402 for group ü6-61 (from line 135)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140402'
WHERE     f.short_name = 'ü'
          AND d.department_num = 6
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-61 (from line 61)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 230105 for group éõ7-23 (from line 101)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230105'
WHERE     f.short_name = 'éõ'
          AND d.department_num = 7
          AND g.current_term_number = 2
          AND g.group_num = 3;


-- Setting speciality 200503 for group íô4-61 (from line 8)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '200503'
WHERE     f.short_name = 'íô'
          AND d.department_num = 4
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 220402 for group óí7-62 (from line 62)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '220402'
WHERE     f.short_name = 'óí'
          AND d.department_num = 7
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 160801 for group òëô4-41 (from line 151)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160801'
WHERE     f.short_name = 'òëô'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-61 (from line 70)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 1;


-- Setting speciality 210201 for group òô2-121 (from line 160)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '210201'
WHERE     f.short_name = 'òô'
          AND d.department_num = 2
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 230401 for group áë3-21 (from line 156)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230401'
WHERE     f.short_name = 'áë'
          AND d.department_num = 3
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160802 for group áë1-101 (from line 154)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160802'
WHERE     f.short_name = 'áë'
          AND d.department_num = 1
          AND g.current_term_number = 10
          AND g.group_num = 1;


-- Setting speciality 190201 for group óí10-62 (from line 71)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '190201'
WHERE     f.short_name = 'óí'
          AND d.department_num = 10
          AND g.current_term_number = 6
          AND g.group_num = 2;


-- Setting speciality 080507 for group éâí3-121 (from line 42)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160302 for group ü1-121 (from line 122)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-121 (from line 50)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 1;


-- Setting speciality 080507 for group éâí1-21 (from line 39)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '080507'
WHERE     f.short_name = 'éâí'
          AND d.department_num = 1
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 151003 for group íô2-41 (from line 3)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '151003'
WHERE     f.short_name = 'íô'
          AND d.department_num = 2
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 230104 for group òë6-21 (from line 32)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 1;


-- Setting speciality 160302 for group ü1-122 (from line 123)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160302'
WHERE     f.short_name = 'ü'
          AND d.department_num = 1
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-41 (from line 130)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 1;


-- Setting speciality 160703 for group óí3-122 (from line 51)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '160703'
WHERE     f.short_name = 'óí'
          AND d.department_num = 3
          AND g.current_term_number = 12
          AND g.group_num = 2;


-- Setting speciality 230104 for group òë6-22 (from line 33)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '230104'
WHERE     f.short_name = 'òë'
          AND d.department_num = 6
          AND g.current_term_number = 2
          AND g.group_num = 2;


-- Setting speciality 140401 for group ü4-42 (from line 131)
UPDATE    student s
          INNER JOIN `group` g USING (group_id)
          INNER JOIN department d USING (department_id)
          INNER JOIN faculty f USING (faculty_id)
SET       s.profession_code = '140401'
WHERE     f.short_name = 'ü'
          AND d.department_num = 4
          AND g.current_term_number = 4
          AND g.group_num = 2;

