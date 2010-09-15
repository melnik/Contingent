<?php
/* Класс: menu
 * Назначение: Обеспечивает формирование тела HTML документа
 * Отвечеат за отображение главного меню
 *
 * Версия: 0.1
 */
$semester=$weeks=$lectures=$seminars=$seminarscount=$labs=$labscount=$individual=$zach=$zach_count=$difzach=$exam=$memo=$uuid=$subfac=$spec=$lang_first=$lang_second=0;

if ($_POST["program"]) $_GET["program"]=$_POST["program"];
if ($_POST["subfaculty"]) $_GET["subfaculty"]=$_POST["subfaculty"];
if ($_POST["section"]) $_GET["section"]=$_POST["section"];


require_once('auth.php');
require_once('pgsql.class.php');
require_once('html.class.php');
//include_once("class_xquery_lite.php");

date_default_timezone_set("Europe/Moscow");

class menu extends html {
	public	$year=0;
	public	$href='';
	
	function __construct($title="HTML документ", $enc="utf-8", $style="css/style.css") {
		if ($_SESSION["role"]=='subfaculty') {
    		    $pg = new pgsql();
		    $pg->_query("SELECT max(year) as year FROM year WHERE closed = '0'");
		    $rez=$pg->_getResult();
		    $this->year=$rez["year"];
		}
		else 
		    $this->year = ($_POST["year"]) ? $_POST["year"] : (($_GET["year"]) ? $_GET["year"] : date("Y") );
		$this->href.="?year=".$this->year;
		parent::__construct($title, $enc, $style);	
?>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table1" height="100%">
	<tr>
		<td width="15" height="15">
			<img src="img/page_01.gif" width="15" height="15" alt=""></td>
		<td background="img/page_02.gif" colspan="3" width="100%"></td>
		<td width="15" height="15">
			<img src="img/page_04.gif" width="15" height="15" alt=""></td>
	</tr>
	<tr>
		<td background="img/page_05.gif" rowspan="4">&nbsp;</td>
		<td valign="top" colspan="3" height="95" width=100%>
                <div id="top">
                        <div class="bluebar blue-l"><div></div></div>
                        <div class="bluebar blue-r"><div></div></div>
                        <div class="div_logo no-print">
                                <div id="eulogo">
                                        <img src="/eu/i/eulogo.png" alt="Электронный университет"/>
                                </div>
                                <div class="bmstu" style="font-size:14px;top:10px;">Московский государственный лингвистический университет</div>
                                <div class="euinfo">
                                        Система управления учебной деятельностью
                                        <!--wbr class="typo"><span class="slaquo-s typo"> </span><b> <span class="hlaquo-s typo">&laquo;</span>Электронный университет&raquo;</b-->
                                </div>
                        </div>
                        <div id="mainmenu">
                                <ul>
                                        <li><div class="menuimg"><div style="left:0px;"></div></div><a href="/eu/?action=index">Общая информация</a></li>
                                        <li><div class="menuimg"><div style="left:-16px;"></div></div><a href="/eu/?action=help">Справочные модули</a></li>
                                        <li><div class="menuimg"><div style="left:-32px;"></div></div><a href="/eu/?action=stat">Статистика</a></li>
                                        <li><div class="menuimg"><div style="left:-48px;"></div></div><a href="/eu/?action=info">Информационные модули</a></li>
                                </ul>
                        </div>
                        <div id="authform">
				<table width="100%">
				<TR>
					<TD><?php echo $title; ?></TD>
					<TD><a href='plan.pdf'>Инструкция</a></TD>
					<td><?php (!isset( $_SESSION["name"] )) ? print ("<a href=\"login.php\">Вход</a>") : print ($_SESSION['name']."(<a href=\"index.php?action=logout\">Выход</a>)"); ?></td>
					<TD><?php 
					if (auth(1)) {
		        		    $pg = new pgsql();
					    $pg->_query("SELECT closed FROM year WHERE year='".$this->year."'");
					    $rez=$pg->_getResult();
					    if (!$rez["closed"])
    					    echo "<nobr><a href='?year=$this->year&action=close' onClick='return window.confirm(\"Вы уверены, что хотите закрыть учебный год?\")'>Закрыть $this->year год</a></nobr>"; 
//					    if (date(n)==12)
//    					    echo "<nobr><a href='?year=$this->year&action=close'>Закрыть $this->year год</a></nobr>"; 
					}
					?></TD>
					<?php 
					    if ($_SESSION["role"]=='subfaculty') echo "<td width='40px'><nobr>".$this->year."/".($this->year+1)."</nobr></td>";
					    else {
						echo "<TD width='10px' align='center'><a href='?year=".($this->year-1)."'><</a></TD>";
						echo "<TD width='20px' align='center'>".$this->year."/".($this->year+1)."</TD>";
    						echo "<TD width='10px' align='center'><a href='?year=".($this->year+1)."'>></a></TD>";
					}
					?>
				</TR>
				</table>
                        </div>
                </div>
		
<?php /*
		<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table5" background="img/page_08.gif" height="60">
      	<tr>
         	<td rowspan="2" width="388" height="95">
            	<img src="img/page_06.gif" width="388" height="95" alt=""></td>
            <td align="center" valign="top">
            	<a href=https://e-u.bmstu.ru/eu/><img src="img/page_13.gif" width="145" height="50" alt="" style="margin-top:5px"></a></td>
            <td align="center" valign="top">
               <a href=https://e-u.bmstu.ru/eu/?action=help><img src="img/page_15.gif" width="145" height="50" alt="" style="margin-top:5px"></a></td>
            <td align="center" valign="top">
            	<a href=https://e-u.bmstu.ru/eu/?action=info><img src="img/page_17.gif" width="145" height="50" alt="" style="margin-top:5px"></a></td>
            <td rowspan="2" width="4" height="95">
               <img src="img/page_09.gif" width="4" height="95" alt=""></td>
          </tr>
          <tr>
			<td colspan="3" height="30">
				<table width="100%">
				<TR>
					<TD><?php echo $title; ?></TD>
					<TD><a href='plan.pdf'>Инструкция</a></TD>
					<td><?php (!isset( $_SESSION["name"] )) ? print ("<a href=\"login.php\">Вход</a>") : print ($_SESSION['name']."(<a href=\"index.php?action=logout\">Выход</a>)"); ?></td>
					<TD><?php 
					if (auth(1)) {
		        		    $pg = new pgsql();
					    $pg->_query("SELECT closed FROM year WHERE year='".$this->year."'");
					    $rez=$pg->_getResult();
					    if (!$rez["closed"])
    					    echo "<nobr><a href='?year=$this->year&action=close'>Закрыть $this->year год</a></nobr>"; 
//					    if (date(n)==12)
//    					    echo "<nobr><a href='?year=$this->year&action=close'>Закрыть $this->year год</a></nobr>"; 
					}
					?></TD>
					<?php 
					    if ($_SESSION["role"]=='subfaculty') echo "<td width='40px'><nobr>".$this->year."/".($this->year+1)."</nobr></td>";
					    else {
						echo "<TD width='10px' align='center'><a href='?year=".($this->year-1)."'><</a></TD>";
						echo "<TD width='20px' align='center'>".((auth(1)) ? "<a href='?year=".$this->year."&action=organize'>".$this->year."/".($this->year+1)."</a>" : $this->year."/".($this->year+1))."</TD>";
    						echo "<TD width='10px' align='center'><a href='?year=".($this->year+1)."'>></a></TD>";
					}
					?>
				</TR>
				</table>
			</td>
			</tr>
		</table>
*/ ?>
		
		
		</td>
		<td background="img/page_10.gif" rowspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="4" height="4"><img src="img/page_20.gif" width="4" height="4" alt=""></td>
		<td valign="top" width="100%" background="img/page_22.gif"></td>
		<td valign="top" width="4" height="4"><img src="img/page_23.gif" width="4" height="4" alt=""></td>
	</tr>
	<tr>
		<td valign="top" width="4" background="img/page_24.gif"></td>
		<td valign="top" background="img/page_28.gif" style="background-repeat:repeat-x">

		<table border="0" height=100% cellpadding="0" cellspacing="0" width="100%" id="table9">
			<tr>
				<td background="img/page_33.gif">
		  		<table border="0" cellpadding="0" cellspacing="0">
   				<tr class=topmenu>
   					<?php					
			$this->_buttonGrey("index.php".$this->href."&section=prog".($_GET["subfaculty"]?"&action=view&subfaculty=".$_GET["subfaculty"]:""),"Программы","prog");
			$this->_buttonGrey("index.php".$this->href."&section=short".($_GET["subfaculty"]?"&subfaculty=".$_GET["subfaculty"]:""),"Отрезки","short");
			$this->_buttonGrey("index.php".$this->href."&section=plan".($_GET["subfaculty"]?"&subfaculty=".$_GET["subfaculty"]:""),"Планы","plan");
			if ( auth(1) ) $this->_buttonGrey("index.php".$this->href."&section=prog&action=recordAdmin","Служебные записки","recordAdmin");
						?>
       			</tr>
	 			</table>
				</td>
				<td>&nbsp;</td>
				<td background="img/page_33.gif" width="100%">
		  		<table border="0" cellpadding="0" cellspacing="0" >
   				<tr class=topmenu>
   					<?php					
//		$pg = new pgsql();

/*		if (!$_GET["faculty"] && !$_GET["subfaculty"]) {
			$pg->_query("SELECT faculty_id as id, faculty_index as index, faculty_title as title FROM faculty");
			while ($res=$pg->_getResult()) {
			$this->tdButton("index.php?faculty=".$res['id'],$res['index']);
			}
		}
		if ($_GET["faculty"] && !$_GET["subfaculty"]) {
			$pg->_query("SELECT subfaculty_id as id, subfaculty_index as index, subfaculty_title as title FROM subfaculty WHERE faculty_id='".$_GET["faculty"]."'");
			while ($res=$pg->_getResult()) {
//			$this->tdButton("index.php?faculty=".$_GET["faculty"]."&subfaculty=".$res['id'],$res['index']);
			$this->tdButton("index.php?subfaculty=".$res['id'],$res['index']);
			}
		} 
*/
		$href='';
		($_GET["section"]) ? $href=$href."&section=".$_GET["section"] : "";			

		($_POST["action"]=="commitEdit")?$anchor="#".$_GET["program"]:$anchor="";
		
		if (($_GET["program"] || $_GET["subfaculty"]) && $_GET["section"]=="prog") {
			($_GET["program"] && $_GET["action"]!="delete" && $_GET["action"]!="copy") ? $href=$href."&program=".$_GET["program"]:"";
			($_GET["program"]) ? $this->tdButton("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=view".$anchor,"Список") : "";
			if (auth(1) || auth(8))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=add","Добавить","add");
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=view","Посмотреть","view");
			if (!$_GET["program"]) {
				if (auth(1) || auth(8)) {
					$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=edit","Изменить","edit");
					$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=delete","Удалить","delete");
				}
			}
			elseif (auth(1) || (auth(8) && !isSignedProgram($_GET["program"]))) {
				$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=edit","Изменить","edit");
				$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=delete onClick='return window.confirm(\"Вы уверены?\")'","Удалить","delete");
			}
			if ($_GET["program"]) 
			{	
				if ( (auth(1) || auth(8)) && !isSignedProgram($_GET["program"]))
				$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=sign","Утвердить","sign");
				if (auth(1))
				$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=setCopy","Копирование программы","setCopy");
				if (auth(1) || auth(8))
				$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=copy","Копия","copy");
// Переход в отрезки невозможен т.к. у программы много языков
/*				$pg = new pgsql();
				$pg->_query("SELECT semester as sem, speciality_for as spec, subfaculty_for as subfac, lang_first, lang_second FROM prog
			 						WHERE program_id='".$_GET["program"]."'"
			 				  );
			 	$rez=$pg->_getResult();
			 	$sem=$rez["sem"];
			 	$spec=$rez["spec"];
			 	$subfac=$rez["subfac"];
			 	$lang_first=$rez["lang_first"];
			 	$lang_second=$rez["lang_second"];
				$this->_button("index.php".$this->href."&sem=$sem&spec=$spec&lang_first=$lang_first&lang_second=$lang_second&subfaculty=$subfac&section=short&action=view","в Отрезки","viewOtr");
*/			}
			if (auth(1))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=reindex","Индекс","reindex");
			//if (auth(1) || auth(8))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=km","Сравнение КМ","km");
			if (auth(1))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=statistics","Статистика","statistics");
			if (auth(1) || auth(8))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=trash","Удаленные","trash");
//			if (auth(1) || auth(8))
//			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=for_sign","на Утверждение","for_sign");
			if (auth(8))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=record","Составить служебную записку","record");
			if (auth(8))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=print","Распечатать","print");
		}
			
		elseif ($_GET["subfaculty"] && $_GET["spec"] && $_GET["section"]=="short") {
		($_GET["spec"] && $_GET["lang_first"] && $_GET["lang_second"] ) ? $href.="&sem=".$_GET["sem"]."&spec=".$_GET["spec"]."&lang_first=".$_GET["lang_first"]."&lang_second=".$_GET["lang_second"] : "";			
//		sem=1&spec=2301020065&subfaculty=%E9%F5-5&section=short
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=view","Часы","view");
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=km","Контрольные мероприятия","km");
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=ze","Зачетные единицы","ze");
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=view_km","Часы + контрольные мероприятия","view_km");
			if (auth(1))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=copy_all","Копия","copy_all");
			if (auth(1))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=chg_spec","Изменить спациальность","chg_spec");
			if (auth(1))
			$this->_button("index.php".$this->href."&subfaculty=".$_GET["subfaculty"].$href."&action=otr_delete  onClick='return window.confirm(\"Вы уверены?\")'","Удалить","otr_delete");
		}
						?>
       			</tr>
	 			</table>
				</td>
				<td width="5"><img src="img/page_40_grey.gif" width="5" height="21" alt=""></td>
	 		</tr>
			<tr>
				<td background="img/page_51_grey.gif" style="background-repeat:repeat-y;padding:10px" bgcolor=#e8e8e8 class=content height=100% valign=top>
<?php
	$this->_table('','main_tab','width=150px border=0');
		$this->_tr();
			$this->_td('','main','width=200px');
				echo $this->toKOI($this->MakeMenuForInsert());
//				echo "struct";
			$this->_utd();
		$this->_utr();
	$this->_utable();
?>
				<td width="5" background="img/page_55_grey.gif" valign=top><img src="img/page_50_grey.gif" width="5" height="3" alt=""></td>
				<td background="img/page_51.gif" style="background-repeat:repeat-y;padding:10px" bgcolor=white class=content height=100% valign=top>
<?php
	$this->_table('','main_tab','width=100% border=0');
		$this->_tr();
			$this->_td();
	}

	function __destruct() {
			$this->_utd();
		$this->_utr();
	$this->_utable();
   ?>
				<td width="5" background="img/page_55.gif" valign=top><img src="img/page_50.gif" width="5" height="3" alt=""></td>
			</tr>
			<tr>
				<td  height="5" background="img/page_60.gif">
			<img src="img/page_59.gif" width="5" height="5" alt=""></td>
				<td width="5">
			<img src="img/page_62.gif" width="5" height="5" alt=""></td>
				<td  height="5" background="img/page_60.gif">
			<img src="img/page_59.gif" width="5" height="5" alt=""></td>
				<td width="5">
			<img src="img/page_62.gif" width="5" height="5" alt=""></td>
			</tr>
   			</td>
	 		</tr>
	   </table>
		</td>
		<td valign="top" background="img/page_41.gif"></td>
	</tr>
	<tr>
		<td valign="top" height="34" colspan="3">
		<table valign="top" border="0" cellpadding="0" cellspacing="0" width="100%" id="table4">
			<tr>
				<td width="4" height="34" >
			<img src="img/page_72.gif" width="4" height="34" alt=""></td>
				<td background="img/page_74.gif">
				<div style="height:34px;padding-left:294;background-image:url(img/page_73.gif);background-repeat:no-repeat;padding-top:12px">
					<b>Разработано в ОИИС</b></div>
			</td>
				<td width="4"><img src="img/page_76.gif" width="4" height="34" alt=""></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="15" height="15">
			<img src="img/page_77.gif" width="15" height="15" alt=""></td>
		<td background="img/page_78.gif" colspan="3"></td>
		<td width="15" height="15">
			<img src="img/page_80.gif" width="15" height="15" alt=""></td>
	</tr>
</table>
<?php
		parent::__destruct();	
	}
	
	function tdButton($link, $title, $action='')
	{
		$title="<nobr>".$title."</nobr>";
		echo "<td><img src='img/page_29.gif' width=5 height=21></td>\n";
		echo "<td background='img/page_31.gif'>";
		echo "<a href=$link $action>$title</a></td>\n";
		echo "<td><img src='img/page_32.gif' width=5 height=21></td>";
		echo "<td width=5>&nbsp;</td>\n";
	}
	
	function tdButtonSel($link, $title, $action='')
	{
		$title="<nobr>".$title."</nobr>";
		echo "<td><img src='img/page_34.gif' width=5 height=21></td>\n";
		echo "<td background='img/page_36.gif'>";
		echo "<a href=$link $action>$title</a></td>\n";
		echo "<td><img src='img/page_37.gif' width=5 height=21></td>";
		echo "<td width=5>&nbsp;</td>\n";
	}
	
	function tdButtonGrey($link, $title, $action='')
	{
		$title="<nobr>".$title."</nobr>";
		echo "<td><img src='img/page_29_grey.gif' width=5 height=21></td>\n";
		echo "<td background='img/page_31_grey.gif'>";
		echo "<a href=$link $action>$title</a></td>\n";
		echo "<td><img src='img/page_32_grey.gif' width=5 height=21></td>";
		echo "<td width=5>&nbsp;</td>\n";
	}
	
	function tdButtonSelGrey($link, $title, $action='')
	{
		$title="<nobr>".$title."</nobr>";
		echo "<td><img src='img/page_34_grey.gif' width=5 height=21></td>\n";
		echo "<td background='img/page_36_grey.gif'>";
		echo "<a href=$link $action>$title</a></td>\n";
		echo "<td><img src='img/page_37_grey.gif' width=5 height=21></td>";
		echo "<td width=5>&nbsp;</td>\n";
	}

/*------------------------------------------------------
 *
 * Управление сроками проведения занятив в учебном году
 *
 *------------------------------------------------------
 */
        function organize($year) {
                if (auth(1)) { // Только администратор
                $query = "SELECT count(*) as cnt, id FROM year WHERE year='$year' GROUP BY id";
                $pg = new pgsql();
                $pg->_query($query);
                $rez=$pg->_getResult();
                if (!$rez["cnt"]) die("$year год не существует!");
                $id = $rez["id"];
                $this->_form("organizeCommit", "index.php","post");
                        $this->_table('','',"width=100% class='spisok'");
                                $this->_tr();
                                        $this->_th("Организация учебного процесса в ".$year."/".($year+1)." учебном году",'','','colspan=13');
                                $this->_utr();
                                $this->_tr();
                                        $this->_th("Семестр",'','','rowspan=2');
                                        $this->_th("Количество недель",'','','rowspan=2');
                                        $this->_th("Теоретические занятия",'','','colspan=2');
                                        $this->_th("Зачеты",'','','colspan=2');
                                        $this->_th("Экзамены",'','','colspan=2');
                                        $this->_th("Каникулы",'','','colspan=2');
//                                        $this->_th("Каникулы летние",'','','colspan=2');
                                        $this->_th("Действие",'','','rowspan=2');
                                $this->_utr();
                                $this->_tr();
                                        $this->_th("начало");
                                        $this->_th("конец");
                                        $this->_th("начало");
                                        $this->_th("конец");
                                        $this->_th("начало");
                                        $this->_th("конец");
                                        $this->_th("начало");
                                        $this->_th("конец");
//                                        $this->_th("начало");
//                                        $this->_th("конец");
                                $this->_utr();
                        $i=0;
                        $query = "SELECT * FROM year_organize WHERE f_id = '$id'";
                        $pg->_query($query);
                        while ($rez=$pg->_getResult()) {
                                $this->_tr();
                                        $this->_ctd($this->_inputText("semester$i",1,1,$rez["semester"]));
                                        $this->_ctd($this->_inputText("weeks$i",2,2,$rez["weeks"]));
                                        $this->_ctd($this->_inputText("theory_begin$i",10,10,$rez["theory_begin"]));
                                        $this->_ctd($this->_inputText("theory_end$i",10,10,$rez["theory_end"]));
                                        $this->_ctd($this->_inputText("tests_begin$i",10,10,$rez["tests_begin"]));
                                        $this->_ctd($this->_inputText("tests_end$i",10,10,$rez["tests_end"]));
                                        $this->_ctd($this->_inputText("exams_begin$i",10,10,$rez["exams_begin"]));
                                        $this->_ctd($this->_inputText("exams_end$i",10,10,$rez["exams_end"]));
                                        $this->_ctd($this->_inputText("h_begin$i",10,10,$rez["holidays_begin"]));
                                        $this->_ctd($this->_inputText("h_end$i",10,10,$rez["holidays_end"]));
//                                        $this->_ctd($this->_inputText("summer_h_begin$i",10,10,$rez["summer_h_begin"]));
//                                        $this->_ctd($this->_inputText("summer_h_end$i",10,10,$rez["summer_h_end"]));
                                        $this->_ctd("<a href=index.php?year=".$year."&organizeId=".$rez["id"]."&action=organizeDelete><img src='img/b_drop.png' alt='Удалить' title='Удалить'></a>");
                                        echo $this->_inputHidden("id$i", $rez["id"]);
                                $this->_utr();
                                $i++;
                        }
                                $this->_tr();
                                        $this->_ctd($this->_inputText("semester$i",1,1,''));
                                        $this->_ctd($this->_inputText("weeks$i",2,2,''));
                                        $this->_ctd($this->_inputText("theory_begin$i",10,10,''));
                                        $this->_ctd($this->_inputText("theory_end$i",10,10,''));
                                        $this->_ctd($this->_inputText("tests_begin$i",10,10,''));
                                        $this->_ctd($this->_inputText("tests_end$i",10,10,''));
                                        $this->_ctd($this->_inputText("exams_begin$i",10,10,''));
                                        $this->_ctd($this->_inputText("exams_end$i",10,10,''));
                                        $this->_ctd($this->_inputText("h_begin$i",10,10,''));
                                        $this->_ctd($this->_inputText("h_end$i",10,10,''));
//                                        $this->_ctd($this->_inputText("summer_h_begin$i",10,10,''));
//                                        $this->_ctd($this->_inputText("summer_h_end$i",10,10,''));
                                        $this->_ctd(" ");
                                $this->_utr();
                        $this->_utable();
                        echo $this->_inputHidden("count",++$i);
                        echo $this->_inputHidden("year",$year);
                        echo $this->_inputHidden("f_id",$id);
                        echo $this->_inputHidden("action","organizeCommit");
                $this->_uform("Сохранить");
                }
                else die("Вход воспрещен!");
        }

/*----------- Функции управления программой дисциплины	------------
 * Выводит список + действия
 */
	function progSelect($action="view") {
	$sel=Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);
	$subq = '';
	if (auth(8) && ($action=="edit" || $action=="delete")) $subq .= " AND prog_status.subfaculty=0 AND admin=0 "; 
	if (auth(8) && $action=="for_sign") $subq .= " AND prog_status.subfaculty=1 AND admin=0 AND parent_id != '00000000-0000-0000-0000-000000000000'"; 
	$sort = $_GET["sort"];
	switch ($sort) {
	    case "title": $query_sort = "title, subfac, semester"; break;
	    case "semester":
	    default: $query_sort = " semester, title, subfac";
	}
	$query = "SELECT prog.program_id as id, parent_id, discipline_title as title, 
				discipline_titleshort as titleshort, discipline_code as code, semester, 
				subfaculty_for as subfac, speciality_for as spec, prog_status.subfaculty as sub, 
				admin, record, record_number, record_date 
				FROM dis, prog, prog_status 
				WHERE year = $this->year 
				AND dis.subfaculty='".$_GET["subfaculty"]."' 
				AND deleted = ".(($action=='trash')?1:0).$subq." 
				AND prog.discipline_id=dis.discipline_id 
				AND prog_status.program_id = prog.program_id 
				ORDER BY $query_sort";
				
//	$query = "SELECT prog.program_id as id, parent_id, discipline_title as title, discipline_titleshort as titleshort, semester, subfaculty_for as subfac, speciality_for as spec, prog_status.subfaculty as sub, admin, record, record_number, record_date FROM dis, prog, prog_status  WHERE year = $this->year AND replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' AND deleted = ".(($action=='trash')?1:0).$subq." AND prog.discipline_id=dis.discipline_id AND prog_status.program_id = prog.program_id ORDER BY semester, title, subfac";
//		$this->_form("select", "index.php");
//print_r($query);
		echo "<div id='progList'>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					if ($action=="for_sign") 
					$this->_th("Программы дисциплин, в которые вносятся изменения (кафедра <span class='subfaculty'>".$_GET["subfaculty"]."</span>)",'','','colspan=9');
					else
					$this->_th("Программы дисциплин кафедры <span class='subfaculty'>".$_GET["subfaculty"]."</span>",'','','colspan=11');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query($query);
				$this->_tr();
//					$this->_th("Название","","","colspan='2'");
					$this->_th("Индекс");
					$this->_th("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=".$action."&sort=title>Название</a>");
					$this->_th("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&action=".$action."&sort=semester>Семестр</a>");
					$this->_th("Для кафедры");
					$this->_th("Для специальности");
					if (auth(8) || auth(1)) $this->_th("Действие","","","colspan='4'");
					if (auth(8) || auth(1)) $this->_th("Номер служебной записки");
				$this->_utr();		
				/*$this->_tr();
//					$this->_th("Полное");
//					$this->_th("Сокраценное");
					$this->_th("ОКСО");
					$this->_th("Специализация");
					$this->_th("Квалификация");
				$this->_utr();		*/
					while ($rez=$pg->_getResult()) {
					if ($rez['admin']) $class = "class='signed'";
					else if ($rez['sub']) $class = "class='sub'";
					else if ($rez['parent_id'] == '00000000-0000-0000-0000-000000000000') $class = "class='green'";
					else $class = "class='yellow'";
						$this->_tr('',$rez['id']);
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['code']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['title']."</a><br>",'','',$class);
//								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['titleshort']."</a><br>",'','',$class);
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action."><span class='subfaculty'>".$rez['subfac']."</span></a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action."><span class='speciality'>".$rez['spec']."</span></a><br>","","","align='center'");
// 								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],0,6)."</a><br>","","","align='center'");
// 								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],6,2)."</a><br>","","","align='center'");
// 								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=".$action.">".substr($rez['spec'],8,2)."</a><br>","","","align='center'");
								if (auth(8) || auth(1)) {
								    if ($action!="trash") {
								    $this->_ctd( ( !$rez['admin'] && !$rez['sub']) ? "<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=edit><img src='img/b_edit.png' alt='Изменить' title='Изменить'></a><br>" : (($action=="for_sign") ? "<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=un_sign><img src='img/b_undo.png' alt='Отменить подписание' title='Отменить подписание'></a><br>" : "") ,"","","align='center'");
								    $this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=copy><img src='img/b_copy.png' alt='Создать копию' title='Создать копию'></a><br>","","","align='center'");
								    $this->_ctd( ( !$rez['admin'] && !$rez['sub']) ? "<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=delete><img src='img/b_drop.png' alt='Удалить' title='Удалить'></a><br>" : "", "", "", "align='center'");
								    if ($rez['parent_id'] == '00000000-0000-0000-0000-000000000000' || $rez["record"] || $rez["admin"]) $this->_ctd(""); else $this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=undo><img src='img/b_undo.png' alt='Сделать как в прошлом году' title='Сделать как в прошлом году'></a><br>","","","align='center'");
								    } else {
								    if (!$rez['record'] || auth(1))
								    $this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=restore><img src='img/b_undo.png' alt='Восстановить' title='Восстановить'></a><br>","","","align='center'");
								    if ($rez['parent_id']=='00000000-0000-0000-0000-000000000000' || auth(1))
    								    $this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=commitDelete onClick='return window.confirm(\"Вы уверены?\")'><img src='img/b_drop.png' alt='Удалить' title='Удалить'></a><br>","","","align='center'");
    								    }
								    ($rez['record']) ? $this->_ctd("<a href=print.php".$this->href."&record_number=".$rez["record_number"]."&record_date=".$rez['record_date']."&action=zap>".$rez['record_number']."/".$rez['record_date']."</a><br>","","","align='center'") : $this->_ctd("") ;
								}
						$this->_utr();
						}
			$this->_utable();
			$this->_table();
						$this->_tr();
							$this->_ctd("<br><a href='print.php?action=plan&subfaculty=".$_GET["subfaculty"]."&year=".$_GET["year"]."')>Печать</a>");
						$this->_utr();
			$this->_utable();
		echo "</div>";
	}

	function progKM($action="km") {
	$sel=Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);
		echo "<div id='progList'>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=33');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT program_id as id, discipline_title as title, semester,
									   subfaculty_for as subfac, speciality_for as spec, lectures, 
									   seminars, labs, individual, weeks, zach, difzach, exam
									   FROM dis
				 						INNER JOIN prog ON (prog.discipline_id=dis.discipline_id)
				 						WHERE replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY semester, title, subfaculty_for" );
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Зач","","","rowspan='2'");
					$this->_th("Диф","","","rowspan='2'");
					$this->_th("Экз","","","rowspan='2'");
				$this->_th("АУДИТОРНЫХ", "", "", "colspan='4'");
				$this->_th("САМ", "", "", "rowspan='2'");
				$this->_th("В НЕДЕЛЮ", "", "", "colspan='2'");
					$this->_th("СРОКИ КОНТРОЛЬНЫХ МЕРОПРИЯТИЙ","","","colspan='21'");
			$this->_utr();
/*			$this->_tr();
			$this->_utr();
				$this->_utr();		
*/				$this->_tr();
				$this->_th("В<br>СЕМ");
				$this->_th("ЛЕК");
				$this->_th("УПР");
				$this->_th("ЛАБ");
				$this->_th("АУД");
				$this->_th("САМ");
					for ($i=1;$i<21;$i++) $this->_th($i);
				$this->_utr();
				
				$trans = Array (150,30,30,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15);
				$this->_tr();
				for ($n=0;$n<count($trans);$n++)
					$this->_th("<img src='img/trans.gif' height=1px width=".$trans[$n]."px border=0px hspace=0px vspace=0px>");
				$this->_utr();

				while ($rez=$pg->_getResult()) {
					$control = Array('','','','','','','','','','','','','','','','','','','','');
					$km = new pgsql();
					$km->_query("SELECT * FROM control 
				 						WHERE program_id = '".$rez['id']."'
				 					ORDER BY week" );
				 					while ($kmRez=$km->_getResult())
										$control[$kmRez['week']]=$kmRez['control_type'];
						$this->_tr('',"chgdis");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['title']."</a><br>");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['subfac']."</a><br>","","","align='center'");
								$this->_ctd(($rez['zach']=='t')?"+":"-");
								$this->_ctd(($rez['difzach']=='t')?"+":"-");
								$this->_ctd(($rez['exam']=='t')?"+":"-");
								$this->_ctd($rez["lectures"]+$rez["seminars"]+$rez["labs"]);								
								$this->_ctd($rez["lectures"]);								
								$this->_ctd($rez["seminars"]);								
								$this->_ctd($rez["labs"]);								
								$this->_ctd($rez["individual"]);								
				$nlec=($rez["lectures"]+$rez["seminars"]+$rez["labs"])/$rez["weeks"];
				$nind=$rez["individual"]/$rez["weeks"];				
								$this->_ctd(round($nlec,2),'','',(fmod(($rez["lectures"]+$rez["seminars"]+$rez["labs"]),$rez["weeks"]))?"class='td_red'":'');				
								$this->_ctd(round($nind,2),'','',(fmod($rez["individual"],$rez["weeks"]))?"class='td_red'":'');				
								for ($i=0;$i<20;$i++)
								$this->_ctd($control[$i+1]);
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

	function progStatistics($action="view") {
		echo "<div id='progList'>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=30');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT program_id as id, discipline_title as title, semester,
									   subfaculty_for as subfac, speciality_for as spec, lectures, 
									   seminars, labs, individual, weeks
									   FROM dis
				 						INNER JOIN prog ON (prog.discipline_id=dis.discipline_id)
				 						WHERE replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY semester, title, subfac" );
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Заполнение содержательной части","","","colspan='12'");
				$this->_utr();
				$this->_tr();
					$this->_th("Зач");
					$this->_th("Диф");
					$this->_th("Экз");
					$this->_th("Лек");
					$this->_th("Сем");
					$this->_th("Лаб");
					$this->_th("Сам");
					$this->_th("ДЗ");
					$this->_th("КР");
					$this->_th("РК");
					$this->_th("Аннот");
					$this->_th("Лит");
				$this->_utr();
				while ($rez=$pg->_getResult()) {
					$stat = new pgsql();
					$stat->_query("SELECT * FROM memo WHERE program_id = '".$rez['id']."'" );
				 					   $statRez=$stat->_getResult();
//										$control[$kmRez['week']]=$kmRez['control_type'];
						$this->_tr('',"chgdis");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['title']."</a><br>");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['subfac']."</a><br>","","","align='center'");
								(strlen($statRez['zach'])<200)?$this->_ctd(strlen($statRez['zach']),"","","class='red'"):$this->_ctd(strlen($statRez['zach'])) ;
								(strlen($statRez['difzach'])<200)?$this->_ctd(strlen($statRez['difzach']),"","","class='red'"):$this->_ctd(strlen($statRez['difzach'])) ;
								(strlen($statRez['exam'])<200)?$this->_ctd(strlen($statRez['exam']),"","","class='red'"):$this->_ctd(strlen($statRez['exam'])) ;
								(strlen($statRez['lectures'])<200)?$this->_ctd(strlen($statRez['lectures']),"","","class='red'"):$this->_ctd(strlen($statRez['lectures'])) ;
								(strlen($statRez['seminars'])<200)?$this->_ctd(strlen($statRez['seminars']),"","","class='red'"):$this->_ctd(strlen($statRez['seminars'])) ;
								(strlen($statRez['labs'])<200)?$this->_ctd(strlen($statRez['labs']),"","","class='red'"):$this->_ctd(strlen($statRez['labs'])) ;
								(strlen($statRez['individual'])<200)?$this->_ctd(strlen($statRez['individual']),"","","class='red'"):$this->_ctd(strlen($statRez['individual'])) ;
								(strlen($statRez['dz'])<200)?$this->_ctd(strlen($statRez['dz']),"","","class='red'"):$this->_ctd(strlen($statRez['dz'])) ;
								(strlen($statRez['kr'])<200)?$this->_ctd(strlen($statRez['kr']),"","","class='red'"):$this->_ctd(strlen($statRez['kr'])) ;
								(strlen($statRez['rk'])<200)?$this->_ctd(strlen($statRez['rk']),"","","class='red'"):$this->_ctd(strlen($statRez['rk'])) ;
								(strlen($statRez['annotation'])<200)?$this->_ctd(strlen($statRez['annotation']),"","","class='red'"):$this->_ctd(strlen($statRez['annotation'])) ;
								(strlen($statRez['literature'])<200)?$this->_ctd(strlen($statRez['literature']),"","","class='red'"):$this->_ctd(strlen($statRez['literature'])) ;
						$this->_utr();
						}
//echo "</iframe>";
			$this->_utable();
			$this->_table();
						$this->_tr();
							$this->_ctd("<a href=# onClick=printDoc('progList');>Печать</a>");
						$this->_utr();
			$this->_utable();
		echo "</div>";
	}
/* Форма администрирования служебной записки
 *
 */
	function recordAdmin($action="recordEdit") {
	    if (auth(1)) { // Администратор
		$pg = new pgsql();
		$sql = "SELECT prog.program_id as id, parent_id, discipline_title as title, semester, subfaculty_for as subfac, speciality_for as spec, deleted FROM dis, prog, prog_status WHERE dis.discipline_id = prog.discipline_id AND prog.program_id = prog_status.program_id AND record_number = '".$_GET['record_number']."' AND record_date = '".$_GET['record_date']."' ORDER BY semester, title, subfac";
		$pg->_query($sql);
		$this->_table('','',"width=100% class='spisok'");
			$this->_tr();
				$title="Дисциплины, входящие в служебную записку ".$_GET["record_number"]."/".$_GET["record_date"];
				$this->_th($title,'','','colspan=9');
			$this->_utr();		
			$this->_tr();
				$this->_th("Название");
				$this->_th("Семестр");
				$this->_th("Для кафедры");
				$this->_th("Специальность");
				$this->_th("Состояние");
				if (auth(1)) $this->_th("Действие",'','','colspan=3');
			$this->_utr();
			while ($rez=$pg->_getResult()) {
			    $this->_tr('',"chgdis");
			        $this->_ctd($rez['title']);
			        $this->_ctd($rez['semester']);
			        $this->_ctd($rez['subfac']);
			        $this->_ctd($rez['spec']);
				if ($rez['parent_id']=='00000000-0000-0000-0000-000000000000') 
			    	    $this->_ctd("Добавить");
				elseif ($rez['deteled']) 
			    	    $this->_ctd("Удалить");
				else
			    	    $this->_ctd("Изменить");
				$this->_ctd("<a href=index.php".$this->href."&prog=".$rez['id']."&record_number=".$_GET["record_number"]."&record_date=".$_GET["record_date"]."&action=recordAlter><img src='img/b_undo.png' alt='Удалить из служебной записки' title='Удалить из служебной записки'></a><br>","","","align='center'");
			    $this->_utr();
			}		
		$this->_utable();
	    }
	}

/* Форма выборо дисциплин для составления служебных записок
 *
 */
	function progPrint($action="printLock") {
//	if (!auth(8) && $action=="printLock") die("Недостаточно прав для составления служебных записок!");
	if (!auth(8) && $action=="print") die("Недостаточно прав для печати служебных записок!");
	$pg = new pgsql();
	if ($action=="recordAdmin" || $action=="print" || ($action=="printLock" && auth(1))) {
		$this->_table('','',"width=100% class='spisok'");
			$this->_tr();
				$title=($action=="recordAdmin")?"Служебные записки":"Служебные записки (кафедра ".$_GET["subfaculty"].")";
				$this->_th($title,'','','colspan=9');
			$this->_utr();		
				$sql = "SELECT DISTINCT admin, record_number, record_date, dis.subfaculty as subfaculty FROM prog_status, prog, dis WHERE record=1 AND year = $this->year AND prog_status.program_id = prog.program_id AND prog.discipline_id=dis.discipline_id ".( ($action=="recordAdmin")?"":"AND replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."'" ). " ORDER BY record_number, record_date";
				$pg->_query($sql);
			$this->_tr();
				$this->_th("Служебная записка");
				if (auth(1)) $this->_th("Кафедра");
				if (auth(1)) $this->_th("Действие",'','','colspan=3');
			$this->_utr();
			while ($rez=$pg->_getResult()) {
				$this->_tr('',"chgdis");
					$this->_ctd("<a href=print.php".$this->href."&record_number=".$rez["record_number"]."&record_date=".$rez['record_date']."&action=zap>".$rez['record_number']."/".$rez['record_date']."</a><br>");
					$this->_ctd($rez['subfaculty']);
					if (auth(1) && $rez["admin"]==0) {
					$this->_ctd("<a href=index.php".$this->href."&record_number=".$rez["record_number"]."&record_date=".$rez['record_date']."&subfaculty=".$_GET["subfaculty"]."&action=un_sign>Отменить</a><br>","","","align='center'");
					$this->_ctd("<a href=index.php".$this->href."&record_number=".$rez["record_number"]."&record_date=".$rez['record_date']."&subfaculty=".$_GET["subfaculty"]."&action=recordEdit>Изменить</a><br>","","","align='center'");
					$this->_ctd("<a href=index.php".$this->href."&record_number=".$rez["record_number"]."&record_date=".$rez['record_date']."&subfaculty=".$_GET["subfaculty"]."&action=recordSign>Утвердить</a><br>","","","align='center'");
					}
					else {
					$this->_ctd("");
					$this->_ctd("");
					$this->_ctd("");
					}
				$this->_utr();
			}
			$this->_tr('',"chgdis");
				$this->_ctd("Для печати документов необходим <a href='http://www.adobe.com/products/acrobat/readstep2.html'>Adobe Acrobat Reader</a><br>");
				if (auth(1)) {
					$this->_ctd("");
					$this->_ctd("");
					$this->_ctd("");
					$this->_ctd("");
				}
			$this->_utr();
		$this->_utable();
	}
	elseif ($action=="printLock" && auth(8)) {
	$count = 0;
		$this->_form("printLock", "index.php","post");
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Добавить в служебную записку");
				$this->_utr();
			$this->_utable();
			echo "<br>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=9');
				$this->_utr();
					$pg->_query("SELECT prog.program_id as id, discipline_title as title, semester, subfaculty_for as subfac, speciality_for as spec, discipline_code as index, parent_id, deleted FROM dis, prog, prog_status WHERE record = 0 AND year = $this->year AND replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' AND prog.discipline_id=dis.discipline_id AND prog.program_id = prog_status.program_id AND (deleted = 0 OR (deleted=1 AND parent_id!='00000000-0000-0000-0000-000000000000')) ORDER BY semester, title, subfac" );
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Для специальности","","","colspan='3'");
					$this->_th("Добавить","","","rowspan='2'");
					$this->_th("Действие","","","rowspan='2'");
				$this->_utr();
				$this->_tr();
					$this->_th("ОКСО");
					$this->_th("Специализация");
					$this->_th("Квалификация");
				$this->_utr();		
					while ($rez=$pg->_getResult()) 
						if ((comparePrograms($rez["id"], $rez["parent_id"])) || ($rez["deleted"] && $rez["parent_id"]!="00000000-0000-0000-0000-000000000000")){
						$this->_tr('',"chgdis");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['title']."</a><br>");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['subfac']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],0,6)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],6,2)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],8,2)."</a><br>","","","align='center'");
								$this->_ctd($this->_checkBox("prog-".++$count,$rez['id']),"","","align='center'");
								if ($rez["parent_id"]=="00000000-0000-0000-0000-000000000000") $this->_ctd("Добавить","","","align='center'");
								else {
									if ($rez["deleted"]) $this->_ctd("Удалить","","","align='center'");
									elseif ( !comparePrograms($rez["id"], $rez["parent_id"]) ) $this->_ctd("Нет","","","align='center'");
									else  $this->_ctd("Изменить","","","align='center'");
									
								}
						$this->_utr();
						}
			$this->_utable();
			echo $this->_inputHidden("action",$action);
			echo $this->_inputHidden("year",$year);
			echo $this->_inputHidden("count",$count);
			echo $this->_inputHidden("subfaculty",$_GET['subfaculty']);
		$this->_uform();
		}
	}

	function setCopy($action="copyContent") {
	$count = 0;
		$this->_form("copyContent", "index.php","post");
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Копировать",'','','colspan=9');
				$this->_utr();
				$this->_tr();
					$this->_th("Часы");
					$this->_th("Аннотацию");
					$this->_th("Лекции");
					$this->_th("Семинары");
					$this->_th("Лабораторные работы");
					$this->_th("Самостоятельную работу");
					$this->_th("Список рекомендуемой литературы");					
				$this->_utr();
				$this->_tr();
					$this->_th($this->_checkBox("content"));
					$this->_th($this->_checkBox("annotation"));
					$this->_th($this->_checkBox("lectures"));
					$this->_th($this->_checkBox("seminars"));
					$this->_th($this->_checkBox("labs"));
					$this->_th($this->_checkBox("individual"));
					$this->_th($this->_checkBox("literature"));
				$this->_utr();
			$this->_utable();
			echo "<br>";
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=9');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT prog.program_id as id, discipline_title as title, semester,
									   subfaculty_for as subfac, speciality_for as spec,
									   discipline_code as index FROM dis
				 						INNER JOIN prog ON (prog.discipline_id=dis.discipline_id)
										INNER JOIN prog_status ON (prog.program_id=prog_status.program_id)
				 						WHERE replace(dis.subfaculty,' ','')='".$_GET["subfaculty"]."' 
										AND deleted = 0 
										AND year = $this->year
				 					ORDER BY semester, title, subfac" );
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Для специальности","","","colspan='3'");
					$this->_th("Копировать","","","colspan='2'");
				//	$this->_th("Начало учебного года","","","rowspan='2'");
				$this->_utr();		
				$this->_tr();
					$this->_th("ОКСО");
					$this->_th("Специализация");
					$this->_th("Квалификация");
					$this->_th("Из");
					$this->_th("В");
				$this->_utr();		
							while ($rez=$pg->_getResult()) {
						$this->_tr('',"chgdis");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['title']."</a><br>");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['semester']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".$rez['subfac']."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],0,6)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],6,2)."</a><br>","","","align='center'");
								$this->_ctd("<a href=index.php".$this->href."&subfaculty=".$_GET["subfaculty"]."&program=".$rez['id']."&action=view>".substr($rez['spec'],8,2)."</a><br>","","","align='center'");
								$this->_ctd($this->_radio("source",$rez['id']),"","","align='center'");
								$this->_ctd($this->_checkBox("destination-".++$count,$rez['id']),"","","align='center'");
						$this->_utr();
						}
			$this->_utable();
			echo $this->_inputHidden("action",$action);
			echo $this->_inputHidden("year",$this->year);
			echo $this->_inputHidden("count",$count);
			echo $this->_inputHidden("subfaculty",$_GET['subfaculty']);
		$this->_uform();
	}
	
	function progReindex($action="commit") {
	$count=0;
		$this->_form("reindex", "index.php","post");
			$this->_table('','',"width=100% class='spisok'");
				$this->_tr();
					$this->_th("Программы дисциплин, которые читает кафедра ".$_GET["subfaculty"],'','','colspan=9');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT dis.discipline_id as id, discipline_title as title, semester,
									   subfaculty_for as subfac, speciality_for as spec,
									   discipline_code as index FROM dis
				 						INNER JOIN prog ON (prog.discipline_id=dis.discipline_id)
				 						WHERE dis.subfaculty='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY semester, title, subfac" );
				$this->_tr();
					$this->_th("Название","","","rowspan='2'");
					$this->_th("Семестр","","","rowspan='2'");
					$this->_th("Для кафедры","","","rowspan='2'");
					$this->_th("Для специальности","","","colspan='3'");
					$this->_th("Индекс","","","rowspan='2'");
				//	$this->_th("Начало учебного года","","","rowspan='2'");
				$this->_utr();		
				$this->_tr();
					$this->_th("ОКСО");
					$this->_th("Специализация");
					$this->_th("Квалификация");
				$this->_utr();		
							while ($rez=$pg->_getResult()) {
						$this->_tr('',"chgdis");
								$this->_ctd($rez['title']."<br>");
								$this->_ctd($rez['semester']."<br>","","","align='center'");
								$this->_ctd($rez['subfac']."<br>","","","align='center'");
								$this->_ctd(substr($rez['spec'],0,6)."<br>","","","align='center'");
								$this->_ctd(substr($rez['spec'],6,2)."<br>","","","align='center'");
								$this->_ctd(substr($rez['spec'],8,2)."<br>","","","align='center'");
								echo $this->_inputHidden("id".++$count,$rez['id']);
								$this->_ctd($this->_inputText("index".$count,15,15,$rez['index']),"","","align='center'");
						//		$this->_ctd($this->_inputText("year".$count,4,4,$rez['index']),"","","align='center'");
						$this->_utr();
						}
			$this->_utable();
			echo $this->_inputHidden("action",$action);
			echo $this->_inputHidden("count",$count);
			echo $this->_inputHidden("subfaculty",$_GET['subfaculty']);
		$this->_uform();
	}

// ---------------- Форма для работы с программой ------------------
	function progForm($action="view") {

		if ($action!="add")
		{
//			echo $_GET["program"];
			$pg = new pgsql();
			$pg->_query("SELECT * from prog WHERE year = $this->year AND program_id='".$_GET["program"]."'" );
			$rez=$pg->_getResult();
			$year=$rez['year'];			
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];			
			$lectures=$rez['lectures'];
			$lecturescount=$rez['lecturescount'];
			$seminars=$rez['seminars'];			
			$seminarscount=$rez['seminarscount'];			
			$labs=$rez['labs'];			
			$labscount=$rez['labscount'];			
			$individual=$rez['individual'];
			$zach=$rez['zach'];			
			$zach_count=$rez['zach_count'];
			$difzach=$rez['difzach'];			
			$exam=$rez['exam'];
//			$memo=$rez['memo'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$subfac_id=$rez['subfaculty_for_id'];
			$spec=$rez['speciality_for'];
			$practice=$rez['practice'];
			$lang_first=$rez['lang_first'];
			$lang_second=$rez['lang_second'];
			$parent_id=($rez['parent_id']!='00000000-0000-0000-0000-000000000000')?$rez['parent_id']:'';
			
			//Languages
			$pg->_query("SELECT * from lang WHERE f_id='".$_GET["program"]."'" );
			$langs=$pg->_getResultAll();
			//var_dump($rez);

			if ($parent_id && $parent_id!='00000000-0000-0000-0000-000000000000') {
				$pg->_query("SELECT * from prog WHERE program_id='$parent_id'");
				$rez=$pg->_getResult();
				$pyear=$rez['year'];			
				$psemester=$rez['semester'];
				$pweeks=$rez['weeks'];			
				$plectures=$rez['lectures'];
				$plecturescount=$rez['lecturescount'];
				$pseminars=$rez['seminars'];			
				$pseminarscount=$rez['seminarscount'];			
				$plabs=$rez['labs'];			
				$plabscount=$rez['labscount'];			
				$pindividual=$rez['individual'];
				$pzach=$rez['zach'];			
				$pzach_count=$rez['zach_count'];
				$pdifzach=$rez['difzach'];			
				$pexam=$rez['exam'];
				$puuid=$rez['discipline_id'];
				$psubfac=$rez['subfaculty_for'];
				$psubfac_id=$rez['subfaculty_for_id'];
				$pspec=$rez['speciality_for'];
				$ppractice=$rez['practice'];
				$plang_first=$rez['lang_first'];
				$plang_second=$rez['lang_second'];
			}
			$pg->_query("SELECT * from dis WHERE discipline_id='$uuid'" );
			$rez=$pg->_getResult();
			$code=$rez['discipline_code'];
			$titleShort=$rez['discipline_titleshort'];
			$title=$rez['discipline_title'];
			$disSubfaculty=$rez['subfaculty'];
			$disSubfaculty_id=$rez['subfaculty_id'];
			if ($parent_id) {
				$pg->_query("SELECT * from dis WHERE discipline_id='$puuid'" );
				$rez=$pg->_getResult();
				$pcode=$rez['discipline_code'];
				$ptitleShort=$rez['discipline_titleshort'];
				$ptitle=$rez['discipline_title'];
				$pdisSubfaculty=$rez['subfaculty'];
				$pdisSubfaculty_id=$rez['subfaculty_id'];
			}
			$pg->_query("SELECT * from memo WHERE program_id='".$_GET["program"]."'" );
			$rez=$pg->_getResult();
			$memo=$rez['annotation'];
			$lecturesMemo=$rez['lectures'];
			$seminarsMemo=$rez['seminars'];			
			$labsMemo=$rez['labs'];			
			$individualMemo=$rez['individual'];
			$literatureMemo=$rez['literature'];
			$dzMemo=$rez['dz'];
			$rkMemo=$rez['rk'];
			$krMemo=$rez['kr'];
			$dzMemo=$rez['zach'];
			$rkMemo=$rez['difzach'];
			$krMemo=$rez['exam'];
		}
		else $year = $this->year;

			$exp="//group[@speciality_code = '$spec' and @semester = '$semester' and @lang_first='$lang_first' and @lang_second='$lang_second']";
			$elements = $GLOBALS["reference_xpath"]->query($exp);
			foreach ($elements as $element) {
			$groups.=$element->getAttribute('abbr')." ";
			}
			
			$exp = "//subfaculty[@abbr = '$subfac']/group[@speciality_code = '$spec']";
			$elements = $GLOBALS["reference_xpath"]->query($exp);
			foreach ($elements as $element) {
			$subfac_langs[] = $element->getAttribute('lang_first')." / ".$element->getAttribute('lang_second');
			}
		$subfac_langs = array_unique($subfac_langs);
		foreach ($subfac_langs as $sl) $all_langs[]=$sl;
		$i=0;
		foreach ($all_langs as $l) {
			$la = explode(" / ",$l);
//			print_r($la);
				$exp="//group[@speciality_code = '$spec' and @semester = '$semester' and @lang_first='".$la[0]."' and @lang_second='".$la[1]."']";
// 				print_r($exp);
				$elements = $GLOBALS["reference_xpath"]->query($exp);
				foreach ($elements as $element) {
					$groups[$i].=$element->getAttribute('abbr')." ";
				}
			$i++;
		}
//		print_r($groups);
		foreach ($langs as $lang)
			for ($i=0;$i<count($all_langs);$i++) {
				if ($all_langs[$i]==$lang["lang_first"]." / ".$lang["lang_second"])
					$all_langs_exists[$i]=true;
			}

		echo "<div id='progBody'>";
		if ($action!="view")  
		{
			$this->_form("prog", "index.php", "post");
		} 
/*		$this->_table();
			$this->_tr();
				($action=="view") ? $this->_th("Министерство образования и науки Российской Федерации<br>Государственное образовательное учреждение высшего профессионального образования<br>
								\"Московский государственный технический университет им. Н.Э.Баумана\"<br>
								(МГТУ им. Н.Э. Баумана)<br><br>", "", "", "colspan='2'") : "";
			$this->_utr();
		$this->_utable();
*/
		$this->_table();
			$this->_tr();
				$this->_ctd("Индекс");
				$this->_cText($action, "discipline_code", $code,'',80,254,'','','',$this->colorCmp($code,$pcode));		
			$this->_utr();		
		$this->_utable();

		$this->_table();
			$this->_tr();
				$this->_ctd((($action!="view") ? "Название дисциплины" : "Рабочая программа учебной дисциплины"),'', "", "colspan='2'");
			$this->_utr();		
		$this->_utable();
		$this->_table();
			$this->_tr();
				$this->_cText($action, "title", $title,'',80,254,'','',1,$this->colorCmp($title,$ptitle));		
			$this->_utr();		
		$this->_utable();
		$this->_table();
			$this->_tr();
				$this->_ctd("Учебный год");		
//				$this->_cText($action, "year", ($action!="view") ? $year : $year."/".($year+1), $year, 4, 4);		
				if ($action!="view") echo "<input type='hidden' name='year' value='$year'>";
				$this->_ctd($year."/".($year+1));		
				$this->_ctd("Семестр");
				if ($action=="view") 
					$this->_cText($action, "semester", $semester, "1", 2, 2,'','','',$this->colorCmp($semester,$psemester));		
				else {
					for ($i=1;$i<13;$i++)
						$sem[$i-1]=$i;		
					$this->_ctd($this->_cSelect("semester","1",Array ($sem,$sem), $semester),'','',"align='center'");
				}
				$this->_ctd("Недель");		
				if ($action=="view") 
					$this->_cText($action, "weeks", $weeks, "17", 2, 2,'',"onBlur=cDis('$action');",'',$this->colorCmp($weeks,$pweeks));
				else {
					for ($i=1;$i<20;$i++)
						$ned[$i-1]=$i;		
					$this->_ctd($this->_cSelect("weeks","1",Array ($ned,$ned),$weeks),'','',"align='center'");
				}
			$this->_utr();
		$this->_utable();
		$this->_table();
			$this->_tr();
				$this->_ctd(($action=="view")?"Для специальности":"<a href='#' onClick=\"specSelect();\">Для специальности</a>");	
				$this->_cText($action, "spec", $spec, "", 10, 10, '',"class='speciality' onChange='groupUpdate()'",'',$this->colorCmp($spec,$pspec));		
//				$this->_cText($action, "spec", $spec, "", 10, 10, '',"class='speciality' onMouseOver='showInfoGroup(\"speciality\",\"spec\",\"spec\",\"semester\",\"lang_first\",\"lang_second\");' onChange='showInfo(\"speciality\",\"spec\");'",'',$this->colorCmp($spec,$pspec));		
//				$this->_cText($action, "subfac", $subfac, "", 7, 7,'',"onMouseOver='showInfo(\"subfaculty\",\"subfac\");'",'',$this->colorCmp($subfac,$psubfac));		
				$this->_ctd(($action=="view")?"Кафедры":"<a href='#' onClick=\"departmentSelect('subfac');\">Кафедры</a>");		
				$this->_cText($action, "subfac", $subfac, "", 7, 7,'',"readonly class='subfaculty'",'',$this->colorCmp($subfac,$psubfac));		
//				if ($action=='view') $this->_ctd($subfac,"","subfaculty", "onMouseOver='showInfo(\"subfaculty\",\"subfaculty\");'");

				$this->_ctd(($action=="view")?"Читает":"<a href='#' onClick=\"departmentSelect('subfaculty');\">Читает</a>");		
				$this->_cText($action, "subfaculty", $disSubfaculty, "", 7, 7,'',"readonly class='subfaculty'",'',$this->colorCmp($disSubfaculty,$pdisSubfaculty));		
//				if ($action=='view') $this->_ctd($disSubfaculty,"","subfaculty", "onMouseOver='showInfo(\"subfaculty\",\"subfaculty\");'");
		$this->_utable();
		$this->_table();
			$this->_tr();
				$this->_ctd("Группы: ");		
				$this->_ctd(($action=="view")?"Языки":"<a href='#' onClick=\"langSelect();\">Языки</a>","","","id='lang_info'");
			$this->_utr();		
			for($i=0;$i<count($all_langs);$i++) {
			$lang = explode(" / ",$all_langs[$i]);
//			print_r($lang);
			$this->_tr("allGroups");
				$this->_ctd($groups[$i],"","groups[$i]", " class='groupTitle'");
				$this->_ctd("<span id='lang_first' class='language'>".$lang[0]."</span> / <span id='lang_second' class='language'>".$lang[1]."</span>","groups_$i");
				$this->_cCheck($action, "langs[$i]", $all_langs[$i], '', '', $all_langs_exists[$i]);		
/*						$this->_cText($action, "lang_first[$i]", $langs[$i]["lang_first"], "", 2, 2,'',"class='language'",'',$this->colorCmp($lang_first,$plang_first));
						$this->_ctd("/");		
						$this->_cText($action, "lang_second[$i]", $langs[$i]["lang_second"]	, "", 2, 2,'',"class='language'",'',$this->colorCmp($lang_second,$plang_second));		
*/			 $this->_utr();
			 }
		$this->_utable();
		$this->_table("","","align='center' class='spisok'");
			$this->_tr();
				$this->_th("Виды учебных работ");
				$this->_th("Обьем, час");
				$this->_th("Количество");
			$this->_utr();		
			$this->_tr();
				$this->_th("Аудиторный занятия (А), в т.ч.:");
				$this->_th("","",'a_sum');
				$this->_th("","",'a_count');
			$this->_tr();
				$this->_ctd("Лекция (Л)");
				$this->_cText($action, "lectures", $lectures, "0", 4, 3,'',"onBlur=sum()",'',$this->colorCmp($lectures,$plectures));		
				$this->_cText($action, "lecturescount", $lecturescount, "0", 4, 2,'','','',$this->colorCmp($lecturescount,$plecturescount));		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Семинар (С)");
				$this->_cText($action, "seminars", $seminars, "0", 4, 3,'',"onBlur=sum()",'',$this->colorCmp($seminars,$pseminars));		
				$this->_cText($action, "seminarscount", $seminarscount, "0", 4, 2,'','','',$this->colorCmp($seminarscount,$pseminarscount));		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Практическое занятие (ПЗ)");
				$this->_cText($action, "labs", $labs, "0", 4, 3,'',"onBlur=sum()",'',$this->colorCmp($labs,$plabs));		
				$this->_cText($action, "labscount", $labscount, "0", 4, 2,'',"onBlur=sum()",'',$this->colorCmp($labscount,$plabscount));		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Контрольная работа (КР)");
				$this->_ctd("","",'kr_sum');
				$this->_ctd("","",'kr_count');
			$this->_utr();
			$this->_tr();
				$this->_ctd("Контрольное занятие (КЗ)");
				$this->_ctd("","",'kz_sum');
				$this->_ctd("","",'kz_count');
			$this->_utr();
/*			$this->_tr();
				$this->_ctd("Итого:");
				$this->_ctd('','',"sum");
				$this->_ctd();
			$this->_utr();
*/			$this->_tr();
				$this->_th("Самостоятельная работа (СР), в т.ч.:");
				$this->_cText($action, "individual", $individual, "0", 4, 4,'',"onBlur=sum()",'',$this->colorCmp($individual,$pindividual));		
				$this->_ctd();
			$this->_utr();

			$this->_tr();
				$this->_ctd("Реферат (Р)");
//				$this->_ctd("Домашнее задание");
//				$rez=$this->getControl($action,"Р", $_GET["program"]);
				$this->_ctd("","",'r_sum');
				$this->_ctd("","",'r_count');
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Курсовая работа (КУ)");
				$this->_ctd("","",'ku_sum');
				$this->_ctd("","",'ku_count');
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Домашнее задание (ДЗ)");
//				$this->_ctd("Домашнее задание");
				$this->_ctd("","",'dz_sum');
				$this->_ctd("","",'dz_count');
			$this->_utr();		
/*			$this->_tr();
				$this->_ctd("Курсовая работа (КР)");
				$rez=$this->getControl($action,"КР", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();
*/			$this->_tr();
				$this->_ctd("Другие виды работ");
//				$this->_ctd("Домашнее задание");
//				$rez=$this->getControl($action,"ДЗ", $_GET["program"]);
				$this->_ctd("","","other_sum");
				$this->_ctd("","","other_count");
			$this->_utr();		
/*			$this->_tr();
//				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=rkMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=rkMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Рубежный контроль</a>");
				$this->_ctd("Рубежный контроль (РК)");
				$rez=$this->getControl($action,"РК", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
*/
			$this->_tr();
				$this->_th("Объем учебной работы (УР) студента (УР = А + СР)");
				$this->_th("","","ur_sum");
				$this->_th("","","ur_count");
			$this->_utr();
			$this->_tr();
				$this->_th("Практика (недели)");
				$this->_th("","","practice_sum");
				$this->_cText($action, "practice", $practice, "0", 4, 3,'',"onBlur=sum()",'',$this->colorCmp($practice,$ppractice));		
			$this->_utr();		
			$this->_tr();
				$this->_th("Объем работы студента в период экзаменационной сессии, по резултатам практики и за курсовую работу (Э)", "", "", "colspan='3'");
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Зачет");
				if ($action=='view') $this->_ctd("<span id='zach_sum'></span><span style='display:none'>".$this->_checkBox("zach_count", $zach_count)."</span>");
				else $this->_ctd("<span id='zach_sum'></span>".$this->_checkBox("zach_count", $zach_count,'',"onClick=sum()"));
				$this->_cCheck($action, "zach", $zach, $this->colorCmp($zach,$pzach),"onClick=sum()");		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Дифференцированный зачет");
				$this->_ctd("", "", "difzach_sum");
				$this->_cCheck($action, "difzach", $difzach, $this->colorCmp($difzach,$pdifzach),"onClick=sum()");		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Экзамен (защита ВКР)");
				$this->_ctd("", "", "exam_sum");
				$this->_cCheck($action, "exam", $exam, $this->colorCmp($exam,$pexam),"onClick=sum()");		
			$this->_utr();		
			$this->_tr();
				$this->_ctd("Оценка за курсовую работу (дифференцированный зачет)");
				$this->_ctd("", "", "zach_ku_sum");
				$this->_ctd("", "", "zach_ku");
			$this->_utr();		
			$this->_tr();
				$this->_th("Общая трудоемкость теоретического обучения (ТО = УР + Э)");
				$this->_th("","","to_sum");
				$this->_th("","","to_count");
			$this->_utr();
			$this->_tr();
				$this->_th("Общая трудоемкость теоретического обучения в кредитах (ТО или Практика / 36)");
				$this->_th("","","toc_sum");
				$this->_th("","","toc_count");
			$this->_utr();

/*			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=practiceMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=practiceMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Практика</a>");
				$this->_cText($action, "practice", $practice, "0", 4, 4,'',"onBlur=sum()",'',$this->colorCmp($practice,$ppractice));		
				$this->_ctd();
			$this->_utr();		

//			if($action=="view")
//			{
			$this->_tr();
				$this->_th("Контрольные мероприятия", "", "", "colspan='3'");
			$this->_utr();		
			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=dzMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=dzMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Домашнее задание</a>");
//				$this->_ctd("Домашнее задание");
				$rez=$this->getControl($action,"ДЗ", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=rkMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=rkMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Контрольная работа</a>");
//				$this->_ctd("Контрольная работа");
				$rez=$this->getControl($action, "КР", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
/*			$this->_tr();
				$this->_ctd("Курсовой проект");
				$rez=$this->getControl("КП", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		

			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=rkMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=rkMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Рубежный контроль</a>");
//				$this->_ctd("Рубежный контроль");
				$rez=$this->getControl($action,"РК", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=dpMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=dpMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Дипломное проектирование</a>");
				$rez=$this->getControl($action,"ДП", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
			$this->_tr();
				$this->_ctd("<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=kpMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=kpMemo','_blank','resizable=1 scrollbars=1, width=640, height=480'); return false;\">Курсовой проект</a>");
				$rez=$this->getControl($action,"КП", $_GET["program"]);
				$this->_ctd($rez["sum"]);
				$this->_ctd($rez["cnt"]);
			$this->_utr();		
			}		
			$this->_tr();
				$this->_th("Блок дисциплин по выбору","","","colspan='2'");
//				$this->_cText("Блок".$this->_cText("choice", $choice));
				$this->_cText($action, "choice", $choice, "0", 4, 1);		
			$this->_utr();		
*/		$this->_utable();
		$this->_table();
			$this->_tr();
				$this->_th("Виды контрольных мероприятий (КМ)");
			$this->_utr();		
		$this->_utable();
//			$this->_tr();
//		$this->_table("","control","align='center' border='1'");
		$this->_table();
			$this->_tr();
				$this->_ctd('','',"cont");
			$this->_utr();		
//				$this->_cControl($action);
		$this->_utable();
		if ($action!='view') {
                                echo "<input type='hidden' name='practice' value='0'>";
//					echo "<input type='hidden' name='subfaculty' value='".$_GET["subfaculty"]."'>";
			if ($action=='add') echo "<input type='hidden' name='action' value='insert'>";
			if ($action=='edit') {
				echo "<script>setWeeks('$action');</script>";
				echo "<a href='#' onClick=\"window.open('an.php?action=edit&target=memo','Аннотация','resizable=1 width=640 height=480'); return false;\">Аннотация</a><br>\n";
				echo "<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=literatureMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=literatureMemo','_blank','resizable=1, width=640, height=480'); return false;\">Список рекомендуемой литературы</a>";
				echo "<input type='hidden' name='action' value='commitEdit'>";
				echo "<input type='hidden' name='program' value='".$_GET["program"]."'>";
				echo $this->_inputHidden("subfac_id",$subfac_id);
				echo $this->_inputHidden("subfaculty_id",$disSubfaculty_id);
				echo "<input type='hidden' name='year' value='$year'>";
				echo "<input type='hidden' name='memo' value='".$memo."'>";
				echo "<input type='hidden' name='literatureMemo' value='".$literatureMemo."'>";
				echo "<input type='hidden' name='lecturesMemo' value='".$lecturesMemo."'>";
				echo "<input type='hidden' name='seminarsMemo' value='".$seminarsMemo."'>";
				echo "<input type='hidden' name='labsMemo' value='".$labsMemo."'>";
				echo "<input type='hidden' name='individualMemo' value='".$individualMemo."'>";
				echo "<input type='hidden' name='dzMemo' value='".$dzMemo."'>";
				echo "<input type='hidden' name='krMemo' value='".$krMemo."'>";
				echo "<input type='hidden' name='rkMemo' value='".$rkMemo."'>";
				echo "<input type='hidden' name='zachMemo' value='".$zachMemo."'>";
				echo "<input type='hidden' name='practice' value='0'>";
				echo "<input type='hidden' name='difzachMemo' value='".$difzachMemo."'>";
				echo "<input type='hidden' name='examMemo' value='".$examMemo."'>";
			}
	 		$this->_uform("Сохранить");
	 	}		
		else {
//				echo "<a href='#' onClick=\"window.open('an.php?action=view&id=".$_GET["program"]."','Аннотация','resizable=0 scrollbars=1 width=640 height=480'); return false;\">Аннотация</a><br>\n";
				echo "<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=Memo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=Memo','_blank','resizable=1, width=640, height=480'); return false;\">Аннотация</a><br>";
				echo "<a target=_blank href='an.php?action=$action&id=".$_GET["program"]."&target=literatureMemo' onClick=\"window.open('an.php?action=$action&id=".$_GET["program"]."&target=literatureMemo','_blank','resizable=1, width=640, height=480'); return false;\">Список рекомендуемой литературы</a>";
		}
	echo "<script>cDis('".$_GET["action"]."');sum('".$_GET["action"]."');</script>";
		if ($action=='view') 
		{
		echo "</div>";
			print ("<br><a href='print.php?action=prog&year=".$_GET["year"]."&id=".urlencode($_GET["program"])."')>Печать</a>");
		}
	}
	
// --------------------------------------------------------------------------------------------------
	/* ortSelect rev. 1.1
	 * Форма выбора отрезков УП
	 * Аргументы:
	 * $action - действие, производимое с программой
	 */
	function otrSelect($action="view") {
	echo "<script type=\"text/javascript\" src=\"./spec.js\"></script>\n";
	$i=0;
				$this->_tr();
					$this->_th("Кафедра ".$_GET["subfaculty"],'','','colspan=2');
				$this->_utr();		
				$this->_tr();
					$this->_th("Выберите семестр и специальность",'','','colspan=2');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT DISTINCT speciality_for from prog
										WHERE subfaculty_for='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY speciality_for" );
					while ($rez=$pg->_getResult()) $count++;
					$spec = Array($count);
					$pg->_query("SELECT DISTINCT speciality_for from prog
										WHERE subfaculty_for='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY speciality_for" );
					while ($rez=$pg->_getResult()) {
						$spec[$i]=$rez["speciality_for"];
						$i++;
					}
					$pg->_query("SELECT DISTINCT lang_first, lang_second from lang, prog
										WHERE subfaculty_for='".$_GET["subfaculty"]."' AND year = $this->year AND f_id=program_id
				 					ORDER BY lang_first, lang_second" );
					$langs=$pg->_getResultAll(true);
//					var_dump($langs);
					
			$this->_table('','',"align='center' class='spisok'");
				$this->_tr();
					$this->_th("Семестр",'','',"colspan='16'");		
				$this->_utr();		
				$this->_tr();
					for ($i=1;$i<17;$i++) 
						$this->_ctd($i,'',"sem".$i,'onClick=SetSem(this)');		
				$this->_utr();		
			$this->_utable();
			echo "<br>";
			$this->_table('','',"align='center' class='spisok'");
				$this->_tr();
					$this->_th("Специальность");		
				$this->_utr();		
					for ($i=0;$i<count($spec);$i++) {
						$this->_tr();
							$this->_ctd($spec[$i],'',"$spec[$i]",'class="specialty" onClick=SetSpec(this);');		
						$this->_utr();
					}		
			$this->_utable();
			echo "<br>";
			$this->_table('','',"align='center' class='spisok'");
				$this->_tr();
					$this->_th("Языки");		
				$this->_utr();		
					for ($i=0;$i<count($langs);$i++) {
						$this->_tr();
							$language=$langs[$i]["lang_first"]." - ".$langs[$i]["lang_second"];
							$language_span="<span class='language'>".$langs[$i]["lang_first"]."</span> - <span class='language'>".$langs[$i]["lang_second"]."</span>";
							$this->_ctd($language_span,'',"$language",'onClick=SetLang(this);');		
						$this->_utr();
					}		
			$this->_utable();
			echo "<a href=# onClick=Select('$this->year','".$_GET["subfaculty"]."');>Продолжить</a>";
	}

	/* ortCopy rev. 1.0
	 * Форма для копирования отрезков УП на другую специальность
	 * Аргументы:
	 * $action - действие, производимое с программой
	 */
	function otrCopy($action="copy_all") {
		if ($action="copy_all")	{
			$this->_form("copy_all_commit", "index.php","post", "onSubmit='return false;'");
				$this->_table('','','width=100%');
					$this->_tr();
						$this->_th("<a href='#' onClick=\"specSelectAll();\">Скопировать в специальность</a>");		
//						$this->_cText($action, "spec", $_GET["spec"], "", 10, 10);		
						//$this->_th("Скопировать в специальность");
						$this->_ctd($this->_inputText("spec_all",10,10,$_GET["spec"]));
					$this->_utr();		
					$this->_tr();
						$this->_th("<a href='#' onClick=\"departmentSelect('subfac');\">Кафедры</a>");		
						$this->_ctd($this->_inputTextRO("subfac",7,7,$_GET["subfaculty"]));
					$this->_utr();		
					$this->_tr();		
						$this->_ctd("<a href='#' onClick=\"langSelect();\">Языки</a>","","","id='lang_info' align='center'");		
						$this->_ctd($this->_inputText("lang_first",2,2,$_GET["lang_first"])." / ".$this->_inputText("lang_second",2,2,$_GET["lang_second"]));
					$this->_utr();		
					$this->_tr();
						$this->_th("Учебный план целиком (с 1 по 10 семестр)");
						$this->_ctd($this->_checkBox("planCopy"));		
					$this->_utr();
				$this->_utable();
				echo $this->_inputHidden("lang_first_old",$_GET["lang_first"]);
				echo $this->_inputHidden("lang_second_old",$_GET["lang_second"]);
				echo $this->_inputHidden("spec",$_GET["spec"]);
				echo $this->_inputHidden("sem",$_GET["sem"]);
				echo $this->_inputHidden("year",$_GET["year"]);
				echo $this->_inputHidden("subfaculty",$_GET["subfaculty"]);
				echo $this->_inputHidden("section","copy_all");
			$this->_uform("Продолжить","button","onClick='return checkOrtCopy(this.form);'");
		}
	}
	
	/* ottAdmin rev. 1.0
	 * Форма для администрирования отрезков
	 * Аргументы:
	 * $action - действие, производимое с программой
	 * 
	 */
	function otrAdmin($section, $action, $year) {
		if ($action="chg_spec")	{
			$this->_form("chg_spec_commit", "index.php","post");
				$this->_table('','','width=100%');
					$this->_tr();
						$this->_th("Кафедра ".$_GET["subfaculty"]." специальность ".$_GET["spec"] ." ".$_GET["sem"]." семестр",'','','colspan=2');
					$this->_utr();		
					$this->_tr();
						$this->_th("Изменить специальность");
						$this->_ctd($this->_inputText("speciality",10,10,$_GET["spec"]));
					$this->_utr();		
				$this->_utable();
				echo $this->_inputHidden("spec",$_GET["spec"]);
				echo $this->_inputHidden("sem",$_GET["sem"]);
				echo $this->_inputHidden("year",$_GET["year"]);
				echo $this->_inputHidden("subfaculty",$_GET["subfaculty"]);
				echo $this->_inputHidden("section","chg_spec_commit");
			$this->_uform();
		}
	}
	
	function specSelect($action="view") {
	$i=0;
	$count=1;
		$this->_form("select", "index.php");
			$this->_table('','','width=100%');
				$this->_tr();
					$this->_th("Кафедра ".$_GET["subfaculty"],'','','colspan=2');
				$this->_utr();		
				$this->_tr();
					$this->_th("Выберите специальность",'','','colspan=2');
				$this->_utr();		
					$pg = new pgsql();
					$pg->_query("SELECT DISTINCT speciality_for from prog
										WHERE subfaculty_for='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY speciality_for" );
					while ($rez=$pg->_getResult()) $count++;
					$spec = Array($count);
					$pg->_query("SELECT DISTINCT speciality_for from prog
										WHERE subfaculty_for='".$_GET["subfaculty"]."' AND year = $this->year
				 					ORDER BY speciality_for" );
				$this->_tr();
//					$this->_ctd($this->_cSelect("sem","1",$sel),'','',"align='center'");
					$i=0;
					while ($rez=$pg->_getResult()) {
						$spec[$i]=$rez["speciality_for"];
						$i++;
					}
					$pg->_query("SELECT DISTINCT lang_first, lang_second from prog, lang
							WHERE f_id = program_id
							AND subfaculty_for='".$_GET["subfaculty"]."' 
							AND year = $this->year
				 			ORDER BY lang_first, lang_second" );
					$langs=$pg->_getResultAll(true);
					$i=0;
					while ($rez=$pg->_getResult()) {
						$langs[$i++]=$rez["lang_first"]." - ".$rez["lang_second"];
					}

					$this->_ctd($this->_cSelect("spec","1",Array ($spec,$spec)),'','',"align='center'");
				$this->_utr();		
				$this->_tr();		
					$this->_ctd($this->_cSelect("langs","1",Array ($langs,$langs)),'','',"align='center'");
				echo "<input type='hidden' name='subfaculty' value='".$_GET["subfaculty"]."'>";
				echo "<input type='hidden' name='section' value='".$_GET["section"]."'>";
				echo "<input type='hidden' name='year' value='".$this->year."'>";
				echo "<input type='hidden' name='action' value='".$_GET["action"]."'>";
			$this->_utable();
		$this->_uform();
	}


	function otrForm($action="view", $formN=0, $year=2008) {
	($formN==2)?$this->_form("stuf_edit","index.php","post"):"";	
	$i=1;
	$f = new pgsql();
	$query = "SELECT * from prog 
					 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
					 INNER JOIN lang ON (f_id = program_id 
					 AND lang_first='".$_GET["lang_first"]."' 
					 AND lang_second='".$_GET["lang_second"]."')
					 WHERE subfaculty_for='".$_GET["subfaculty"]."' 
					 AND speciality_for='".$_GET["spec"]."'
					 AND semester='".$_GET["sem"]."' 
					 AND year = $year
					 AND practice = 0
					 ORDER BY discipline_title";
	$f->_query($query);
	$footer=$f->_getResult();
	$pg = new pgsql();
	$pg->_query("SELECT * from prog
					 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
					 INNER JOIN lang ON (f_id = program_id 
					 AND lang_first='".$_GET["lang_first"]."' 
					 AND lang_second='".$_GET["lang_second"]."')
					 WHERE subfaculty_for='".$_GET["subfaculty"]."' 
					 AND speciality_for='".$_GET["spec"]."'
					 AND semester='".$_GET["sem"]."' 
					 AND year = $year
					 ORDER BY case 
					 					when dis.subfaculty~'ВП' then 24 
					 					when dis.subfaculty~'ФВ' then 25
										when practice > 0 then 26 
					 					when discipline_code~'ГСЭ' then 1 
					 					when discipline_code~'ЕН' then 2 
					 					when discipline_code~'ОПД' then 3 
					 					when discipline_code~'СП' then 4 
					 					when discipline_code~'ДС' then 5 
					 					when discipline_code~'ФТД' then 6
					 					else 10 end ,
					 					discipline_title"
					  );

	switch ($formN)
	{
	case 0: $span=6;break;
	case 1: $span=2;break;
	case 2: 
		$this->_table();
			$this->_tr();
				$this->_th("Лекции","center");
			$this->_utr();
		$this->_utable();
	break;
	case 4: $span=6;break;
	default: $span=1;break;
	}
	$this->_div("otrBody");
/*		$this->_table('','','width="100%"');
			$this->_tr();
				$this->_ctd("Утверждаю:<br>Дата:",'','','width=180px');
				$this->_ctd("Первый проректор - проректор по учебной работе");
			$this->_utr();
		$this->_utable();
*/		$this->_table();
			$this->_tr();
				$this->_ctd("Рабочий учебный план на <b>".$footer["semester"]." семестр</b> ".$footer["year"]."/".($footer["year"]+1)." учебного года","",'','width=300px');
				$this->_ctd( ((ereg('65',$footer["speciality_for"]))?"Специальность: ":"Направление: ") ."<span class='speciality'>".$footer["speciality_for"]."</span> (".$this->getGroup($footer["subfaculty_for"],$footer["semester"],$footer["speciality_for"],$footer["lang_first"],$footer["lang_second"]).")",'','','width=350px');
				$this->_ctd("Кафедра: <b><span class='subfaculty'>".$footer["subfaculty_for"]."</span></b>",'','','width=100px');
			$this->_utr();
		$this->_utable();
		$this->_table('','',"class='spisok'");
			$this->_tr();
				$this->_th("п", "", "", "rowspan='$span'");
				$this->_th("Дисциплины", "", "", "rowspan='$span' width='350px'");
				$this->_th("КАФ", "", "", "rowspan='$span'");
				switch ($formN)
			{
			case 0:
				$this->_th("Форма контроля", "", "", "colspan='3'");
				$this->_th("Кредиты", "", "", "rowspan='6'");
				$this->_th("Общая трудоемкость (час)", "", "", "colspan='11'");
				$this->_th("В неделю, час", "", "", "colspan='2'");
				$this->_th("Служебная записка", "", "", "rowspan='6'");
			$this->_utr();
			$this->_tr();
				$this->_th("ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ДИФ<br>ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ЭКЗ", "", "", "rowspan='5'");
				$this->_th("Всего", "", "", "rowspan='5'");
				$this->_th("Теоретическое обучение (час)", "", "", "colspan='9'");
				$this->_th("Экз\nчас", "", "", "rowspan='5'");
				$this->_th("Ауд", "", "", "rowspan='5'");
				$this->_th("Сам", "", "", "rowspan='5'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='4'");
				$this->_th("Аудиторные занятия (час)", "", "", "colspan='7'");
				$this->_th("Сам.\nраб.\n(час)", "", "", "rowspan='4'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='3'");
				$this->_th("В том числе (час)", "", "", "colspan='6'");
			$this->_utr();
			$this->_tr();
				$this->_th("Л", "", "", "rowspan='2'");
				$this->_th("С", "", "", "rowspan='2'");
				$this->_th("ПЗ", "", "", "rowspan='2'");
				$this->_th("КР", "", "", "rowspan='2'");
				$this->_th("&nbsp;", "", "", "rowspan='2'");
				$this->_th("КЗ", "", "", "rowspan='2'");
			$this->_utr();
			$this->_tr();
			$this->_utr();
			
			$sum = array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
			$toc_sum=0;
			$sum[11]=" ";
			while ($rez=$pg->_getResult())			
			{
				$pz_sum=$kz_sum=$kr_sum=0;
			    $color = new pgsql();
			    $color->_query("SELECT record, record_number, record_date, admin, subfaculty as sub, parent_id FROM prog, prog_status WHERE prog_status.program_id = prog.program_id AND prog.program_id = '".$rez["program_id"]."'");
			    $crez = $color->_getResult();
			    $control = new pgsql();
			    $control->_query("SELECT * FROM control WHERE program_id = '".$rez["program_id"]."'");
					 $max=/*$rez["weeks"]*/21;
					for ($n=0;$n<$max;$n++)					
						$arr[$n]="";
					while($contrez=$control->_getResult())
					{
						switch ($contrez["control_type"]) {
						case 'КЗ': $kz=$contrez["vol"]; $kz_sum+=$kz;break;
						case 'КР': $kr=$contrez["vol"]; $kr_sum+=$kr;break;
						case 'ПЗ': $pz=$contrez["vol"]; $pz_sum+=$pz;break;
						}
//						$vol[$contrez["week"]-1]=$contrez["vol"];
//						var_dump($contrez);
					}
			    //var_dump($arr);			    
			    $class = "class='signed'";
				$this->_tr();
				$this->_ctd($i,'',$i);
				$this->_ctd("<a href=index.php?section=prog&year=$year&subfaculty=".$rez["subfaculty"]."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>",'','',$class);
				$this->_ctd("<nobr>".$rez["subfaculty"]."</nobr>");
//				($rez["zach"]=='t' || $rez["difzach"]=='t') ? $this->_ctd("+") : $this->_ctd();
				if ($rez["zach"]=='t') { $this->_ctd("+"); $sum[0]++; } else $this->_ctd();
				if ($rez["difzach"]=='t') { $this->_ctd("+"); $sum[1]++; } else $this->_ctd();
				if ($rez["exam"]=='t') { $this->_ctd("+"); $sum[2]++; } else $this->_ctd();
				$a=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$kz_sum+$kr_sum;
				$ur=$a+$rez["individual"];
				$e=($rez["zach"]=='t' && $rez["zach_count"]=='t')?18:0;
				$e+=($rez["difzach"]=='t')?18:0;
				$e+=($rez["exam"]=='t')?36:0;
				$to=$ur+$e;
				$s=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$rez["individual"];
				$kred=round($to/36);
				$kred_div=($to/36-$kred)*10;
				//echo $kred_div;
				($kred_div > 4) ? $toc=$kred+0.5 : $toc = $kred;
				$toc_sum+=$toc;
				$this->_ctd($toc,'','',"class='right' id='kred'");				
				$this->_ctd($to,'','',"class='right' id='vol'");				
				$this->_ctd($ur,'','',"class='right' id='to'");				
				$this->_ctd($a,'','',"class='right' id='a'");				
				$this->_ctd($lect=$rez["lectures"],'','',"class='right' id='lec'");				
				$this->_ctd($sem=$rez["seminars"],'','',"class='right'");				
				$this->_ctd($lab=$rez["labs"],'','',"class='right'");				
				$this->_ctd($kr_sum,'','',"class='right'");				
				$this->_ctd('','','',"class='right'");				
				$this->_ctd($kz_sum,'','',"class='right'");				
				$this->_ctd($ind=$rez["individual"],'','',"class='right'");
				$this->_ctd($e,'','',"class='right'");				
				
				$nlec=($a)/$rez["weeks"];
				$nind=$rez["individual"]/$rez["weeks"];				
				$this->_ctd(round($nlec),"","","class='right'");				
				$this->_ctd(round($nind),'','',"class='right'");
				($crez["record"]==1) ? 
				$this->_ctd("<a href=print.php".$this->href."&record_number=".$crez["record_number"]."&record_date=".$crez['record_date']."&action=zap><nobr>".$crez['record_number']."/".$crez['record_date']."</nobr></a><br>","sub","","align='center'"): $this->_ctd("&nbsp;");				
//				$this->_ctd($crez["record_number"]."/".$crez["record_date"],'sub','',"align='center'") : $this->_ctd("");				
				$this->_utr();
				$i++;
				$sum[3]+=$toc;
				$sum[4]+=$to;
				$sum[5]+=$ur;
				$sum[6]+=$a;
				$sum[7]+=$lect;
				$sum[8]+=$sem;
				$sum[9]+=$lab;
				$sum[10]+=$kr_sum;
				$sum[12]+=$kz_sum;
				$sum[13]+=$ind;
				$sum[14]+=$e;
				$sum[15]+=$nlec;
				$sum[16]+=$nind;
			}
			$this->_tr();
				$this->_th("Итого", "", "", "colspan='3'");
				for ($i=0;$i<17;$i++)				
					$this->_th(round($sum[$i],2));
			$this->_utr();
				break;
			case 1:
			$show=1;
			$cnt = new pgsql();
			while ($rez=$pg->_getResult())			
			{
			if ($show)
			{
				$this->_th("Сроки контрольных мероприятий",'','',"colspan='21' width=");
				$this->_utr();
				$this->_tr();
				for ($n=0;$n</*$rez["weeks"]*/21;$n++)
					$this->_th($n+1);
				$this->_utr();
				$show=0;
			}
				$this->_tr();
					$this->_ctd($i);
				$this->_ctd("<a href=index.php?section=prog&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>");
					$this->_ctd("<nobr>".$rez["subfaculty"]."</nobr>");

					$cnt->_query("SELECT * from control 
					 WHERE program_id='".$rez["program_id"]."'" 
					 );
					 $max=/*$rez["weeks"]*/21;
					for ($n=0;$n<$max;$n++)					
						$arr[$n]="";
					while($crez=$cnt->_getResult())
					{
						$arr[$crez["week"]-1]=$crez["control_type"];
						$vol[$crez["week"]-1]=$crez["vol"];
					}
					// Курсовой проект
					($arr[14] == 'КП') ? $arr = array("","","","","","","КП","","","КП","","","КП","","КП","","") : "";
					($arr[13] == 'КП') ? $arr = array("","","","КП","","","КП","","","КП","","","","КП","","") : "";
					($arr[16] == 'ДП') ? $arr = array("","","","","ДП","","","","ДП","","","","ДП","","","","ДП","","","") : "";
					for ($n=0;$n<$max;$n++)
					{
						$this->_ctd($arr[$n],'',''.$i.$n.'',"class='control' onClick='moveControl(this.id)'");
//						echo "<input type='hidden' name='".$crez["control_id"]."' value='".$crez["week"]."'>\n";
						if ($arr[$n]=="ДП" || $arr[$n]=="КП" || $arr[$n]=="ДЗ") echo "<script>colorControl($i, $n, $vol[$n]);</script>";
						
					}
				$this->_utr();
				$i++;
			} 
				break;
			case 2:
			$st = new pgsql();
				$this->_th("ФИО");
				$this->_th("Ученое звание");
				$this->_th("Должность");
				$this->_th("Совместитель");
				while ($rez=$pg->_getResult())
				if ($rez["lectures"])			
				{
					$st->_query("SELECT * from stuf 
							WHERE program_id='".$rez["program_id"]."';"
					  		);
					$stuf = $st->_getResult();
					$this->_tr();
					$this->_ctd($i);
					$this->_ctd("<a href=index.php?section=prog&subfaculty=".$rez['subfaculty']."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>");
					$this->_ctd("<nobr>".$rez['subfaculty']."</nobr>");
					echo $this->_inputHidden("id".$i,$rez['program_id']);
					$this->_ctd($this->_inputText("fio".$i,32,254,$stuf['stuf_fio']),"","","align='center'");
					$this->_ctd($this->_cSelect("degree".$i, "1", Array( Array("нет","ктн","дтн","кфн","дфгмн") , Array("нет","ктн","дтн","кфн","дфгмн")), $stuf['stuf_degree']));
					$this->_ctd($this->_cSelect("post".$i,"1",Array(Array("ассистент","старший преподаватель","доцент","профессор"),Array("ассистент","старший преподаватель","доцент","профессор")), $stuf['stuf_post']));
					$this->_ctd($this->_checkBox("nmain_job".$i,($stuf["stuf_mainjob"]=="t")?1:0));
					$this->_utr();
					$i++;
				}
				break;
			case 3: //Зачетные еденицы
				while ($rez=$pg->_getResult())			
				{
				$this->_tr();
				$this->_ctd($i,'',$i);
				$this->_ctd("<a href=index.php?section=prog&subfaculty=".$rez["subfaculty"]."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>");
				$this->_ctd("<nobr>".$rez["subfaculty"]."</nobr>");
				$this->_utr();
				$i++;
				}
				break;
			case 4:
			$trans = array(20,150,30,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25);
			$cnt = new pgsql();
			$rez=$pg->_getResult();


 				$this->_th("Форма контроля", "", "", "colspan='3'");
				$this->_th("Кредиты", "", "", "rowspan='6'");
				$this->_th("Общая трудоемкость (час)", "", "", "colspan='11'");
				$this->_th("В неделю, час", "", "", "colspan='2'");
				$this->_th("Сроки контрольных мероприятий",'','',"colspan='21' width=");
			$this->_utr();
			$this->_tr();
				$this->_th("ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ДИФ<br>ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ЭКЗ", "", "", "rowspan='5'");
				$this->_th("Всего", "", "", "rowspan='5'");
				$this->_th("Теоретическое обучение (час)", "", "", "colspan='9'");
				$this->_th("Экз\nчас", "", "", "rowspan='5'");
				$this->_th("Ауд", "", "", "rowspan='5'");
				$this->_th("Сам", "", "", "rowspan='5'");
				for ($n=0;$n<21;$n++) {
					if ($footer["weeks"] == 13 && $n > 3 && $n < 17 ) $style = "style ='background:white'";
					elseif ($footer["weeks"] == 17 && $n < 17) $style = "style ='background:white'";
					elseif ($footer["weeks"] == 20 && $n < 20 ) $style = "style ='background:white";
					else $style = '';
//					echo $n." ";
					$this->_th($n+1,"","","rowspan='5' width='30px'".$style);
					$trans[count($trans)]=15;
				}
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='4'");
				$this->_th("Аудиторные занятия (час)", "", "", "colspan='7'");
				$this->_th("Сам.\nраб.\n(час)", "", "", "rowspan='4'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='3'");
				$this->_th("В том числе (час)", "", "", "colspan='6'");
			$this->_utr();
			$this->_tr();
				$this->_th("Л", "", "", "rowspan='2'");
				$this->_th("С", "", "", "rowspan='2'");
				$this->_th("ПЗ", "", "", "rowspan='2'");
				$this->_th("КР", "", "", "rowspan='2'");
				$this->_th("&nbsp;", "", "", "rowspan='2'");
				$this->_th("КЗ", "", "", "rowspan='2'");
			$this->_utr();

/*				$this->_th("ЗАЧ", "", "", "rowspan='3'");
				$this->_th("ДИФ<br>ЗАЧ", "", "", "rowspan='3'");
				$this->_th("ЭКЗ", "", "", "rowspan='3'");
				$this->_th("Трудоемкость, час", "", "", "colspan='7'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='2'");
				$this->_th("ЛЕК", "", "", "rowspan='2'");
				$this->_th("УПР", "", "", "rowspan='2'");
				$this->_th("ЛАБ", "", "", "rowspan='2'");
				$this->_th("САМ", "", "", "rowspan='2'");
			$this->_utr();
			$this->_tr();
				$this->_th("АУД");
				$this->_th("САМ");
			$this->_utr();
*/			$sum = array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
			//Распорки из прозрачного GIF-а
			$this->_tr();
			$this->_utr();
			$this->_tr();
			for ($n=0;$n<count($trans);$n++)
				$this->_th("<img src='img/trans.gif' height=1px width=".$trans[$n]."px border=0px hspace=0px vspace=0px>");
			$this->_utr();
						
			do			
			{
				$count=0;
				$pz=$kz=$kr=$to=$toc=0;
				$pz_sum=$kz_sum=$kr_sum=$to_sum=$toc_sum=0;
				$color = new pgsql();
			    $color->_query("SELECT record, record_number, record_date, admin, subfaculty as sub, parent_id FROM prog, prog_status WHERE prog_status.program_id = prog.program_id AND prog.program_id = '".$rez["program_id"]."'");
			    $crez = $color->_getResult();
			    $control = new pgsql();
			    $control->_query("SELECT * FROM control WHERE program_id = '".$rez["program_id"]."'");
					 $max=/*$rez["weeks"]*/21;
					for ($n=0;$n<$max;$n++)					
						$arr[$n]="";
					while($contrez=$control->_getResult())
					{
						switch ($contrez["control_type"]) {
						case 'КЗ': $kz_sum+=$contrez["vol"];break;
						case 'КР': $kr_sum+=$contrez["vol"];break;
						case 'ПЗ': $pz_sum+=$contrez["vol"];break;
						}
//						$vol[$contrez["week"]-1]=$contrez["vol"];
					}
				
				$oldyear = $rez["year"];
//				define ("TDCMP", "id='$cid' onMouseOver=select('$pid'); onMouseOut=disSelect('$pid');");
				$cid = ($this->year==$rez["year"]) ? $rez["parent_id"]."p" : $rez["program_id"]."o";
				$pid = ($this->year==$rez["year"]) ? $rez["parent_id"] : $rez["program_id"];
//				define ("TDCMP", "id='$cid' onMouseOver=select('$pid'); onMouseOut=disSelect('$pid');");

				$this->_tr();
//				$this->_ctd($i,'','',TDCMP);
				$this->_ctd($i,'',(++$count).$cid,"onMouseOver=select('".$count.$pid."'); onMouseOut=disSelect('".$count.$pid."');");
//				$this->_ctd($i,'',$this->cmpRet($rez["program_id"], $rez["parent_id"], $rez["year"]));
//				$this->_ctd("<a href=index.php?section=prog&subfaculty=".$rez["subfaculty"]."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>",'',(++$count).$cid);
				$this->_ctd($rez["discipline_title"],'',(++$count).$cid);
				$this->_ctd("<nobr>".$rez["subfaculty"]."</nobr>",'',(++$count).$cid);
//				($rez["zach"]=='t' || $rez["difzach"]=='t') ? $this->_ctd("+") : $this->_ctd();
				if ($rez["zach"]=='t') { $this->_ctd("+"); $sum[0]++; } else $this->_ctd();
				if ($rez["difzach"]=='t') { $this->_ctd("+"); $sum[1]++; } else $this->_ctd();
				if ($rez["exam"]=='t') { $this->_ctd("+"); $sum[2]++; } else $this->_ctd();
				$a=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$kz+$kr;
				$ur=$a+$rez["individual"];
				$e=($rez["zach"]=='t' && $rez["zach_count"]=='t')?18:0+($rez["difzach"]=='t')?18:0+($rez["exam"]=='t')?36:0;
				$to=$ur+$e;
				$s=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$rez["individual"];				
				$kred=round($to/36);
				$kred_div=($to/36-$kred)*10;
				//echo $kred_div;
				($kred_div > 4) ? $toc=$kred+0.5 : $toc = $kred;
				$toc_sum+=$toc;
				$this->_ctd($toc,'','',"class='right' id='kred'");				
				$this->_ctd($to,'','',"class='right' id='vol'");				
				$this->_ctd($ur,'','',"class='right' id='to'");				
				$this->_ctd($a,'','',"class='right' id='a'");				
				$this->_ctd($lect=$rez["lectures"],'','',"class='right' id='lec'");				
				$this->_ctd($sem=$rez["seminars"],'','',"class='right'");				
				$this->_ctd($lab=$rez["labs"],'','',"class='right'");				
				$this->_ctd($kr_sum,'','',"class='right'");				
				$this->_ctd('','','',"class='right'");				
				$this->_ctd($kz_sum,'','',"class='right'");				
				$this->_ctd($ind=$rez["individual"],'','',"class='right'");
				$this->_ctd($e,'','',"class='right'");				
	
				$nlec=($rez["lectures"]+$rez["seminars"]+$rez["labs"])/$rez["weeks"];
				$nind=$rez["individual"]/$rez["weeks"];				
				$this->_ctd(round($nlec,2),'','',(fmod(($rez["lectures"]+$rez["seminars"]+$rez["labs"]),$rez["weeks"]))?"class='td_red'":"class='right'");				
				$this->_ctd(round($nind,2),'','',(fmod($rez["individual"],$rez["weeks"]))?"class='td_red'":"class='right'");
				
					$cnt->_query("SELECT * from control 
					 WHERE program_id='".$rez["program_id"]."'" 
					 );
					 $max=/*$rez["weeks"]*/21;
					for ($n=0;$n<$max;$n++)					
						$arr[$n]="";
					while($crez=$cnt->_getResult())
					{
						$arr[$crez["week"]-1]=$crez["control_type"];
					}
					for ($n=0;$n<$max;$n++)
					{
						$this->_ctd($arr[$n],'',(++$count).$cid,"class='control'");
//						$this->_ctd($arr[$n],'',''.$i.$n.'',"class='control' onClick='moveControl(this.id)'");
//						echo "<input type='hidden' name='".$crez["control_id"]."' value='".$crez["week"]."'>\n";
						
					}
				$this->_utr();
				$i++;
				$sum[3]+=$toc;
				$sum[4]+=$to;
				$sum[5]+=$ur;
				$sum[6]+=$a;
				$sum[7]+=$lect;
				$sum[8]+=$sem;
				$sum[9]+=$lab;
				$sum[10]+=$kr_sum;
				$sum[12]+=$kz_sum;
				$sum[13]+=$ind;
				$sum[14]+=$e;
				$sum[15]+=$nlec;
				$sum[16]+=$nind;
		if ($this->year!=$oldyear) print ("<script>cmp('".$pid."');</script>");
			}
			while ($rez=$pg->_getResult());
			$this->_tr();	($formN == 2)?$this->_uform():"";	

				$this->_th("Итого", "", "", "colspan='3'");
				for ($i=0;$i<17;$i++)				
					$this->_th(round($sum[$i],2));
				for ($i=0;$i<21;$i++)
					$this->_th('');
			$this->_utr();
				
				break;
				
			default:
				$this->_th("ЗАЧ", "", "", "rowspan='3'");break;
			}
			$this->_utr();		
		$this->_utable();
		echo "<br>";
/*		$this->_table('','','width="100%"');
			$this->_utr();
					$this->_ctd("Заведующий кафедрой:<br>Дата:");		
					$this->_ctd("Декан факультета:<br>Дата:");		
					$this->_ctd("Учебное управление:<br>Дата:");		
					$this->_ctd("Методический отдел:<br>Дата:");		
			$this->_utr();		
		$this->_utable();
*/	$this->_udiv();	
//		print ("<br><a href='#' onClick=printDoc('otrBody')>Печать</a>");
		print ("<br><a href='print.php?action=otr&year=".$this->year."&semester=".$_GET["sem"]."&subfaculty=".urlencode($_GET["subfaculty"])."&speciality=".$_GET["spec"]."&lang_first=".$_GET["lang_first"]."&lang_second=".$_GET["lang_second"]."&weeks=".$footer["weeks"]."'>Печать</a>");
		print ("<br><a href='print.php?action=otrAll&year=".$this->year."&subfaculty=".urlencode($_GET["subfaculty"])."&lang_first=".$_GET["lang_first"]."&lang_second=".$_GET["lang_second"]."'>Напечатать всё</a>");
//		echo $this->year.$rez["year"];
	}

	function planForm() {	
	$i=1;
	$semester=0;
	$pg = new pgsql();
	$pg->_query("SELECT * from prog 
					 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
					 INNER JOIN lang ON (f_id = prog.program_id
					 AND lang_first='".$_GET["lang_first"]."'
					 AND lang_second='".$_GET["lang_second"]."')
					 WHERE subfaculty_for='".$_GET["subfaculty"]."' 
					 AND speciality_for='".$_GET["spec"]."'
					 AND year = $this->year
					 ORDER BY semester"
					  );

	$span=6;
		echo "<div id='planBody'>";
		$this->_table('','',"class='spisok'");
			$this->_tr();
				$this->_th("Рабочие учебные планы кафедры <span class='subfaculty'>".$_GET["subfaculty"]."</span>.", "", "", "colspan='21'");
			$this->_utr();
/*			$this->_tr();
				$this->_th("п", "", "", "rowspan='$span'");
				$this->_th("<br><br>ДИСЦИПЛИНЫ", "", "", "rowspan='$span' width='350px'");
				$this->_th("КАФЕДРА", "", "", "rowspan='$span'");
				$this->_th("ЗАЧ", "", "", "rowspan='3'");
				$this->_th("ДИФ", "", "", "rowspan='3'");
				$this->_th("ЭКЗ", "", "", "rowspan='3'");
				$this->_th("ВСЕГО ЧАСОВ", "", "", "colspan='7'");
			$this->_utr();
			$this->_tr();
				$this->_th("АУДИТОРНЫХ", "", "", "colspan='4'");
				$this->_th("САМОСТ", "", "", "rowspan='2'");
				$this->_th("В НЕДЕЛЮ", "", "", "colspan='2'");
			$this->_utr();
			$this->_tr();
				$this->_th("В<br> СЕМЕСТРЕ");
				$this->_th("ЛЕКЦ");
				$this->_th("УПР");
				$this->_th("ЛАБ");
				$this->_th("АУД");
				$this->_th("САМ");
			$this->_utr();
			$sum = array(0,0,0,0,0,0,0,0,0,0);
			while ($rez=$pg->_getResult())			
			{
				if ($rez["semester"]!=$semester)
				{
					$this->_tr();
					$this->_th("СЕМЕСТР ".$rez["semester"], "", "", "colspan='13'");
					$this->_utr();
					$semester=$rez["semester"];
				}
				$class = "class='signed'";
				$this->_tr();
				$this->_ctd($i);
				$this->_ctd("<a href=index.php?section=prog&year=".$this->year."&subfaculty=".$_GET["subfaculty"]."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>",'','',$class);
				$this->_ctd($rez["subfaculty"]);
//				($rez["zach"]=='t' || $rez["difzach"]=='t') ? $this->_ctd("+") : $this->_ctd();
				if ($rez["zach"]=='t') { $this->_ctd("+"); $sum[0]++; } else $this->_ctd();
				if ($rez["difzach"]=='t') { $this->_ctd("+"); $sum[1]++; } else $this->_ctd();
				if ($rez["exam"]=='t') { $this->_ctd("+"); $sum[2]++; } else $this->_ctd();
				$this->_ctd($s=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$rez["individual"]);				
				$this->_ctd($lect=$rez["lectures"]);				
				$this->_ctd($sem=$rez["seminars"]);				
				$this->_ctd($lab=$rez["labs"]);				
				$this->_ctd($ind=$rez["individual"]);				
				$this->_ctd($nlec=floor(($rez["lectures"]+$rez["seminars"]+$rez["labs"])/$rez["weeks"]),'','',(fmod(($rez["lectures"]+$rez["seminars"]+$rez["labs"]),$rez["weeks"]))?"class='td_red'":'');				
				$this->_ctd($nind=floor($rez["individual"]/$rez["weeks"]),'','',(fmod($rez["individual"],$rez["weeks"]))?"class='td_red'":'');				
				$this->_utr();
				$i++;
				$sum[3]+=$s;
				$sum[4]+=$lect;
				$sum[5]+=$sem;
				$sum[6]+=$lab;
				$sum[7]+=$ind;
				$sum[8]+=$nlec;
				$sum[9]+=$nind;
			}
			$this->_tr();
				$this->_th("Итого", "", "", "colspan='3'");
				for ($i=0;$i<10;$i++)				
					$this->_th($sum[$i]);
			$this->_utr();
			$this->_utr();		
		$this->_utable();
		echo "</div>";
		print ("<br><a href='#' onClick=printDoc('planBody')>Печать</a>");


*/
//		$this->_table('','',"class='spisok'");
			$this->_tr();
				$this->_th("п", "", "", "rowspan='$span'");
				$this->_th("Дисциплины", "", "", "rowspan='$span' width='350px'");
				$this->_th("КАФ", "", "", "rowspan='$span'");
				$this->_th("Форма контроля", "", "", "colspan='3'");
				$this->_th("Кредиты", "", "", "rowspan='6'");
				$this->_th("Общая трудоемкость (час)", "", "", "colspan='11'");
				$this->_th("В неделю, час", "", "", "colspan='2'");
				$this->_th("Служебная записка", "", "", "rowspan='6'");
			$this->_utr();
			$this->_tr();
				$this->_th("ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ДИФ<br>ЗАЧ", "", "", "rowspan='5'");
				$this->_th("ЭКЗ", "", "", "rowspan='5'");
				$this->_th("Всего", "", "", "rowspan='5'");
				$this->_th("Теоретическое обучение (час)", "", "", "colspan='9'");
				$this->_th("Экз\nчас", "", "", "rowspan='5'");
				$this->_th("Ауд", "", "", "rowspan='5'");
				$this->_th("Сам", "", "", "rowspan='5'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='4'");
				$this->_th("Аудиторные занятия (час)", "", "", "colspan='7'");
				$this->_th("Сам.\nраб.\n(час)", "", "", "rowspan='4'");
			$this->_utr();
			$this->_tr();
				$this->_th("Всего", "", "", "rowspan='3'");
				$this->_th("В том числе (час)", "", "", "colspan='6'");
			$this->_utr();
			$this->_tr();
				$this->_th("Л", "", "", "rowspan='2'");
				$this->_th("С", "", "", "rowspan='2'");
				$this->_th("ПЗ", "", "", "rowspan='2'");
				$this->_th("КР", "", "", "rowspan='2'");
				$this->_th("&nbsp;", "", "", "rowspan='2'");
				$this->_th("КЗ", "", "", "rowspan='2'");
			$this->_utr();
			$this->_tr();
			$this->_utr();
			
			$sum = array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
			$toc_sum=0;
			$sum[11]=" ";
			while ($rez=$pg->_getResult())			
			{
				if ($rez["semester"]!=$semester)
				{
					$this->_tr();
					$this->_th("СЕМЕСТР ".$rez["semester"], "", "", "colspan='21'");
					$this->_utr();
					$semester=$rez["semester"];
				}
				$pz_sum=$kz_sum=$kr_sum=0;
			    $color = new pgsql();
			    $color->_query("SELECT record, record_number, record_date, admin, subfaculty as sub, parent_id FROM prog, prog_status WHERE prog_status.program_id = prog.program_id AND prog.program_id = '".$rez["program_id"]."'");
			    $crez = $color->_getResult();
			    $control = new pgsql();
			    $control->_query("SELECT * FROM control WHERE program_id = '".$rez["program_id"]."'");
					 $max=/*$rez["weeks"]*/21;
					for ($n=0;$n<$max;$n++)					
						$arr[$n]="";
					while($contrez=$control->_getResult())
					{
						switch ($contrez["control_type"]) {
						case 'КЗ': $kz=$contrez["vol"]; $kz_sum+=$kz;break;
						case 'КР': $kr=$contrez["vol"]; $kr_sum+=$kr;break;
						case 'ПЗ': $pz=$contrez["vol"]; $pz_sum+=$pz;break;
						}
//						$vol[$contrez["week"]-1]=$contrez["vol"];
//						var_dump($contrez);
					}
			    //var_dump($arr);			    
			    $class = "class='signed'";
				$this->_tr();
				$this->_ctd($i,'',$i);
				$this->_ctd("<a href=index.php?section=prog&year=".$rez["year"]."&subfaculty=".$rez["subfaculty"]."&action=view&program=".$rez["program_id"].">".$rez["discipline_title"]."</a>",'','',$class);
				$this->_ctd("<nobr class='subfaculty'>".$rez["subfaculty"]."</nobr>");
//				($rez["zach"]=='t' || $rez["difzach"]=='t') ? $this->_ctd("+") : $this->_ctd();
				if ($rez["zach"]=='t') { $this->_ctd("+"); $sum[0]++; } else $this->_ctd();
				if ($rez["difzach"]=='t') { $this->_ctd("+"); $sum[1]++; } else $this->_ctd();
				if ($rez["exam"]=='t') { $this->_ctd("+"); $sum[2]++; } else $this->_ctd();
				$a=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$kz_sum+$kr_sum;
				$ur=$a+$rez["individual"];
				$e=($rez["zach"]=='t' && $rez["zach_count"]=='t')?18:0;
				$e+=($rez["difzach"]=='t')?18:0;
				$e+=($rez["exam"]=='t')?36:0;
				$to=$ur+$e;
				$s=$rez["lectures"]+$rez["seminars"]+$rez["labs"]+$rez["individual"];
				$kred=round($to/36);
				$kred_div=($to/36-$kred)*10;
				//echo $kred_div;
				($kred_div > 4) ? $toc=$kred+0.5 : $toc = $kred;
				$toc_sum+=$toc;
				$this->_ctd($toc,'','',"class='right' id='kred'");				
				$this->_ctd($to,'','',"class='right' id='vol'");				
				$this->_ctd($ur,'','',"class='right' id='to'");				
				$this->_ctd($a,'','',"class='right' id='a'");				
				$this->_ctd($lect=$rez["lectures"],'','',"class='right' id='lec'");				
				$this->_ctd($sem=$rez["seminars"],'','',"class='right'");				
				$this->_ctd($lab=$rez["labs"],'','',"class='right'");				
				$this->_ctd($kr_sum,'','',"class='right'");				
				$this->_ctd('','','',"class='right'");				
				$this->_ctd($kz_sum,'','',"class='right'");				
				$this->_ctd($ind=$rez["individual"],'','',"class='right'");
				$this->_ctd($e,'','',"class='right'");				
				
				$nlec=$a/$rez["weeks"];
				$nind=$rez["individual"]/$rez["weeks"];				
				$this->_ctd(round($nlec,0),'','',(fmod($a,$rez["weeks"]))?"class='td_red_right'":"class='right'");				
				$this->_ctd(round($nind,0),'','',(fmod($rez["individual"],$rez["weeks"]))?"class='td_red_right'":"class='right'");
				($crez["record"]==1) ? 
				$this->_ctd("<a href=print.php".$this->href."&record_number=".$crez["record_number"]."&record_date=".$crez['record_date']."&action=zap><nobr>".$crez['record_number']."/".$crez['record_date']."</nobr></a><br>","sub","","align='center'"): $this->_ctd("&nbsp;");				
//				$this->_ctd($crez["record_number"]."/".$crez["record_date"],'sub','',"align='center'") : $this->_ctd("");				
				$this->_utr();
				$i++;
				$sum[3]+=$toc;
				$sum[4]+=$to;
				$sum[5]+=$ur;
				$sum[6]+=$a;
				$sum[7]+=$lect;
				$sum[8]+=$sem;
				$sum[9]+=$lab;
				$sum[10]+=$kr_sum;
				$sum[12]+=$kz_sum;
				$sum[13]+=$ind;
				$sum[14]+=$e;
				$sum[15]+=$nlec;
				$sum[16]+=$nind;
			}
			$this->_tr();
				$this->_th("Итого", "", "", "colspan='3'");
				for ($i=0;$i<17;$i++)				
					$this->_th(round($sum[$i],2));
			$this->_utr();

		$this->_utable();
		echo "</div>";
		print ("<br><a href='#' onClick=printDoc('planBody')>Печать</a>");
	}

	public function _Control($action="view") {
		$this->_table("","","align='center' border='1'");
			$this->_tr();
				$this->_th("Контрольные дициплины", "", "", "colspan='17'");
			$this->_utr();
			$this->_tr();
					for ($i=1;$i<18;$i++) $this->_th($i);
			$this->_utr();
		$this->_utable();
	}	


	public function _button($href, $caption, $id)
	{
			($id==$_GET["action"] || $id==$_GET["section"] ) ? $this->tdButtonSel($href,$caption,$id) : $this->tdButton($href,$caption,$id);
	}
	
	public function _buttonGrey($href, $caption, $id)
	{
			($id==$_GET["action"] || $id==$_GET["section"] ) ? $this->tdButtonSelGrey($href,$caption,$id) : $this->tdButtonGrey($href,$caption,$id);
	}
	
	public function MakeMenuForInsert()
	{
		global $IsAdmin;
		global $IsRector;
		global $IsFaculty;
		global $IsSubFaculty;
		global $Department;
		global $KafArray;


		$IsAdmin=true;
		
		$i=-1;

		if (file_exists('xml/structure'.$this->year.'.xml')) {
			$parsed = simplexml_load_file('xml/structure'.$this->year.'.xml');
// 			print_r($parsed);
		}
		else $parsed = simplexml_load_file('struct.xml');
//		print_r($parsed);
//		if (!$parsed) echo "struct.xml error!!!";
		//$parsed = simplexml_load_file('http://127.0.0.1/structure/struct.xml');
		while(($current_faculty = $parsed->faculty[++$i]))
		{
			if(($IsRector||$IsAdmin||($current_faculty[uid]==$Department)))
			{
				$j=-1;
				$ret2 = "";
				while($current_faculty->subfaculty[++$j]['abbr'])
				{
			//проверка, если юзер-кафедра
					$Kaf=0;
					for($C=0;$C<count($KafArray);$C++)
						if($KafArray[$C]==ereg_replace("-","",$current_faculty->subfaculty[$j]['abbr']))
							$Kaf=1;
					$k=-1;
		
					$Correct=0;
					for($С=0;$С<count($KafArray);$С++)
						if($IsSubFaculty&&(ereg_replace("-","",$current_faculty->subfaculty[$j]['abbr'])==$KafArray[$С]))
							$Correct=1;
					if($IsRector||$IsAdmin||$IsFaculty)$Correct=1;
				//	
		
					if($Correct)
					{
						$ret2.= "<p class=menulevel2><img src=img/b-arrow.gif>"
						. "<a href=index.php".$this->href."&subfaculty=".$current_faculty->subfaculty[$j]['abbr']
						. "&faculty_code=$current_faculty[uid]"
						. "&section=".$_GET["section"] 
						. "&action=view>"
//						. "<a target=myFr href=index.php?action=listByGroup&group=".$current_faculty->subfaculty[$j]->group[$k]['abbr']."&spec_code=".$current_faculty->subfaculty[$j]->group[$k]['speciality_code']."&faculty=$current_faculty[abbr]&faculty_code=$current_faculty[uid]>"
						. $current_faculty->subfaculty[$j]['abbr']."<br>".$current_faculty->subfaculty[$j]['name']."</a></p>\n";
						if ($_GET["subfaculty"]) 
							if ($_GET["subfaculty"]==$this->toKOI($current_faculty->subfaculty[$j]['abbr']))
							{
								$ret2.="<script>this.src=ShowSub(this.src,'spana$i')</script>";
							}
					}
				}
		
				$ret .= "<p class=menulevel1>"
		        .( $j ? "<img src=img/".(!($IsAdmin||$IsRector)?'b-minus.gif':'b-plus.gif')." class=pointer_img onclick=\"this.src=ShowSub(this.src,'spana$i')\">" : "<img src=img/b-arrow.gif>" )
		        ." <!a target=myFr href=ndex.php?action=listByFaculty&faculty=".$current_faculty['abbr'].">".$current_faculty['abbr']." - ".$current_faculty['name']."</a></p>\n"
		       ."<span id=spana$i style='display:".(!($IsAdmin||$IsRector)?'inline':'none')."'>"
		       .$ret2
		       ."</span>";
			}
		}
		return $ret;
	}
    
	function getGroup($subfaculty, $semester, $speciality, $lang_first=0, $lang_second=0) {
//	echo $subfaculty." ".$semester." ".$speciality;
	    $i=-1;
	    $ret = '';
		$parsed = simplexml_load_file('struct.xml');
		while(($current_faculty = $parsed->faculty[++$i])) {
		    $j=-1;
//    		    echo $this->toKOI($current_faculty['abbr'])."<br>";
			while($current_subfaculty = $current_faculty->subfaculty[++$j]) {
				$k=-1;
				if ($subfaculty == $this->toKOI($current_subfaculty['abbr']))
					while ($current_group = $current_subfaculty->group[++$k]) {
					    if ($current_group['speciality_code'] == $speciality && $current_group['semester'] == $semester && $current_group['lang_first'] == $lang_first && $current_group['lang_second'] == $lang_second)
						$ret .= $this->toKOI($current_subfaculty->group[$k]['abbr'])." ";
					}
			}
		}
//	    echo $subfaculty;
//	    echo "ret: ";
//	    print_r($ret);
	    return "<b>".rtrim($ret)."</b>";
	}

	public function colorCmp($str,$pstr) {
//		if (!$_SESSION["name"]) return "white";
		if ($pstr == '') return "white";
		elseif ($str == $pstr) return "white";
		else return "yellow";	
	}

	public function toKOI($str){
		return iconv("UTF-8","UTF-8",$str);
	}

	public function toUTF($str){
		return iconv("UTF-8","UTF-8",$str);
	}
	
	public function getControl($action, $type, $program_id){
		if ($action!='add') {
		$pg = new pgsql();
		$pg->_query("SELECT count(control_type) as cnt, sum(vol) as sum
		             FROM control
					    WHERE program_id='$program_id'
					    AND control_type='$type'" );
		$rez=$pg->_getResult();
		return $rez;
		}
		return 0;
	}
	
	public function cmpRet($id, $pid, $year) {
	    $cid = ($this->year==$year) ? $pid."p" : $id."o";
	    $pid = ($this->year==$year) ? $pid : $id;
	    return "'$cid', onMouseOver=select('$pid'); onMouseOut=disSelect('$pid');";
	}

}
