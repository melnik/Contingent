<?php
	function progSelect($action="view") {
	$sel=Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);
	$query = "SELECT prog.program_id as id, discipline_title as title, semester, subfaculty_for as subfac, speciality_for as spec FROM dis INNER JOIN prog ON (prog.discipline_id=dis.discipline_id) INNER JOIN prog_status ON (prog_status.program_id = prog.program_id) WHERE replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' AND year = $this->year AND deleted = ".(($action=='trash')?1:0)." ORDER BY semester, title, subfac";
//		$this->_form("select", "index.php");
		echo "<div id='progList'>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=9');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query($query);
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Для специальности","","","colspan='3'");
					$this->_th("Действие","","","rowspan='2' colspan='3'");
				$this->_utr();		
				$this->_tr();
					$this->_th("ОКСО");
					$this->_th("Специализация");
					$this->_th("Квалификация");
				$this->_utr();		
							while ($rez=$pg->_getResult()) {
						$this->_tr('',$rez['id']);
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['title']."</a><br>");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['subfac']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],0,6)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],6,2)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],8,2)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=edit><img src='img/b_edit.png' alt='Изменить' title='Изменить'></a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=copy><img src='img/b_copy.png' alt='Создать копию' title='Создать копию'></a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=delete><img src='img/b_drop.png' alt='Удалить' title='Удалить'></a><br>","","","align='center'");
						$this->_utr();
						}
			$this->_utable();
			$this->_table();
						$this->_tr();
							$this->_ctd("<a href=# onClick=printDoc('progList');>Печать</a>");
						$this->_utr();
			$this->_utable();
		echo "</div>";
	}
?>