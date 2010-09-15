<?php 
define('FPDF_FONTPATH','fpdf/font/'); 
require('fpdf/fpdf.php'); 
require('print.class.php'); 

if ($_GET["action"]) {
$action = $_GET["action"];
$error = 0;
($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
$record_number = $_GET["record_number"];
$record_date = $_GET["record_date"];

//$html=new html();

switch ($action) {
case "otrAll":
	($_GET["subfaculty"]) ? $subfaculty = $_GET["subfaculty"] : $error = 1;
	($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
	$subfaculty = iconv("koi8-r","cp1251",urldecode($subfaculty));
	if (!$error) {
	$otr = new pgsql();
	$otr->_query("SET client_encoding TO 'WIN1251'");
	$otr->_query("SELECT DISTINCT speciality_for as speciality, semester FROM prog WHERE subfaculty_for='$subfaculty' AND year='$year' ORDER BY speciality_for, semester");
	$pdf = new OTR('L','mm','A3'); 
	$pdf->Open(); 
	$pdf->AddFont('Verdana','','verdana.php'); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	$speciality='';
	$semester='';
	while ($rez=$otr->_getResult()) if ($speciality!=$rez["speciality"] || ($speciality==$rez["speciality"] && fmod($rez["semester"],2)) ) {
	//дНАЮБКЪЕЛ ЯРПЮМХВЙС Б ДНЙСЛЕМР 
    	    $pdf->AddPage();
	    $pdf->SetLeftMargin(20); 
	    $speciality=$rez["speciality"];
//	    $semester=$rez["semester"];
	    $semester = ( (!fmod($rez["semester"],2)) ? $rez["semester"]-1 : $rez["semester"]) ;
	    //бШБНДХЛ ГЮЦНКНБНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ //price.class.php 
	    $pdf->PrintTitle($year,$subfaculty,$rez["speciality"],$semester);
	    //бШБНДХЛ НРПЕГНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ
	    $pdf->PrintOtr($subfaculty,$rez["speciality"],$semester++,$year); 
	    //бШБНДХЛ НРПЕГНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ
	    $pdf->PrintOtr($subfaculty,$rez["speciality"],$semester,$year); 
	    $pdf->PrintOtrF($subfaculty);
	    }
	//бШБНДХЛ ДНЙСЛЕМР Б АПЮСГЕП 
	$pdf->Output('otrAll.pdf','I');
	}
	break;
case "otr":
	($_GET["subfaculty"]) ? $subfaculty = $_GET["subfaculty"] : $error = 1;
	($_GET["speciality"]) ? $speciality = $_GET["speciality"] : $error = 1;
	($_GET["semester"]) ? $semester = ( (!fmod($_GET["semester"],2)) ? $_GET["semester"]-1 : $_GET["semester"]) : $error = 1;
	($_GET["year"]) ? $year = $_GET["year"] : $error = 1;
	$subfaculty = iconv("koi8-r","cp1251",urldecode($subfaculty));
	if (!$error) {
	$pdf = new OTR('L','mm','A3'); 
	$pdf->Open(); 
	$pdf->AddFont('Verdana','','verdana.php'); 
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	//дНАЮБКЪЕЛ ЯРПЮМХВЙС Б ДНЙСЛЕМР 
	$pdf->AddPage();
	$pdf->SetLeftMargin(20); 
	//бШБНДХЛ ГЮЦНКНБНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ //price.class.php 
	$pdf->PrintTitle($year,$subfaculty,$speciality,$semester);
	//бШБНДХЛ НРПЕГНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ
	$pdf->PrintOtr($subfaculty,$speciality,$semester++,$year); 
	//бШБНДХЛ НРПЕГНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ
	$pdf->PrintOtr($subfaculty,$speciality,$semester,$year); 
	$pdf->PrintOtrF($subfaculty);
	//бШБНДХЛ ДНЙСЛЕМР Б АПЮСГЕП 
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
	//дНАЮБКЪЕЛ ЯРПЮМХВЙС Б ДНЙСЛЕМР 
	$pdf->AddPage();
	$pdf->SetLeftMargin(25); 
	//бШБНДХЛ ГЮЦНКНБНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ //price.class.php 
	$pdf->PrintProg($id);
	$pdf->Output('prog.pdf','I');
	} 
	break;	
case "zap":
	$pdf = new ZAP('P','mm','A4'); 
	$pdf->Open();
	$pdf->AddFont('TimesNewRomanPSMT','','times.php'); 
	$pdf->AddFont('TimesNewRomanPS-BoldMT','B','timesbd.php'); 
	//дНАЮБКЪЕЛ ЯРПЮМХВЙС Б ДНЙСЛЕМР 
	$pdf->AddPage();
	$pdf->SetLeftMargin(25); 
	//бШБНДХЛ ГЮЦНКНБНЙ, ХЯОНКЭГСЪ МЮОХЯЮММШИ МЮЛХ ЛЕРНД Б ТЮИКЕ ЙКЮЯЯЮ //price.class.php 
	$pdf->PrintZap($record_number, $record_date, $year);
	$pdf->Output('zap.pdf','I');
	break;	
}

}
?>
