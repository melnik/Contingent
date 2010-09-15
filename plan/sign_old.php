<?php
require('pgsql.class.php');

                        $pg_l = new pgsql();
			$query = "SELECT program_id as id, parent_id as f_id FROM prog WHERE year = 2008 AND program_id NOT IN (SELECT parent_id FROM prog WHERE year = 2009) AND program_id NOT IN (SELECT program_id FROM prog_status WHERE record = 1)";
			$pg_l->_query($query);
			while ( $r = $pg_l->_getResult() ) 
			if (comparePrograms($r["id"], $r["f_id"])) {
                        $pg = new pgsql();
                        $query = "UPDATE prog_status SET ";
                        $query.= "admin = 1, admin_date = now() ";
                        $log = "Программаы дисциплины утверждена. Создана копия в следующем году.";
                        $query .= "WHERE program_id = '".$r["id"]."'";
                        // Ничинаем транзакцию
                        $pg->_query("START TRANSACTION");
                        if (!$pg->_query($query) ) {                                      
                        // Отменяем изменения                   
                                $pg->_query("ROLLBACK");
                                die("Ошибка");
                        }
// ------------ Создаем дисциплину в следующем году ---------------------
                        if (1) {
                                $program = $r["id"];
//                              echo $program;
                                $pg->_query("SELECT uuid(1) as uuid");
                                $rez=$pg->_getResult();
                                $uuid=$rez['uuid'];
                                if (!$pg->_query("INSERT INTO dis (SELECT '".$uuid."' as discipline_id, discipline_titleshort, discipline_title, subfaculty, discipline_code FROM dis WHERE discipline_id=(SELECT discipline_id FROM prog WHERE program_id='".$program."') )") ) {
                        // Отменяем изменения                   
                                        $pg->_query("ROLLBACK");
                                        die("Ошибка: Невозможно добавить дисциплину");
                                }
                                $discipline_id=$uuid;
                                $pg->_query("SELECT uuid(1) as uuid");
                                $rez=$pg->_getResult();
                                $uuid=$rez['uuid'];
                                if (!$pg->_query("INSERT INTO prog (SELECT '".$uuid."' as uuid, year+1, semester, weeks, lectures, seminars, labs, labscount, individual, zach, difzach, exam, memo, '".$discipline_id."' as discipline_id, subfaculty_for, speciality_for, seminarscount, '".$program."' AS parent_id FROM prog WHERE program_id='".$program."' ) ") ) {
                        // Отменяем изменения                   
                                        $pg->_query("ROLLBACK");
                                        die("Ошибка: Невозможно добавить дисциплину");
                                }
                                $prog_id=$uuid;
                                $pg->_query("SELECT uuid(1) as uuid");
                                $rez=$pg->_getResult();
                                $uuid=$rez['uuid'];
                                if (!$pg->_query("INSERT INTO memo (SELECT '".$uuid."' as uuid, annotation, lectures, seminars, labs, individual, '".$prog_id."' as program_id FROM memo WHERE program_id='".$program."' ) ") ) {
                        // Отменяем изменения                   
                                        $pg->_query("ROLLBACK");
                                        die("Ошибка: Невозможно добавить дисциплину");
                                }
//                      $prog_id=$uuid;
                                if (!$pg->_query("INSERT INTO control (control_type, control_title, week, memo,  program_id, vol) (SELECT control_type, control_title, week, memo, '".$prog_id."' as  program_id, vol FROM control WHERE program_id='".$program."')") ) {
                        // Отменяем изменения                   
                                        $pg->_query("ROLLBACK");
                                        die("Ошибка: Невозможно добавить дисциплину");
                                }
                                if (!$pg->_query("INSERT INTO prog_status (created, created_date, program_id) VALUES (1,now(),'".$prog_id."')") ) {
                        // Отменяем изменения                   
                                        $pg->_query("ROLLBACK");
                                        die("Ошибка: Невозможно добавить дисциплину");
                                }
                        }
                $pg->_query("COMMIT");
//              $pg->_query("ROLLBACK");
                echo $log;
        }

function comparePrograms($id, $pid) {
	if ($id == '00000000-0000-0000-0000-000000000000' || $pid == '00000000-0000-0000-0000-000000000000') return 0;
	$count=0;
	$pg = new pgsql();
	$pg->_query("SELECT DISTINCT discipline_titleshort, discipline_title, subfaculty, discipline_code FROM dis  WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '$id' OR  program_id = '$pid')");
	while ($rez = $pg->_getResult()) 
		$count++;
	if ($count != 1) {
	return 0;
	}
	$count=0;
	$pg->_query("SELECT DISTINCT semester, weeks, lectures, seminars, labs, labscount, individual, zach, difzach, exam, subfaculty_for, speciality_for, seminarscount FROM prog WHERE program_id = '$id' OR  program_id = '$pid'");
	while ($rez = $pg->_getResult()) 
		$count++;
	if ($count != 1) {
	return 0;
	}
	$count=0;
	$pg->_query("SELECT control_type, control_title, week, vol FROM control WHERE program_id = '$id'");
	while ($rez = $pg->_getResult()) 
		$count++;
	$pcount=0;
	$pg->_query("SELECT control_type, control_title, week, vol FROM control WHERE program_id = '$pid'");
	while ($rez = $pg->_getResult()) 
		$pcount++;
	$dcount=0;
	$pg->_query("SELECT DISTINCT control_type, control_title, week, vol FROM control WHERE program_id = '$id' OR  program_id = '$pid'");
	while ($rez = $pg->_getResult()) 
		$dcount++;
	if ($count != $pcount || $count!= $dcount) {
	return 0;
	}
	return 1;
}
?>
