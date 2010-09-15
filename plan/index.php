<?php
// echo $_SERVER["REMOTE_ADDR"];

require_once('menu.class.php');

if ($_GET['action']=="logout") {
        if (isset($_COOKIE[session_name()]))
        setcookie(session_name(), '', time()-42000, '/');
        session_destroy();
}

/*echo $_SESSION['attr'];
echo "\n";
echo $_GET["subfaculty"];
echo "\n";*/

//print_r($_POST);

if(!($_GET["section"] || $_POST["section"])) $_GET["section"]="prog";

$doc = new menu("Система \"Учебный план\"");

if($_GET["section"]=="prog" || $_POST["section"]=="prog")
{
//	echo "123";
        if($_GET["action"]=="organize" && auth(1) && $_GET["year"]) $doc->organize($_GET["year"]);
	if($_GET["action"]=="add" && (auth(8) || auth(1))) $doc->progForm("add");
	if($_GET["action"]=="km") $doc->progKM("view");
	if($_GET["action"]=="record") $doc->progPrint("printLock");
	if($_GET["action"]=="print") $doc->progPrint("print");
	if(auth(1) && $_GET["action"]=="recordAdmin") $doc->progPrint("recordAdmin");
	if(auth(1) && $_GET["action"]=="recordEdit") $doc->recordAdmin("recordEdit");
	if($_GET["action"]=="statistics") $doc->progStatistics("view");
	if($_GET["action"]=="setCopy" && (auth(8) || auth(1))) $doc->setCopy("copyContent");
	if( ($_GET["action"]=="reindex" || $_POST["action"]=="reindex") && auth(1) ) $doc->progReindex("commitReindex");
	if(($_GET["action"]=="edit" || $_GET["action"]=="view" || $_GET["action"]=="delete" || $_GET["action"]=="for_sign" || $_GET["action"]=="trash") && !$_GET["program"]) $doc->progSelect($_GET["action"]);
	if(( ( ($_GET["action"]=="edit" || $_POST["action"]=="edit") && (auth(8) || auth(1)) ) || $_GET["action"]=="view" || $_POST["action"]=="view") && $_GET["program"]) $doc->progForm(($_GET["action"])?$_GET["action"]:$_POST["action"]);
	//if($_GET["action"]=="editSelected" || $_GET["action"]=="viewSelected" || $_GET["action"]=="deleteSelected") $doc->progForm(substr($_GET["action"],0,strlen($_GET["action"])-8));

/*----------------- Организация учебного процесса ---------------------
 * Сохранение
 */
        if($_POST["action"]=="organizeCommit" && auth(1) && $_POST["count"] && $_POST["f_id"]) {
        $pg = new pgsql();
//		print_r($_POST);
                for ($i=0;$i<$_POST["count"];$i++) {
                $id = $_POST["id$i"];
                $semester = $_POST["semester$i"];
                $weeks = $_POST["weeks$i"];
                $theory_begin = $_POST["theory_begin$i"];
                $theory_end = $_POST["theory_end$i"];
                $tests_begin = $_POST["tests_begin$i"];
                $tests_end = $_POST["tests_end$i"];
                $exams_begin = $_POST["exams_begin$i"];
                $exams_end = $_POST["exams_end$i"];
                $h_begin = $_POST["h_begin$i"];
                $h_end = $_POST["h_end$i"];
//                $summer_h_begin = $_POST["summer_h_begin$i"];
//                $summer_h_end = $_POST["summer_h_end$i"];
                if ($i<($_POST["count"]-1))
                        $query = "UPDATE year_organize SET semester='$semester', weeks='$weeks', theory_begin='$theory_begin', theory_end='$theory_end', tests_begin='$tests_begin', tests_end='$tests_end', exams_begin='$exams_begin', exams_end='$exams_end', holidays_begin='$h_begin', holidays_end='$h_end' WHERE id = '$id'";
                else
                        if ($semester && $weeks && $theory_begin && $theory_end && $tests_begin && $tests_end && $exams_begin && $exams_end && $h_begin && $h_end)
                                $query = "INSERT INTO year_organize VALUES (DEFAULT, '".$_POST["f_id"]."' ,'$semester', '$weeks', '$theory_begin', '$theory_end', '$tests_begin', '$tests_end', '$exams_begin', '$exams_end', '$h_begin', '$h_end')";
                        // Ничинаем транзакцию
//			echo $query;
                        $pg->_query("START TRANSACTION");
                        if (!$pg->_query($query) ){
                        // Отменяем изменения
                                $pg->_query("ROLLBACK");
                                die("Ошибка");
                        }
                }
                $pg->_query("COMMIT");
                echo "Изменения сохранены.";
                $doc->organize($_POST["year"]);
        }
// ----------------------------------------------------------------------------------------
/*----------------- Организация учебного процесса ---------------------
 * Удаление
 */
        if($_GET["action"]=="organizeDelete" && auth(1) && $_GET["organizeId"]) {
        $pg = new pgsql();
                $query = "DELETE FROM year_organize WHERE id = '".$_GET["organizeId"]."'";
                        $pg->_query("START TRANSACTION");
                        if (!$pg->_query($query) ){
                        // Отменяем изменения
                                $pg->_query("ROLLBACK");
                                die("Ошибка");
                        }
                $pg->_query("COMMIT");
                echo "Изменения сохранены.";
                $doc->organize($_GET["year"]);
        }

// ----------------------------------------------------------------------------------------
/*----------------- Закрытие года ---------------------
 *
 *
 *
 */
	if($_GET["action"]=="close" && $_GET["year"] && auth(1)) {
			$pg = new pgsql();
			$query = "UPDATE prog_status SET ";
			$query.= "admin = 1, admin_date = now(), subfaculty = 0, subfaculty_date = NULL ";
			$query .= "FROM prog WHERE admin = 0 AND year = ".$_GET["year"]." AND prog.program_id=prog_status.program_id";
			$log = "Программы дисциплин утверждены. Созданы копии в следующем году.";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
			// Закрывает текущий год
			if (!$pg->_query("UPDATE year SET closed=1,closed_date=now() WHERE year='".$_GET["year"]."'") ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
			// Открывает новый
			if (!$pg->_query("INSERT INTO year(year) VALUES('".($_GET["year"]+1)."');") ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
// ------------ Восстанавливаем все не утвержденные программы ---------------------
//			$pg->_query("");
// ------------ Создаем дисциплину в следующем году ---------------------
			if (auth(1)) {
				$pg->_query("CREATE TEMP TABLE uuid_tmp (old_dis UUID, new_dis UUID, old_prog UUID, new_prog UUID)");
				$pg->_query("INSERT INTO uuid_tmp SELECT dis.discipline_id as old_dis, uuid(1) as new_dis, 
				prog.program_id as old_prog, uuid(1) as new_prog FROM dis, prog, prog_status 
				WHERE year = ".$_GET["year"]." AND prog.discipline_id = dis.discipline_id AND 
				prog_status.admin = 1 AND prog_status.program_id = prog.program_id");
				if (!$pg->_query("INSERT INTO dis (SELECT new_dis, discipline_titleshort, discipline_title, 
				subfaculty, discipline_code FROM dis, uuid_tmp WHERE discipline_id=old_dis) ") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
				if (!$pg->_query("INSERT INTO prog 
				(SELECT new_prog as uuid, year+1, semester, weeks, lectures, seminars, labs, labscount, 
				individual, zach, difzach, exam, new_dis as discipline_id, subfaculty_for, speciality_for, 
				seminarscount, old_prog AS parent_id, practice, subfaculty_for_id, lecturescount,
				course_project, zach_count FROM prog, uuid_tmp WHERE program_id=old_prog ) ") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
				if (!$pg->_query("INSERT INTO lang (id, lang_first, lang_second)
				(SELECT new_prog, lang_first, lang_second FROM lang, uuid_tmp WHERE f_id=old_prog)") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
				if (!$pg->_query("INSERT INTO memo (SELECT uuid(1) as uuid, annotation, lectures, seminars, labs, 
				individual, new_prog as program_id FROM memo, uuid_tmp WHERE program_id=old_prog  ) ") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
//			$prog_id=$uuid;
				if (!$pg->_query("INSERT INTO control (control_type, control_title, week, memo,  program_id, vol) 
				(SELECT control_type, control_title, week, memo, new_prog as  program_id, vol FROM control, 
				uuid_tmp  WHERE program_id=old_prog)") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
				if (!$pg->_query("INSERT INTO prog_status (created, created_date, program_id) SELECT 1 as created, now() as created_date, 
				new_prog as program_id FROM uuid_tmp") ) {
			// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка: Невозможно добавить дисциплину");
				}
			}
		$pg->_query("COMMIT");
//		$pg->_query("ROLLBACK");
		echo $log;
	}
// ----------------------------------------------------------------------------------------
/* Составление служебной записки
 *
 */
	if($_POST["action"]=="printLock" && $_POST["count"] && auth(8)) {
		$pg = new pgsql();
		// Ничинаем транзакцию
		$pg->_query("START TRANSACTION");
		$pg->_query("SELECT max(record_number)+1 as max FROM prog_status");
		$rez = $pg->_getResult();
		$max = $rez["max"];
		for ($i=1;$i<=$_POST["count"];$i++) {
			if ($_POST["prog-$i"]) {
				$query = "UPDATE prog_status SET subfaculty = 1, subfaculty_date=now(), record = 1, record_number = $max, record_date = now() WHERE program_id='".$_POST["prog-$i"]."'";
				if (!$pg->_query($query) ){					 
				// Отменяем изменения			
					$pg->_query("ROLLBACK");
					die("Ошибка");
				}
			}
		}
		$pg->_query("COMMIT");
		echo "Служебная записка успешно создана. Сформированные слежебные записки можно увидеть выбрав пункт меню \"Распечатать\"";
	}
// ----------------------------------------------------------------------------------------
/* Утверждение программы
 *
 */
	if($_GET["action"]=="sign" && $_GET["program"] && (auth(8) || auth(1))) {
			$pg = new pgsql();
			$pg->_query("SELECT count(*) as cnt FROM prog_status WHERE program_id = '".$_GET["program"]."'");
			$rez=$pg->_getResult();
    			if ($rez["cnt"] < 1)
			$pg->_query("INSERT INTO prog_status (id, program_id, created, created_date) VALUES (uuid(1), '".$_GET["program"]."', '1', now())");
			$query = "UPDATE prog_status SET ";
			if (auth(8)) {
				$query.= "subfaculty = 1, subfaculty_date = now() ";
				$log = "Программа дисциплины направлена на \"утверждение\". Функции внесения изменений и удаления заблокированы.";
			}
			if (auth(1)) {
				$query.= "admin = 1, admin_date = now() ";
//				$log = "Программа дисциплины утверждена. Создана копия в следующем году.";
				$log = "Программа дисциплины утверждена.";
			}
			$query .= "WHERE program_id='".$_GET["program"]."'";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
//		$pg->_query("ROLLBACK");
		echo $log;
	}

// ----------------------------------------------------------------------------------------
/* Утверждение служебной записки
 *
 */
	if($_GET["action"]=="recordSign" && auth(1) && $_GET["record_number"] && $_GET["record_date"]) {
			$pg = new pgsql();
			$query = "UPDATE prog_status SET ";
			$query.= "admin = 1, admin_date = now() ";
			$log = "Программа(ы) дисциплины утверждена.";
//			$log = "Программаы дисциплины утверждена. Создана копия в следующем году.";
			$query .= "WHERE record_number = '".$_GET["record_number"]."'AND record_date = '".$_GET["record_date"]."'";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
//		$pg->_query("ROLLBACK");
		echo $log;
	}

// ----------------------------------------------------------------------------------------
/* Отмена утверждения
 *
 */
	if($_GET["action"]=="un_sign" && $_GET["record_number"] && $_GET["record_date"] && auth(1)) {
			$pg = new pgsql();
			$query = "UPDATE prog_status SET ";
			$query.= "subfaculty = 0, subfaculty_date=NULL, record = 0, record_number = 0, record_date = NULL ";
			$query .= "WHERE record_number='".$_GET["record_number"]."' AND record_date='". $_GET["record_date"]."'";
			$log = "\"Утверждение\" отменено. Функции внесения изменений и удаления разблокированы.";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo $log;
		$doc->progPrint("printLock");
	}

// ----------------------------------------------------------------------------------------
/* Отмена изменений (восстановить как в прошлом году)
 *
 */
/*	if($_GET["action"]=="undo" && $_GET["program"] && ( auth(1) || auth (8)) ) {
			$pg = new pgsql();
			$query = "UPDATE dis SET (discipline_title, discipline_titleshort, subfaculty, discipline_code) = (SELECT discipline_title, discipline_titleshort, subfaculty, discipline_code FROM dis WHERE discipline_id = (SELECT discipline_id FROM prog WHERE program_id = (SELECT parent_id FROM prog WHERE program_id = '".$_GET["program"]."')) WHERE discipline_id = (SELECT discipline_id FROM prog WHERE program_id = '".$_GET["program"]."')";
			$log = "Все внесенные изменения отменены.";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo $log;
	}
*/
// ----------------------------------------------------------------------------------------
/* Убрать дисциплину из служебной записки
 *
 */
	if($_GET["action"]=="recordAlter" && $_GET["prog"] && auth(1)) {
			$pg = new pgsql();
			$query = "UPDATE prog_status SET ";
			$query.= "subfaculty = 0, subfaculty_date=NULL, record = 0, record_number = 0, record_date = NULL ";
			$query .= "WHERE program_id='".$_GET["prog"]."'";
			$log = "\"Утверждение\" отменено. Функции внесения изменений и удаления разблокированы.";
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query($query) ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo $log;
		$doc->recordAdmin("recordEdit");
	}

// ----------------------------------------------------------------------------------------
// Удаление программы с возможеостью восстановления: prog_status(deleted, deleted_date) = (1,now())
	if($_GET["action"]=="delete" && $_GET["program"] && (auth(8)|| auth(1))) {
			$pg = new pgsql();
	
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query("UPDATE prog_status SET deleted = 1, deleted_date = now() WHERE  program_id='".$_GET["program"]."'") ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo "Программа дисциплины перемещена в \"Удаленные\".";
	}

// Восстановление программы: prog_status(deleted, deleted_date) = (0,NULL)
	if($_GET["action"]=="restore" && $_GET["program"] && (auth(8) || auth(1))) {
			$pg = new pgsql();
	
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query("UPDATE prog_status SET deleted = 0, deleted_date = NULL WHERE  program_id='".$_GET["program"]."'") ){					 
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo "Программа дисциплины восстановлена.";
	}
//-------------------------------------------------------------------
//--------------------- Удаление программы --------------------------
	if($_GET["action"]=="commitDelete" && $_GET["program"] && (auth(8) || auth(1))) {
			$pg = new pgsql();
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			if (!$pg->_query("DELETE FROM dis WHERE discipline_id=(SELECT discipline_id FROM prog WHERE program_id='".$_GET["program"]."')")){
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		$pg->_query("COMMIT");
		echo "Программа дисциплины удалена.";
	}
//-------------------------------------------------------------------
//--------------------- Копирование программы --------------------------
	if($_GET["action"]=="copy" && (auth(8) || auth(1))) {
			$pg = new pgsql();
			$pg->_query("START TRANSACTION");
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
			if (!$pg->_query("INSERT INTO dis (SELECT '".$uuid."', discipline_titleshort, discipline_title || ' (копия)', 
			subfaculty, discipline_code FROM dis WHERE discipline_id=(SELECT discipline_id FROM prog WHERE program_id='".$_GET["program"]."') )") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
			$discipline_id=$uuid;
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
			if (!$pg->_query("INSERT INTO prog (SELECT '".$uuid."' as uuid, year, semester, weeks, lectures, seminars, labs, labscount, 
			individual, zach, difzach, exam, '".$discipline_id."' as discipline_id, subfaculty_for, speciality_for, seminarscount,
			'00000000-0000-0000-0000-000000000000' as parent_id, practice, subfaculty_for_id, lecturescount, course_project, zach_count FROM prog WHERE program_id='".$_GET["program"]."' ) ") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
			$prog_id=$uuid;
			if (!$pg->_query("INSERT INTO lang (f_id, lang_first, lang_second) 
			(SELECT '".$prog_id."' as  f_id, lang_first, lang_second
			FROM lang WHERE f_id='".$_GET["program"]."')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
			if (!$pg->_query("INSERT INTO memo (SELECT '".$uuid."' as uuid, annotation, lectures, seminars, labs, individual,
			'".$prog_id."' as program_id FROM memo WHERE program_id='".$_GET["program"]."' ) ") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
//			$prog_id=$uuid;
			if (!$pg->_query("INSERT INTO control (control_type, control_title, week, memo,  program_id, vol) 
			(SELECT control_type, control_title, week, memo, '".$prog_id."' as  program_id, vol 
			FROM control WHERE program_id='".$_GET["program"]."')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
			if (!$pg->_query("INSERT INTO prog_status (created, created_date, program_id) VALUES (1,now(),'".$prog_id."')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
		$pg->_query("COMMIT");
		echo "Изменения сохранены.";
	}
//-----------------------------------------------------------------------
//--------------------- Изменение индексов програм --------------------------
	if($_POST["action"]=="commitReindex" && auth(1)) {
	$pg = new pgsql();
	// Ничинаем транзакцию
	$pg->_query("START TRANSACTION");
		for($i=1;$i<$_POST['count']+1;$i++)
			if (!$pg->_query("UPDATE dis SET discipline_code = '".$_POST['index'.$i]."' WHERE discipline_id = '".$_POST['id'.$i]."'") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
		// Сохраняем изменения			
		$pg->_query("COMMIT");
		echo "Изменения сохранены.";
	}
// ---------------------------------------------------------------------------
//--------------------- Копирование содержательной части программы --------------------------	
	if( $_POST["action"]=="copyContent" && auth(1) ) {
		echo "Копирование";
		// Проверяем, выбраны ли опции копирования
		if ( !($_POST["content"] || $_POST["annotation"] || $_POST["lectures"] || $_POST["seminars"] || 
			    $_POST["labs"] || $_POST["individual"] || $_POST["literature"]) )
			 die($doc->_cdiv("Ошибка! Не выбраны опции копирования!","error","error"));
		// Проверяем, выбран ли источник
			if (!$_POST["source"])
				die($doc->_cdiv("Ошибка! Не выбрана дисциплина - истчник!","error","error"));
			$source = $_POST["source"]; 		
		// Проверяем, выбрана ли хотя бы одна дисциплина - приемник
		$isSource = 0;
		$len = 0;
		$destination = array();
		for ($i=1;$i<$_POST['count']+1;$i++)
			if ($_POST["destination-$i"]) { 
				$isSource = 1;
				$destination[$len++] = $_POST["destination-$i"]; 
			}
			if (!$isSource)
				die($doc->_cdiv("Ошибка! Не выбрана дисциплина - приемник!","error","error"));
				 		
			$pg = new pgsql();
			
			if ($_POST["content"]) {
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			// Выбираем все из dis - источника
			if (!$pg->_query("SELECT * FROM dis WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '$source')" ) ) {
				$pg->_query("ROLLBACK");
				die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			}
			$rez = $pg->_getResult();
			for ($i=0;$i<$len;$i++) {
    			    if (!$pg->_query("UPDATE dis SET discipline_title='".$rez["discipline_title"]."', discipline_titleshort='".$rez["discipline_titleshort"]."' WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '".$destination[$i]."')" ) ) {
			    	    $pg->_query("ROLLBACK");
				    die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			    }
			}
			// Выбираем все из prog программы - источника
			if (!$pg->_query("SELECT * FROM prog WHERE program_id = '$source'" ) ) {
				$pg->_query("ROLLBACK");
				die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			}
			$rez = $pg->_getResult();
			for ($i=0;$i<$len;$i++) {
    			    if (!$pg->_query("UPDATE prog SET weeks='".$rez["weeks"]."', lectures='".$rez["lectures"]."', seminars='".$rez["seminars"]."', labs='".$rez["labs"]."', labscount='".$rez["labscount"]."', individual='".$rez["individual"]."', zach='".$rez["zach"]."', difzach='".$rez["difzach"]."', exam='".$rez["exam"]."', seminarscount='".$rez["seminarscount"]."' WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '".$destination[$i]."')" ) ) {
			    	    $pg->_query("ROLLBACK");
				    die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			    }
			}
			// Удаляем все из control программы - приемника
			for ($i=0;$i<$len;$i++) {
    			    if (!$pg->_query("DELETE FROM control WHERE program_id = '".$destination[$i]."'" ) ) {
				    $pg->_query("ROLLBACK");
				    die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			    }
    			    if (!$pg->_query("INSERT INTO control SELECT uuid(1) as control_id, control_type, control_title, week, memo, '".$destination[$i]."' as program_id, vol FROM control WHERE program_id = '$source'" ) ) {
			    	    $pg->_query("ROLLBACK");
				    die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			    }
			}
			
			}
			else {
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			// Выбираем содержательную часть дисциплины из программы - источника
			if (!$pg->_query("SELECT * FROM memo WHERE program_id = '$source'")) {
				$pg->_query("ROLLBACK");
				die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
			}
			$rez = $pg->_getResult();
			// Генерируем запрос в зависимости от выбранных опций копирования
			for ($i=0;$i<$len;$i++) {
				$havePrev = 0;
				$update = "UPDATE memo SET ";
				$where = " WHERE program_id = '".$destination[$i]."'";
				if ($_POST["annotation"]) {
					$update .= "annotation='".$rez["annotation"]."'";
					$havePrev = 1;
				}
				if ($lectures) {
					$add = ($havePrev) ? ",lectures='".$rez["lectures"]."'" : "lectures='".$rez["lectures"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($seminars) {
					$add = ($havePrev) ? ",seminars='".$rez["seminars"]."'" : "seminars='".$rez["seminars"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($labs) {
					$add = ($havePrev) ? ",labs='".$rez["labs"]."'" : "labs='".$rez["labs"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($individual) {
					$add = ($havePrev) ? ",individual='".$rez["individual"]."'" : "individual='".$rez["individual"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($literature) {
					$add = ($havePrev) ? ",literature='".$rez["literature"]."'" : "literature='".$rez["literature"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($dz) {
					$add = ($havePrev) ? ",dz='".$rez["dz"]."'" : "dz='".$rez["dz"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($kr) {
					$add = ($havePrev) ? ",kr='".$rez["kr"]."'" : "kr='".$rez["kr"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($rk) {
					$add = ($havePrev) ? ",rk='".$rez["rk"]."'" : "rk='".$rez["rk"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($zach) {
					$add = ($havePrev) ? ",zach='".$rez["zach"]."'" : "zach='".$rez["zach"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($difzach) {
					$add = ($havePrev) ? ",difzach='".$rez["difzach"]."'" : "difzach='".$rez["difzach"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				if ($exam) {
					$add = ($havePrev) ? ",exam='".$rez["exam"]."'" : "exam='".$rez["exam"]."'";
					$update .= $add;
					$select .= $add;
					$havePrev = 1;
				}
				$update .= $where;
				$doc->_cdiv($update);
			// Выполняем запрос
				if (!$pg->_query($update)) {
					$pg->_query("ROLLBACK");
					die($doc->_cdiv("Ошибка! Невозмодно выполнить запрос, попробуйте повторить попытку позже.","error","error"));
				}
			}
			}
			// Сохраняем изменения
			$pg->_query("COMMIT");
			$doc->_cdiv("Ваш запрос выполнен успешно.","sucsess","sucsess");
	}
// ----------------------------------------------------------------------------
//--------------------- Сохранить изменения в программе --------------------------
	if( $_POST["action"]=="commitEdit" && ((auth(8) && !isSignedProgram($_POST['program'])) || auth(1)) ) {
//	    print_r($_POST); die;
				$year=$_POST['year'];
				$semester=$_POST['semester'];
				$weeks=$_POST['weeks'];			
				$lectures=$_POST['lectures'];
				$lecturescount=$_POST['lecturescount'];
				$seminars=$_POST['seminars'];			
				$seminarscount=$_POST['seminarscount'];			
				$labs=$_POST['labs'];			
				$labscount=$_POST['labscount'];			
				$individual=$_POST['individual'];
				$practice=$_POST['practice'];
				$title=ereg_replace("\ {2,20}"," ",(trim($_POST['title'])));
				$titleShort=rtrim(ltrim($_POST['titleShort']));
				($_POST['zach']) ? $zach='t' :  $zach='f';			
				($_POST['zach_count']) ? $zach_count='t' :  $zach_count='f';			
				($_POST['difzach']) ? $difzach='t' :  $difzach='f';			
				($_POST['exam']) ? $exam='t' :  $exam='f';
				$uuid=$_POST['program'];				
				$subfac=$_POST['subfac'];				
				$subfac_id=$_POST['subfac_id'];				
				$subfaculty=$_POST['subfaculty'];
				$subfaculty_id=$_POST['subfaculty_id'];
				$code=$_POST['discipline_code'];				
				$spec=$_POST['spec'];				
				$memo=$_POST['memo'];				
				$langs=$_POST['langs'];
				$lecturesMemo=$_POST['lecturesMemo'];	
				$seminarsMemo=$_POST['seminarsMemo'];			
				$labsMemo=$_POST['labsMemo'];			
				$individualMemo=$_POST['individualMemo'];
				$literatureMemo=$_POST['literatureMemo'];
				$zdMemo=$_POST['zdMemo'];
				$krMemo=$_POST['krMemo'];
				$rkMemo=$_POST['rkMemo'];
				$zachMemo=$_POST['zachMemo'];
				$difzachMemo=$_POST['difzachMemo'];
				$examMemo=$_POST['examMemo'];
	
			$pg = new pgsql();
	
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			// -------------- Сохраняем изменения ---------------------		
			if (!$pg->_query("UPDATE prog SET semester = '$semester',
															year = '$year', 
															weeks = '$weeks',
															lectures = '$lectures', 
															seminars = '$seminars',
															seminarscount = '$seminarscount', 
															labs = '$labs', 
															labscount = '$labscount', 
															individual = '$individual',
															practice = '$practice',
															zach = '$zach', 
															zach_count = '$zach_count', 
															difzach = '$difzach', 
															exam = '$exam',
															subfaculty_for = '$subfac',
															subfaculty_for_id = '$subfac_id',
															speciality_for = '$spec',
															lecturescount='$lecturescount'
								 WHERE program_id='$uuid' ") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
			die("Ошибка");
			}
	
			if (!$pg->_query("UPDATE dis SET discipline_code = '$code',
														discipline_titleshort = '$titleShort', 
														discipline_title = '$title',
														subfaculty = '$subfaculty',
														subfaculty_id = '$subfaculty_id'
								 WHERE discipline_id = (SELECT discipline_id FROM prog WHERE 
								 								program_id='$uuid') ") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
	
			if (!$pg->_query("UPDATE memo SET annotation = '$memo', 
															lectures = '$lecturesMemo',
															seminars = '$seminarsMemo', 
															labs = '$labsMemo', 
															individual = '$individualMemo',
															literature = '$literatureMemo',
															dz = '$dzMemo',
															kr = '$krMemo',
															rk = '$rkMemo',
															zach = '$zachMemo',
															difzach = '$difzachMemo',
															exam = '$examMemo'
								 WHERE program_id='$uuid'") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка");
			}
			// Добавляем языки
			$pg->_query("DELETE FROM lang WHERE f_id='$uuid'");
			foreach ($langs as $lang) {
				$lang_explode = explode(" / ", $lang);
				$query = "INSERT INTO lang (f_id, lang_first, lang_second) VALUES ('$uuid', '$lang_explode[0]', '$lang_explode[1]')";
				if (!$pg->_query($query) ) {
			    // Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить контрольную дисциплину");
				}
			}
			if (!isSignedProgram($_POST['program'])) {
			    // -------------- Сохраняем контрольные дисциплины ---------
			    $pg->_query("DELETE FROM control WHERE program_id='$uuid'");
			    $programId=$uuid;
			    $control=Array($choice1,$choice2,$choice3,$choice4,$choice5,$choice6,$choice7,$choice8,$choice9,
								$choice10,$choice11,$choice12,$choice13,$choice14,$choice15,$choice16,$choice17,$choice18,$choice19,$choice20,$choice21);		
//			    print_r($control);
//			    echo $weeks;
			    for ($i=1;$i<($weeks+1);$i++) if ($control[$i-1]) {		
				    $memo = ""; // Добавление аннотации возможно только при редактировании программы
				    $title = ""; // Добавление названия возможно только при редактировании программы
				    $week = $i;
				    $type = $control[$i-1];
				    $vol = $_POST['cvol'.($i)];
				    $pg->_query("SELECT uuid(1) as uuid");
				    $rez=$pg->_getResult();
				    $uuid=$rez['uuid'];
			    $query = "INSERT INTO control VALUES ('$uuid', '$type', '$title', '$week', '$memo', '$programId', '$vol')";
//			    print_r ($query);
				    if (!$pg->_query($query) ) {
			    // Отменяем изменения			
				    $pg->_query("ROLLBACK");
				    die("Ошибка: Невозможно добавить контрольную дисциплину");
			    	    }
			    }

			}
		// Сохраняем изменения		
		$pg->_query("COMMIT"); 
		echo "Изменения сохранены.";

	}
	
	if( $_POST["action"]=="insert" && (auth(8) || auth(1)) ) {
//print_r($_POST);
				$year=$_POST['year'];
				$semester=$_POST['semester'];
				$weeks=$_POST['weeks'];			
				$lectures=$_POST['lectures'];
				$lecturescount=$_POST['lecturescount'];
				$seminars=$_POST['seminars'];			
				$seminarscount=$_POST['seminarscount'];			
				$labs=$_POST['labs'];			
				$labscount=$_POST['labscount'];			
				$individual=$_POST['individual'];
				$practice=$_POST['practice'];
				$title=ereg_replace("\ {2,20}"," ",(trim($_POST['title'])));
				$titleShort=rtrim(ltrim($_POST['titleShort']));
				($_POST['zach']) ? $zach='t' :  $zach='f';			
				($_POST['zach_count']) ? $zach_count='t' :  $zach_count='f';			
				($_POST['difzach']) ? $difzach='t' :  $difzach='f';			
				($_POST['exam']) ? $exam='t' :  $exam='f';			
//				$uuid=$_POST['program'];				
				$subfac=$_POST['subfac'];				
				$subfaculty=$_POST['subfaculty'];
				$code=$_POST['discipline_code'];				
				$spec=$_POST['spec'];				
				$langs=$_POST['langs'];
				$memo=$_POST['memo'];				
				$lecturesMemo=$_POST['lecturesMemo'];	
				$seminarsMemo=$_POST['seminarsMemo'];			
				$labsMemo=$_POST['labsMemo'];			
				$individualMemo=$_POST['individualMemo'];
				$literatureMemo=$_POST['literatureMemo'];
				$zdMemo=$_POST['zdMemo'];
				$krMemo=$_POST['krMemo'];
				$rkMemo=$_POST['rkMemo'];
				$zachMemo=$_POST['zachMemo'];
				$difzachMemo=$_POST['difzachMemo'];
				$examMemo=$_POST['examMemo'];
			$pg = new pgsql();
			// Получаем ID кафедры
			// echo "insert";
			
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
	
			// -------------- Добавляем дисциплину ---------------------		
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
			if (!$pg->_query("INSERT INTO dis
							 VALUES ('$uuid', '$titleShort', '$title', '$subfaculty', '$code')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
	
			$disciplineId=$uuid;
			// ---------------------------------------------------------
	
			// -------------- Добавляем программу ----------------------
			$memo = ""; // Добавление аннотации возможно только при редактировании программы
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
//			$year=$_POST['year'];
			if (!$zach) $zach=0;
			if (!$difzach) $difzach=0;
			if (!$exam) $exam=0;
			if (!$pg->_query("INSERT INTO prog
							 	  VALUES ('$uuid', '$year', '$semester', '$weeks', 
							 	  			 '$lectures', '$seminars', '$labs', '$labscount', '$individual',
							 	  			 '$zach', '$difzach', '$exam', '$disciplineId',
							 	  			 '$subfac', '$spec', '$seminarscount', DEFAULT, '$practice', DEFAULT, 
							 	  			 '$lang_first', '$lang_second', '$lecturescount','$course_project','$zach_count')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно создать программу дисциплины");
			}
	
			$programId=$uuid;
			// ---------------------------------------------------------

			// ------- Добавляем языки --------
			foreach ($langs as $lang) {
				$lang_explode = explode(" / ", $lang);
				$query = "INSERT INTO lang (f_id, lang_first, lang_second) VALUES ('$programId', '$lang_explode[0]', '$lang_explode[1]')";
				if (!$pg->_query($query) ) {
			    // Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить контрольную дисциплину");
				}
			}

			// ------- Добавляем содержательную часть программы --------
			$pg->_query("SELECT uuid(1) as uuid");
			$rez=$pg->_getResult();
			$uuid=$rez['uuid'];
			if (!$pg->_query("INSERT INTO memo (memo_id, program_id)
							 	  VALUES ('$uuid', '$programId')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно создать программу дисциплины");
			}
			// ---------------------------------------------------------

			// ------- Добавляем запись в таблицу состояния --------
			if (!$pg->_query("INSERT INTO prog_status (created, created_date, program_id) VALUES (1,now(),'".$programId."')") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить дисциплину");
			}
			// ---------------------------------------------------------

			// -------------- Добавляем контрольные дисциплины ---------
			$control=Array($choice1,$choice2,$choice3,$choice4,$choice5,$choice6,$choice7,$choice8,$choice9,
								$choice10,$choice11,$choice12,$choice13,$choice14,$choice15,$choice16,$choice17);		
			for ($i=1;$i<($weeks+1);$i++) if ($control[$i-1]) {		
				$memo = ""; // Добавление аннотации возможно только при редактировании программы
				$title = ""; // Добавление названия возможно только при редактировании программы
				$week = $i;
				$type = $control[$i-1];
				$vol = $_POST['cvol'.($i)];
				$pg->_query("SELECT uuid(1) as uuid");
				$rez=$pg->_getResult();
				$uuid=$rez['uuid'];
				if (!$pg->_query("INSERT INTO control
								 	  VALUES ('$uuid', '$type', '$title', '$week', '$memo', '$programId', '$vol' )") ) {
			// Отменяем изменения			
				$pg->_query("ROLLBACK");
				die("Ошибка: Невозможно добавить контрольную дисциплину");
				}
			}
		// Сохраняем изменения			
		$pg->_query("COMMIT");
		echo "Программа дисциплины успешно создана.";
	}
}
elseif($_GET["section"]=="short")
{
//	$doc->otrForm($_GET["section"],0);

	if($_GET["subfaculty"] && !$_GET["program"] && !$_GET["spec"] && !$_GET["lang_first"] && !$_GET["lang_second"]) $doc->otrSelect($_GET["section"]);
	if($_GET["spec"]) 
	{
		switch($_GET["action"])
		{
			case 'view': $act=0; break;
			case 'km': $act=1; break;
			case 'stuf': $act=2; break;
			case 'ze': $act=3; break;
			case 'view_km': $act=4; break;
			case 'copy_all': $act=10; break;
			case 'chg_spec' : $act=20; break;
			case 'otr_delete': $act=30; break;
			default: $act=1; break;
		}
		if ($act < 10) {
		    $doc->otrForm($_GET["section"],$act, $_GET["year"]);
		//    if ($year > 2007) $doc->otrForm($_GET["section"],$act, ($_GET["year"]-1));
		}
		else if ($act >= 10 && $act <20 ) {
		    $doc->otrCopy($_GET["section"],$_GET["action"]);
		}
		else if ($act >= 20 && $act<30) {
		    $doc->otrAdmin($_GET["section"], $_GET["action"], $_GET["year"]);
		}
		else if($act==30)
		{
			if($_GET["spec"] && $_GET["sem"] && $_GET["subfaculty"] && $_GET["year"] && $_GET["lang_first"] && $_GET["lang_second"])
			{
			$pg = new pgsql();
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
				$query = "DELETE FROM lang WHERE f_id IN (SELECT program_id as f_id FROM prog 
							WHERE semester='".$_GET["sem"]."'
							and speciality_for='".$_GET["spec"]."'
							and f_id = program_id
							and subfaculty_for='".$_GET["subfaculty"]."'
							and lang_first='".$_GET["lang_first"]."'
							and lang_second='".$_GET["lang_second"]."'
							and year='".$_GET["year"]."')";

//					echo $query;
				if (!$pg->_query($query))
				{
					$pg->_query("ROLLBACK");
					echo $query;
					return 1;
				}

				$query = "DELETE FROM prog WHERE semester='".$_GET["sem"]."'
							and speciality_for='".$_GET["spec"]."'
							and subfaculty_for='".$_GET["subfaculty"]."'
							and year='".$_GET["year"]."'
							and program_id NOT IN (SELECT f_id FROM lang)";

	//				echo $query;
				if (!$pg->_query($query))
				{
					$pg->_query("ROLLBACK");
					echo $query;
					return 1;
				}
//			$pg->_query("ROLLBACK");
			$pg->_query("COMMIT");
        echo "Изменения сохранены.";
			}
		else { echo "Невозможно выполнить вопрос!"; }
		}
	}
}
elseif($_GET["section"]=="plan")
{
	if($_GET["langs"]) {
		$lang=explode(" - ", $_GET["langs"]);
		$_GET["lang_first"] = $lang[0];
		$_GET["lang_second"] = $lang[1];
	}
	if($_GET["subfaculty"] && !$_GET["spec"] && !$_GET["lang_first"] && !$_GET["lang_second"]) { 
		$doc->specSelect($_GET["section"]);
	}
	else 
		$doc->planForm($_GET["section"],$act);
}
elseif($_POST["section"]=="chg_spec_commit")
{
	if($_POST["speciality"] && $_POST["spec"] && $_POST["sem"] && $_POST["subfaculty"] && $_POST["year"])
	{
	    $speciality = $_POST["speciality"];
    	    $pg = new pgsql();
	    $pg->_query("START TRANSACTION");
	    if (!$pg->_query("UPDATE prog SET speciality_for='$speciality' 
			 WHERE semester='".$_POST["sem"]."'
			 and speciality_for='".$_POST["spec"]."'
			 and subfaculty_for='".$_POST["subfaculty"]."'
			 and year='".$_POST["year"]."'") )
			{
				$pg->_query("ROLLBACK");
                                die("Ошибка");
                        }
        $pg->_query("COMMIT");
        echo "Изменения сохранены.";
//        $doc->otrForm($_POST["year"]);
	}
	else
    	    echo "Не хватает данных: ".$_POST["speciality"]." - ".$_POST["spec"]." - ".$_POST["sem"]." - ".$_POST["subfaculty"]." - ".$_POST["year"];
}
elseif($_POST["section"]=="copy_all")
{
	if($_POST["spec"] && $_POST["sem"] && $_POST["subfac"] && $_POST["year"] && $_POST["lang_first"] && $_POST["lang_second"] && $_POST["lang_first_old"] && $_POST["lang_second_old"])
	{
		if ($_POST["planCopy"]) 
			$sem_query=''; 
		else 
			$sem_query="semester='".$_POST["sem"]."' AND";
		
			$sql = "SELECT * from prog, lang WHERE $sem_query 
							speciality_for='".$_POST["spec"]."'
							and f_id = program_id
							and subfaculty_for='".$_POST["subfaculty"]."'
							and lang_first='".$_POST["lang_first_old"]."'
							and lang_second='".$_POST["lang_second_old"]."'
							and year='".$_POST["year"]."'";
							
//			echo $sql; die;
			$pg = new pgsql();
			$rez_array = Array();
			$i = 0;
			// Ничинаем транзакцию
			$pg->_query("START TRANSACTION");
			$pg->_query($sql);
			while ($rez=$pg->_getResultArray())
			{
				$prog_array[$i] = $rez;
				$i++;
			}
			$k = 0;
			for ($j=0;$j<$i;$j++)
			{
				$pg->_query("SELECT * from dis WHERE discipline_id = (SELECT discipline_id FROM prog WHERE program_id='".$prog_array[$j]["program_id"]."')");
					while ($rez=$pg->_getResultArray())
					{
						$dis_array[$k] = $rez;
						$k++;
					}
				$pg->_query("SELECT uuid(1) as uuid");
				$rez=$pg->_getResult();
				$prog_array[$j]["program_id"]=$rez["uuid"];
				$prog_array[$j]["speciality_for"]=$_POST["spec_all"];
				$prog_array[$j]["subfaculty_for"]=$_POST["subfac"];
//				$prog_array[$j]["lang_first"]=$_POST["lang_first"];
//				$prog_array[$j]["lang_second"]=$_POST["lang_second"];
				
			}
			for ($l=0;$l<$k;$l++)
			{
				$pg->_query("SELECT uuid(1) as uuid");
				$rez=$pg->_getResult();
				$dis_array[$l]["discipline_id"]=$rez["uuid"];
				$prog_array[$l]["discipline_id"]=$rez["uuid"];
			}
			for ($n=0;$n<$k;$n++)
			{
				$len = 0;
				$cnt = count($dis_array[$n]);				
				$insert = '';
				$insert .="INSERT INTO dis VALUES ("; 					
				foreach (array_keys($dis_array[$n]) as $key) {
					$insert .= "'".$dis_array[$n][$key]."'";
					($len<($cnt-1))?$insert .= ",":"";
					$len++;
				}
				$insert .= ")";
				if (!$pg->_query($insert))
				{
					$pg->_query("ROLLBACK");
					echo $insert;
					return 1;
				}
			}
			for ($n=0;$n<$k;$n++)
			{
				$len = 0;
				$cnt = count($prog_array[$n])-4;
				$insert = '';
				$insert .="INSERT INTO prog VALUES ("; 					
				foreach (array_keys($prog_array[$n]) as $key) {
					$insert .= "'".$prog_array[$n][$key]."'";
					($len<($cnt-1))?$insert .= ",":"";
					$len++;
					if ($len == $cnt) break;
				}
				$insert .= ")";
				if (!$pg->_query($insert))
				{
					$pg->_query("ROLLBACK");
					echo $insert;
					return 1;
				}
				$insert="INSERT INTO lang (f_id, lang_first, lang_second) VALUES ('".$prog_array[$n]["program_id"]."', '".$_POST["lang_first"]."', '".$_POST["lang_second"]."')";
				if (!$pg->_query($insert))
				{
					$pg->_query("ROLLBACK");
					echo $insert;
					return 1;
				}
				if (!$pg->_query("INSERT INTO prog_status (id, program_id, created, created_date) VALUES (uuid(1), '".$prog_array[$n]["program_id"]."', '1', now())"))
				{
					$pg->_query("ROLLBACK");
					echo $insert;
					return 1;
				}
				$pg->_query("SELECT uuid(1) as uuid");
				$rez=$pg->_getResult();
				if (!$pg->_query("INSERT INTO memo (memo_id, program_id) VALUES (uuid(1), '".$prog_array[$n]["program_id"]."')"))
				{
					$pg->_query("ROLLBACK");
					echo $insert;
					return 1;
				}
			}
			
//			$pg->_query("ROLLBACK");
			$pg->_query("COMMIT");
			
			$_POST["section"]="short";
			$_POST["action"]="view";
/*			echo "<pre>";
			var_dump($dis_array);
			var_dump($prog_array);
			echo "</pre>";*/

		$doc->otrSelect($act);
		echo "Ваш запрос выполнен успешно";
	}
	else
	{
		echo "Невозможно выполнить вопрос!";
	}
}

?>
