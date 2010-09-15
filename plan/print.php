<?php 
if ($_GET["action"]) {
$action = $_GET["action"];
$error = 0;
($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
$record_number = $_GET["record_number"];
$record_date = $_GET["record_date"];

define('FPDF_FONTPATH','fpdf/font/'); 
require('fpdf/fpdf.php'); 
require('print.class.php'); 

//$html=new html();

switch ($action) {
case "otrAll":
	($_GET["subfaculty"]) ? $subfaculty = $_GET["subfaculty"] : $error = 1;
	($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
	($_GET["lang_first"]) ? $lang_first = $_GET["lang_first"] : $error = 1;
	($_GET["lang_second"]) ? $lang_second = $_GET["lang_second"] : $error = 1;
	$subfaculty = toCP(urldecode($subfaculty));
	if (!$error) {
	$otr = new pgsql();
	$otr->_query("SET client_encoding TO 'WIN1251'");
	$otr->_query("SELECT DISTINCT speciality_for as speciality, semester, weeks FROM prog WHERE subfaculty_for='$subfaculty' AND year='$year' ORDER BY speciality_for, semester");
	$pdf = new OTR('L','mm','A3'); 
	$pdf->Open(); 
	$pdf->AddFont('Verdana','','verdana.php'); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	$speciality='';
	$semester='';
	while ($rez=$otr->_getResult()) {
	//Добавляем страничку в документ 
    	    $pdf->AddPage();
	    $pdf->SetLeftMargin(20); 
	    $speciality=$rez["speciality"];
//	    $semester=$rez["semester"];
	    $semester = $rez["semester"];
	    $weeks = $rez["weeks"];
	    //Выводим заголовок, используя написанный нами метод в файле класса //price.class.php 
	    $pdf->PrintTitle($year,$subfaculty,$rez["speciality"],$semester,$lang_first,$lang_second,$weeks);
	    //Выводим отрезок, используя написанный нами метод в файле класса
	    $pdf->PrintOtr($subfaculty,$rez["speciality"],$semester,$year,$lang_first,$lang_second); 
	    //Выводим отрезок, используя написанный нами метод в файле класса
//	    $pdf->PrintOtr($subfaculty,$rez["speciality"],$semester,$year); 
	    $pdf->PrintOtrF($subfaculty);
	    }
	//Выводим документ в браузер 
	$pdf->Output('otrAll.pdf','I');
	}
	break;
case "otr":
	($_GET["subfaculty"]) ? $subfaculty = $_GET["subfaculty"] : $error = 1;
	($_GET["speciality"]) ? $speciality = $_GET["speciality"] : $error = 1;
	($_GET["semester"]) ? $semester = $_GET["semester"] : $error = 1;
	($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
	($_GET["lang_first"]) ? $lang_first = $_GET["lang_first"] : $error = 1;
	($_GET["lang_second"]) ? $lang_second = $_GET["lang_second"] : $error = 1;
	($_GET["weeks"]) ? $weeks = $_GET["weeks"] : $error = 1;
	$subfaculty = toCP(urldecode($subfaculty));
	if (!$error) {
	$pdf = new OTR('L','mm','A3'); 
	$pdf->Open(); 
	$pdf->AddFont('Verdana','','verdana.php'); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	//Добавляем страничку в документ 
	$pdf->SetLeftMargin(20); 
	$pdf->AddPage();
//	$pdf->SetLeftMargin(20); 
	//Выводим заголовок, используя написанный нами метод в файле класса //price.class.php 
	$pdf->PrintTitle($year,$subfaculty,$speciality,$semester,$lang_first,$lang_second,$weeks);
	//Выводим отрезок, используя написанный нами метод в файле класса
	$pdf->PrintOtr($subfaculty,$speciality,$semester,$year,$lang_first,$lang_second); 
	//Выводим отрезок, используя написанный нами метод в файле класса
//	$pdf->PrintOtr($subfaculty,$speciality,$semester,$year); 
	$pdf->PrintOtrF($subfaculty);
	//Выводим документ в браузер 
	$pdf->Output('otr.pdf','I');
	}
	break;
case "prog":
	if ($_GET["id"]) { $error=0; $id = $_GET["id"]; } else $error = 1;
	if (!$error) {
	$pdf = new PROG('P','mm','A4');
	$pdf->Open(); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	//Добавляем страничку в документ 
	$pdf->SetMargins(25,5,5); 
	$pdf->AddPage();
	//Выводим заголовок, используя написанный нами метод в файле класса //price.class.php 
	$pdf->PrintProg($id);
	$pdf->Output('prog.pdf','I');
	} 
	break;	
case "plan":
	if ($_GET["subfaculty"]) { $error=0; $subfaculty = $_GET["subfaculty"]; } else $error = 1;
	($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
	$subfaculty = toCP(urldecode($subfaculty));
	if (!$error) {
	$pdf = new PLAN('L','mm','A3');
	$pdf->Open(); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	$pdf->SetAutoPageBreak('on',1);
	//Добавляем страничку в документ 
	$pdf->SetLeftMargin(20);	
	$pdf->AddPage();
	//Выводим заголовок, используя написанный нами метод в файле класса //price.class.php 
	$pdf->PrintPlan($subfaculty,$year);
	$pdf->Output('plan.pdf','I');
	} 
	break;	
case "zap":
	$pdf = new ZAP('P','mm','A4'); 
	$pdf->Open();
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	//Добавляем страничку в документ 
	$pdf->AddPage();
	$pdf->SetLeftMargin(25); 
	//Выводим заголовок, используя написанный нами метод в файле класса //price.class.php 
	$pdf->PrintZap($record_number, $record_date, $year);
	$pdf->Output('zap.pdf','I');
	break;	
}

}
?>
