<?php
ini_set('max_execution_time', '120');
require_once('pgsql.class.php');
require_once('html.class.php');

define(SESSIONID,4);
ini_set("soap.wsdl_cache_enabled", "0");
$client = new SoapClient( "http://work.e-u.bmstu.ru/contingent/contingent.wsdl", array("trace" => 0) );//ъеоауъ ъпяделпма

class stud
        {
        }

class listStudentsRequest
        {
        var $lastName;
        var $firstName;
        var $middleName;
        var $group;
        var $cardNumber;
        function listStudentsRequest($lastName, $firstName, $middleName, $group, $cardNumber)
                {
                $this->lastName = $lastName;
                $this->firstName = $firstName;
                $this->middleName = $middleName;
                $this->group = $group;
                $this->cardNumber = $cardNumber;
                }
        }

function ListByGroup( $group, $_lastname=NULL, $_firstname=NULL, $_middlename=NULL, $_pcn=NULL )
        {
	$count = 0;
        $client = new SoapClient( "http://work.e-u.bmstu.ru/contingent/contingent.wsdl", array('trace'=>1) );
        try
                {
                        $gr = explode(" ",iconv("CP1251","UTF-8",$group));
			for ($i=0;$i<count($gr);$i++) {
//			    echo $gr[$i];
    			    $student = $client->listStudents(new listStudentsRequest( $_lastname, $_firstname, $_middlename, $gr[$i], $_pcn ))->student;
//			    var_dump($student);
			    $count += count($student);
//			    echo $count;
			}
                }
        catch(Exception $e)
                {
                print_r($e);
                return false;
                }
	return $count;
	}

function comparePrograms($id, $pid) {
        if ($id == '00000000-0000-0000-0000-000000000000' || $pid == '00000000-0000-0000-0000-000000000000') return 1000;
        $count='0';
        $ret = 0;
        $pg_cmp = new pgsql();
        $pg_cmp->_query("SELECT DISTINCT discipline_titleshort, discipline_title, subfaculty, discipline_code FROM dis  WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '$id' OR  program_id = '$pid')");
        while ($rez = $pg_cmp->_getResult())
                $count++;
        if ($count != 1) {
        $ret.='1';
        } else $ret.='0';
        $count=0;
        $pg_cmp->_query("SELECT DISTINCT semester, weeks, lectures, seminars, labs, labscount, individual, zach, difzach, exam, subfaculty_for, speciality_for, seminarscount FROM prog WHERE program_id = '$id' OR  program_id = '$pid'");
        while ($rez = $pg_cmp->_getResult())
                $count++;
        if ($count != 1) {
        $ret.=1;
        }
	else $ret.='0';
        $count=0;
        $pg_cmp->_query("SELECT control_type, control_title, week, vol FROM control WHERE program_id = '$id'");
        while ($rez = $pg_cmp->_getResult())
                $count++;
        $pcount=0;
        $pg_cmp->_query("SELECT control_type, control_title, week, vol FROM control WHERE program_id = '$pid'");
        while ($rez = $pg_cmp->_getResult())
                $pcount++;
        $dcount=0;
        $pg_cmp->_query("SELECT DISTINCT control_type, control_title, week, vol FROM control WHERE program_id = '$id' OR  program_id = '$pid'");
        while ($rez = $pg_cmp->_getResult())
                $dcount++;
        if ($count != $pcount || $count!= $dcount) {
        $ret.=1;
        } else $ret.='0';
        return $ret;
}

function dateto ($date) {
    $ret = '';
    $arr = explode('-',$date);
    for ($i=2;$i>-1;$i--) $ret.=$arr[$i].(($i!=0)?'-':'');
    return $ret;
}

function getGroup($subfaculty, $semester, $speciality) {
            $i=-1;
            $ret = '';
                $parsed = simplexml_load_file('struct.xml');
                while(($current_faculty = $parsed->faculty[++$i])) {
                    $j=-1;
//                  echo $this->toKOI($current_faculty['abbr'])."<br>";
                        while($current_subfaculty = $current_faculty->subfaculty[++$j]) {
                                $k=-1;
//                              echo "---".$this->toKOI($current_subfaculty['abbr'])."<br>";
                                if ($subfaculty == iconv("UTF-8","CP1251",$current_subfaculty['abbr']))
                                        while ($current_group = $current_subfaculty->group[++$k]) {
                                            if ($current_group['speciality_code'] == $speciality && $current_group['semester'] == $semester)
                                                $ret .= iconv("UTF-8","CP1251",$current_subfaculty->group[$k]['abbr'])." ";
                                        }
                        }
        }
	return rtrim($ret);
}

class MyPDF extends FPDF {

	public function MultiCell($width,$height,$text,$padding,$dist,$align) {
	$x=$this->GetX();
	$y=$this->GetY();
	$data_array=split("\n",$text);
	$this->Rect($x, $y, $width, $height);
		for($i=0;$i<count($data_array);$i++) {
			$this_x=$x+$padding;//+$width/2-$this->GetStringWidth(trim($data_array[$i]))/2;
			if($align == 'C') $this_x = $x+$width/2-$this->GetStringWidth(trim($data_array[$i]))/2;
			$this_y=$y+$padding+3;
			$this->Text($this_x,$this_y+$i*$dist,$data_array[$i]);
		}
	$this->SetXY($x+$width,$y);
	}
}

class ZAP extends MyPDF {

	public $baseWidth = 10; 
	public $baseHeight = 5; 
	public $subfaculty = '';

	function PrintZap($record_number, $record_date, $year) {

	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$full = 18;
	$this->SetFont('TimesNewRomanPSMT','',12); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell(12*$baseWidth, $baseHeight, $record_number."/".$record_date,0,0,'L');
//	$this->SetXY($this->GetX()+12*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'оЕПБНЛС ОПНПЕЙРНПС -',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'оПНПЕЙРНПС ОН СВЕАМНИ ПЮАНРЕ',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'е.ц. чДХМС',0,0,'C');
	$this->Ln();
	$this->SetY($this->GetY()+14*$baseHeight);
	$this->Cell($full*$baseWidth, $baseHeight, 'яКСФЕАМЮЪ ГЮОХЯЙЮ',0,0,'C');
	$this->Ln();
	$this->Ln();
	$this->Write($baseHeight,"     оПНЬС ПЮГПЕЬХРЭ БМЕЯРХ ЯКЕДСЧЫХЕ ХГЛЕМЕМХЪ Б ПЮАНВХЕ СВЕАМШЕ ОКЮМШ МЮ $year/".($year+1)." СВЕАМШИ ЦНД:\n");
	$this->Ln();
	$num = 0;
		$this->Write($baseHeight,"     хГЛЕМХРЭ ДХЯЖХОКХМС(Ш):\n");
			$pg = new pgsql();
			$pg->_query("SET client_encoding TO 'WIN1251'");
			$pg->_query("SELECT * from prog, dis WHERE program_id IN (SELECT program_id FROM prog_status WHERE record_number=$record_number AND record_date='$record_date' AND deleted != 1) AND prog.discipline_id = dis.discipline_id AND parent_id != '00000000-0000-0000-0000-000000000000'");
			while ($rez=$pg->_getResult()) {
			$year=$rez['year'];
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];
			$lectures=$rez['lectures'];
			$seminars=$rez['seminars'];
			$seminarscount=$rez['seminarscount'];
			$labs=$rez['labs'];
			$labscount=$rez['labscount'];
			$individual=$rez['individual'];
			$zach=$rez['zach'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$subfaculty=$rez['subfaculty'];
			$title=str_replace("&#8470;","╧",$rez['discipline_title']);
			$id = $rez['program_id'];
			$f_id = $rez['parent_id'];
			$cmp = comparePrograms($id, $f_id);
			$first = 0;
			$chg = Array("МЮГБЮМХЕ","БХДШ СВЕАМШУ ПЮАНР","ЙНМРПНКЭМШЕ ЛЕПНОПХЪРХЪ");
			$msg = '';
			for ($i = 1; $i < 4; $i++)
			    if ($cmp[$i]=='1') {
				if (!$first) $first=1; 
				else $msg.=", ";
			    	$msg.=$chg[$i-1];
				}
			$msg.="; Б ЯБЪГХ Я (СЙЮГЮРЭ ОПХВХМС):";
				
		$this->Write($baseHeight,++$num.".\"$title\" ДКЪ ЯОЕЖХЮКЭМНЯРХ $spec ЙЮТЕДПШ $subfac, $semester ЯЕЛЕЯРП; ХГЛЕМЕМХЪ: $msg\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
		$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$num = 0;
		$this->Write($baseHeight,"     дНАЮБХРЭ ДХЯЖХОКХМС(Ш):\n");
			$pg = new pgsql();
			$pg->_query("SET client_encoding TO 'WIN1251'");
			$pg->_query("SELECT * from prog, dis WHERE program_id IN (SELECT program_id FROM prog_status WHERE record_number=$record_number AND record_date='$record_date' AND deleted!=1) AND prog.discipline_id = dis.discipline_id AND parent_id = '00000000-0000-0000-0000-000000000000'");
			while ($rez=$pg->_getResult()) {
			$year=$rez['year'];
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];
			$lectures=$rez['lectures'];
			$seminars=$rez['seminars'];
			$seminarscount=$rez['seminarscount'];
			$labs=$rez['labs'];
			$labscount=$rez['labscount'];
			$individual=$rez['individual'];
			$zach=$rez['zach'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$title=str_replace("&#8470;","╧",$rez['discipline_title']);
			$subfaculty=$rez['subfaculty'];
		$this->Write($baseHeight,++$num.". \"$title\" ДКЪ ЯОЕЖХЮКЭМНЯРХ $spec ЙЮТЕДПШ $subfac, $semester ЯЕЛЕЯРП; Б ЯБЪГХ Я (СЙЮГЮРЭ ОПХВХМС):\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
		$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$num = 0;
		$this->Write($baseHeight,"     сДЮКХРЭ ДХЯЖХОКХМС(Ш):\n");
			$pg = new pgsql();
			$pg->_query("SET client_encoding TO 'WIN1251'");
			$pg->_query("SELECT * from prog, dis WHERE program_id IN (SELECT program_id FROM prog_status WHERE record_number=$record_number AND record_date='$record_date' AND deleted = 1) AND prog.discipline_id = dis.discipline_id AND parent_id != '00000000-0000-0000-0000-000000000000'");
			while ($rez=$pg->_getResult()) {
			$year=$rez['year'];
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];
			$lectures=$rez['lectures'];
			$seminars=$rez['seminars'];
			$seminarscount=$rez['seminarscount'];
			$labs=$rez['labs'];
			$labscount=$rez['labscount'];
			$individual=$rez['individual'];
			$zach=$rez['zach'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$title=str_replace("&#8470;","╧",$rez['discipline_title']);
			$subfaculty=$rez['subfaculty'];
		$this->Write($baseHeight,++$num.". \"$title\" ДКЪ ЯОЕЖХЮКЭМНЯРХ $spec ЙЮТЕДПШ $subfac, $semester ЯЕЛЕЯРП; Б ЯБЪГХ Я (СЙЮГЮРЭ ОПХВХМС):\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
	 	$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$this->Ln();
	$this->Write($baseHeight,"     хГЛЕМЕМХЪ Б ДХЯЖХОКХМШ АСДСР БМЕЯЕМШ Б ПЮАНВХЕ ОПНЦПЮЛЛШ ДН МЮВЮКЮ СВЕАМНЦН ЯЕЛЕЯРПЮ.");
	$this->Ln();
	$this->Cell($full*$baseWidth, $baseHeight, "гЮБЕДСЧЫХИ ЙЮТЕДПНИ $subfaculty",0,0,'L');

	$pg = new pgsql();
	$pg->_query("SET client_encoding TO 'WIN1251'");
	$pg->_query("SELECT program_id as id FROM prog_status WHERE record_number=$record_number AND record_date='$record_date' AND deleted = 0");
	
	while ($rez=$pg->_getResult()) {
	    $this->AddPage();
	    PROG::PrintProg($rez["id"]);
	    }
	}
}

class PROG extends MyPDF {

	public $baseWidth = 10; 
	public $baseHeight = 5; 

	function PrintProg($id) {

	$baseWidth = $this->baseWidth;
	$baseHeight = 1.1*$this->baseHeight;
	$full = 18;

			$pg = new pgsql();
			$pg->_query("SET client_encoding TO 'WIN1251'");
			$pg->_query("SELECT * from prog WHERE program_id='$id'" );
			$rez=$pg->_getResult();
			$year=$rez['year'];
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];
			$lectures=$rez['lectures'];
			$seminars=$rez['seminars'];
			$seminarscount=$rez['seminarscount'];
			$labs=$rez['labs'];
			$labscount=$rez['labscount'];
			$individual=$rez['individual'];
			$zach=$rez['zach'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$pg->_query("SELECT * from dis WHERE discipline_id='$uuid'" );
			$rez=$pg->_getResult();
			$code=$rez['discipline_code'];
			$titleShort=str_replace("&#8470;","╧",$rez['discipline_titleshort']);
			$title=str_replace("&#8470;","╧",$rez['discipline_title']);
			$disSubfaculty=$rez['subfaculty'];
			$pg->_query("SELECT * from prog_status WHERE program_id='$id'" );
			$rez=$pg->_getResult();
			$record=$rez["record"];
			$record_number=$rez["record_number"];
			$record_date=$rez["record_date"];
/*			$pg->_query("SELECT * from memo WHERE program_id='$id'" );
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
*/			$pg->_query("SELECT * from control WHERE program_id='$id' ORDER BY week" );
			$count=0;
			while ($rez=$pg->_getResult()) {
				$control[$count]["week"] = $rez["week"];
				$control[$count]["type"] = $rez["control_type"]; 
				$control[$count]["vol"] = $rez["vol"]; 
				$count++;
			}

	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'тНПЛЮ 1',0,0,'R');
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	//бШБНДХЛ МЮХЛЕМНБЮМХЕ ЙНЛОЮМХХ 
	$this->Cell($full*$baseWidth, $baseHeight, 'тЕДЕПЮКЭМНЕ ЮЦЕМРЯРБН ОН НАПЮГНБЮМХЧ',0,0,'C');
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'цНЯСДЮПЯРБЕММНЕ НАПЮГНБЮРЕКЭМНЕ СВПЕФДЕМХЕ БШЯЬЕЦН ОПНТЕЯЯХНМЮКЭМНЦН НАПЮГНБЮМХЪ',0,0,'C');
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, '"лНЯЙНБЯЙХИ ЦНЯСДЮПЯРБЕММШИ КХМЦБХЯРХВЕЯЙХИ СМХБЕПЯХРЕР"',0,0,'C');
	$this->Ln();
	$this->Cell($full*$baseWidth, $baseHeight, '(лцрс ХЛ. м.щ. аЮСЛЮМЮ)','B',0,'C');
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell(5*$baseWidth, $baseHeight, (($record)? $record_number."/".$record_date : ""),0,0,'C');
	$this->SetXY($this->GetX()+7*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '"сРБЕПФДЮЧ"',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'оЕПБШИ ОПНПЕЙРНП -',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'ОПНПЕЙРНП ОН СВЕАМНИ ПЮАНРЕ',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'лцрс ХЛ. м.щ.аЮСЛЮМЮ',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '_________________ е.ц. чДХМ',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '"____""__________" 2007 Ц.',0,0,'C');
	$this->Ln(); 
	$this->Ln(); 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'пЮАНВЮЪ ОПНЦПЮЛЛЮ ДХЖХОКХМШ',0,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$y = $this->GetY();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',14); 
	//бШБНДХЛ МЮХЛЕМНБЮМХЕ ЙНЛОЮМХХ 
	FPDF::MultiCell(0, $baseHeight, $title,0,'C',0);
	//оЕПЕУНДХЛ БМХГ МЮ 4 ЯРПНЙХ 
//	$this->SetY($y+4*$baseHeight);
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'сВЕАМШИ ЦНД '.$year.'/'.($year+1),0,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'яЕЛЕЯРП '.$semester.' мЕДЕКЭ '.$weeks,0,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'дКЪ ЯОЕЖХЮКЭМНЯРХ '.$spec.' йЮТЕДПШ '.$subfac.' вХРЮЕР '.$disSubfaculty,0,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'бХДШ СВЕАМШУ ПЮАНР',1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'нАЭЕЛ, ВЮЯ',1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'йНКХВЕЯРБН',1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'кЕЙЖХХ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$lectures,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'',1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'яЕЛХМЮПШ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$seminars,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$seminarscount,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'кЮАНПЮРНПМШЕ ПЮАНРШ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$labs,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$labscount,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'яЮЛНЯРНЪРЕКЭМЮЪ ПЮАНРЮ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$individual,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'хРНЦН:',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$lectures+$seminars+$labs+$individual,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'',1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(14*$baseWidth, $baseHeight,'йНМРПНКЭМШЕ ЛЕПНОПХЪРХЪ',1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'дНЛЮЬМЕЕ ГЮДЮМХЕ',1,0,'L');
	$c=0; $hour=0;
	for ($i=0;$i<$count;$i++) {
		if ($control[$i]["type"] == 'дг') { $c++; $hour+=$control[$i]["vol"]; }
	} 
	$this->Cell(3*$baseWidth, $baseHeight,$hour,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$c,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'йНМРПНКЭМЮЪ ПЮАНРЮ',1,0,'L'); 
	$c=0; $hour=0;
	for ($i=0;$i<$count;$i++) {
		if ($control[$i]["type"] == 'йп') { $c++; $hour+=$control[$i]["vol"]; }
	} 
	$this->Cell(3*$baseWidth, $baseHeight,$hour,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$c,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'пСАЕФМШИ ЙНМРПНКЭ',1,0,'L'); 
	$c=0; $hour=0;
	for ($i=0;$i<$count;$i++) {
		if ($control[$i]["type"] == 'пй') { $c++; $hour+=$control[$i]["vol"]; }
	} 
	$this->Cell(3*$baseWidth, $baseHeight,$hour,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$c,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'яЮЛНЯРНЪРЕКЭМЮЪ ОПНПЮАНРЙЮ ЛЮРЕПХЮКЮ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$individual-$hour,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,''/*"$labscount"*/,1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(14*$baseWidth, $baseHeight,'йНМРПНКЭ ГМЮМХИ',1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(11*$baseWidth, $baseHeight,'гЮВЕР',1,0,'L');
	($zach=='t')? $this->SetFont('TimesNewRomanPS-BoldMT','B',12): "";
	$this->Cell(3*$baseWidth, $baseHeight,($zach=='t')?"+":"-",1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(11*$baseWidth, $baseHeight,'дХТТЕПЕМЖХПНБЮММШИ ГЮВЕР',1,0,'L'); 
	($difzach=='t')? $this->SetFont('TimesNewRomanPS-BoldMT','B',12): "";
	$this->Cell(3*$baseWidth, $baseHeight,($difzach=='t')?"+":"-",1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(11*$baseWidth, $baseHeight,'щЙГЮЛЕМ',1,0,'L'); 
	($exam=='t')? $this->SetFont('TimesNewRomanPS-BoldMT','B',12): "";
	$this->Cell(3*$baseWidth, $baseHeight,($exam=='t')?"+":"-",1,0,'C'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'цПЮТХЙ БШОНКМЕМХЪ ЙНМРПНКЭМШУ ЛЕПНОПХЪРХИ (йл)',0,0,'C');
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Ln();
	$baseWidth = 1.25*$baseHeight; 
	$this->Cell(3*$baseWidth, $baseHeight,'мЕДЕКЪ',1,0,'C');
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,$i+1,1,0,'C');
	}
	$this->Ln(); 
	$this->Cell(3*$baseWidth, $baseHeight,'оКЮМ йл',1,0,'C'); 
	$count = 0;
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,($control[$count]["week"]==($i+1))?$control[$count++]["type"]:"",1,0,'C');
	}
	$this->Ln(); 
	$count = 0;
	$this->Cell(3*$baseWidth, $baseHeight,'нАЗЕЛ',1,0,'C'); 
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,($control[$count]["week"]==($i+1))?$control[$count++]["vol"]:"",1,0,'C');
	}
	$this->Ln();
	$this->Ln();
	$this->Ln();
	$this->Cell(12*$baseWidth, $baseHeight,'дЕЙЮМ ТЮЙСКЭРЕРЮ '.substr($disSubfaculty,0,(strpos($disSubfaculty,"-"))?strpos($disSubfaculty,"-"):strlen($disSubfaculty)),0,0,'L'); 
	($subfac!=$disSubfaculty) ? $this->Cell(12*$baseWidth, $baseHeight,'яНЦКЮЯНБЮМН: ',0,0,'L') : ""; 
	$this->Ln();
	$this->Cell(12*$baseWidth, $baseHeight,'гЮБЕДСЧЫХИ ЙЮТЕДПНИ '.$disSubfaculty,0,0,'L'); 
	($subfac!=$disSubfaculty) ? $this->Cell(12*$baseWidth, $baseHeight,'дЕЙЮМ ТЮЙСКЭРЕРЮ '.substr($subfac,0,(strpos($subfac,"-"))?strpos($subfac,"-"):strlen($subfac)),0,0,'L') : ""; 
	$this->Ln();
	}
}

class OTR extends MyPDF {

	public $baseWidth = 9; 
	public $baseHeight = 9; 
	
	function Footer() {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$this->Cell($full*$baseWidth,$baseHeight,"нАНГМЮВЕМХЕ ЙНМРПНКЭМШУ ЛЕПНОПХЪРХИ (йл): дг - ДНЛЮЬМЕЕ ГЮДЮМХЕ     йп - ЙНМРПНКЭМЮЪ ПЮАНРЮ    пй - ПСАЕФМШИ ЙНМРПНКЭ    йо - ЙСПЯНБНИ ОПНЕЙР / ЙСПЯНБЮЪ ПЮАНРЮ    до - ЙБЮКХТХЙЮЖХНММЮЪ ПЮАНРЮ",0,0,'L');
	}

    function PrintTitle($year,$subfaculty,$speciality,$semester) { 
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
        //бШБНДХЛ КНЦНРХО 
        //$this->Image($image,6,6,40,20); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
//	$this->Cell($full*$baseWidth, $baseHeight, 'тНПЛЮ 2',0,0,'R');
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
//	$this->Ln(); 
	//бШБНДХЛ МЮХЛЕМНБЮМХЕ ЙНЛОЮМХХ 
	$this->Cell(20*$baseWidth,$baseHeight,'сРБЕПФДЮЧ',0,0,'L'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
	$this->Cell(20*$baseWidth,$baseHeight,'оЕПБШИ ОПНПЕЙРНП - ОПНПЕЙРНП ОН СВЕАМНИ ПЮАНРЕ',0,0,'L'); 
	//оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
	$this->Ln(); 
        //сЯРЮМЮБКХБЮЕЛ ЬПХТР ДКЪ МЮХЛЕМНБЮМХЪ ЙНЛОЮМХХ 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	//бШБНДХЛ МЮХЛЕМНБЮМХЕ ЙНЛОЮМХХ 
	$this->Cell(18*$baseWidth,$baseHeight,'пЮАНВХИ СВЕАМШИ ОКЮМ МЮ '.$year.'/'.($year+1).' СВЕАМШИ ЦНД',0,0,'C'); 
	$this->Cell(18*$baseWidth,$baseHeight,'яОЕЖХЮКЭМНЯРЭ '.$speciality,0,0,'C'); 
	$this->Cell(4*$baseWidth,$baseHeight,'йЮТЕДПЮ '.$subfaculty,0,0,'R'); 
	$this->Cell(2*$baseWidth,$baseHeight,'йСПЯ '.($semester+1)/2,0,0,'R');
        //оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
        $this->Ln(); 
        //дЕКЮЕЛ НРЯРСО НР КЕБНЦН ЙПЮЪ (ПХЯСЪ ОПНГПЮВМСЧ ЪВЕИЙС) 
//        $this->Cell(37); 
        //сЯРЮМЮБКХБЮЕЛ ЖБЕР ГЮКХБЙХ ЯКЕДСЧЫХУ ЪВЕЕЙ (R,G,B) 
//        $this->SetFillColor(209,204,244); 
        //сЯРЮМЮБКХБЮЕЛ ЬПХТР ДКЪ МЮХЛЕМНБЮМХЪ ДНЙСЛЕМРЮ 
//        $this->SetFont('Verdana','',12); 
        //бШБНДХЛ МЮХЛЕМНБЮМХЕ ДНЙСЛЕМРЮ 
//        $this->Cell(150,8,$title,0,0,'C',1); 
        //оЕПЕУНДХЛ МЮ ЯКЕДСЧЫСЧ ЯРПНЙС 
        $this->Ln(); 
        //сЯРЮМЮБКХБЮЕЛ ЬПХТР ГЮЦНКНБЙЮ РЮАКХЖШ 
	$graf = Array(10,4,2,4,4.5,4.5,4.5,4.5,4.5);
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
	$this->Cell($graf[0]*$baseWidth+5,$baseHeight,"цПСООЮ",1,0,'C'); 
	$this->Cell($graf[1]*$baseWidth,$baseHeight,"йНК. ЯРСДЕМРНБ",1,0,'C'); 
	$this->Cell($graf[2]*$baseWidth,$baseHeight,"яЕЛЕЯРП",1,0,'C'); 
	$this->Cell($graf[3]*$baseWidth,$baseHeight,"сВЕАМШУ МЕДЕКЭ",1,0,'C'); 
	$this->Cell($graf[4]*$baseWidth,$baseHeight,"рЕНПЕРХВЕЯЙХЕ ГЮМЪРХЪ",1,0,'C'); 
	$this->Cell($graf[5]*$baseWidth,$baseHeight,"гЮВЕРШ",1,0,'C'); 
	$this->Cell($graf[6]*$baseWidth,$baseHeight,"щЙГЮЛЕМШ",1,0,'C'); 
	$this->Cell($graf[7]*$baseWidth,$baseHeight,"оПЮЙРХЙЮ, ДМЕИ",1,0,'C'); 
	$this->Cell($graf[8]*$baseWidth,$baseHeight,"йЮМХЙСКШ",1,0,'C'); 
	$this->Ln();
	$head = new pgsql();
	$head->_query("SET client_encoding TO 'WIN1251'");
	$head->_query("SELECT DISTINCT prog.semester as semester, prog.weeks as weeks, theory_begin, theory_end, tests_begin, 
						tests_end, exams_begin, exams_end, holidays_begin, holidays_end 
						FROM year, year_organize, prog
						WHERE year.year='$year' 
						AND year_organize.semester='".(!fmod($semester,2)?"2":"1")."' 
						AND year.id = year_organize.f_id
						AND subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='$semester'
						AND practice=0
						AND prog.weeks=year_organize.weeks
						AND year.year=prog.year");
	$rez = $head->_getResult();
	$head->_query("SELECT DISTINCT practice FROM prog
						WHERE subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='$semester'
						AND year='$year'
						AND practice > 0");
	$pr = $head->_getResult();
	if ($group_1 = getGroup($subfaculty, $rez["semester"], $speciality))
    	    $count = ListByGroup($group_1);
	if ($group_2 = getGroup($subfaculty, $rez["semester"]+1, $speciality))
    	    if (!$count) $count = ListByGroup($group_2);
//	print_r($group_1);
	$val = Array($group_1, $count, $rez["semester"],$rez["weeks"],dateto($rez["theory_begin"])." - ".dateto($rez["theory_end"]),dateto($rez["tests_begin"])." - ".dateto($rez["tests_end"]),dateto($rez["exams_begin"])." - ".dateto($rez["exams_end"]), ($pr["practice"]>0) ? ($pr["practice"]/9) : " - " ,dateto($rez["holidays_begin"])." - ".dateto($rez["holidays_end"]));
	
	for($i=0;$i<9;$i++) {
		$this->Cell((($i)?$graf[$i]*$baseWidth:($graf[$i]*$baseWidth+5)),$baseHeight,$val[$i],1,0,'C'); 
	}
	$this->Ln();
	$head->_query("SELECT DISTINCT prog.semester as semester, prog.weeks as weeks, theory_begin, theory_end, tests_begin, 
						tests_end, exams_begin, exams_end, holidays_begin, holidays_end 
						FROM year, year_organize, prog
						WHERE year.year='$year' 
						AND year_organize.semester='".(!fmod(($semester+1),2)?"2":"1")."' 
						AND year.id = year_organize.f_id
						AND subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='".($semester+1)."'
						AND year.year=prog.year");
	$rez = $head->_getResult();
	$val = Array($group_2, $count, $rez["semester"],$rez["weeks"],dateto($rez["theory_begin"])." - ".dateto($rez["theory_end"]),dateto($rez["tests_begin"])." - ".dateto($rez["tests_end"]),dateto($rez["exams_begin"])." - ".dateto($rez["exams_end"]),'',dateto($rez["holidays_begin"])." - ".dateto($rez["holidays_end"]));
	for($i=0;$i<9;$i++) {
		$this->Cell((($i)?$graf[$i]*$baseWidth:($graf[$i]*$baseWidth+5)),$baseHeight,$val[$i],1,0,'C'); 
	}
	$this->Ln();
	$this->Ln();
    }

    function OtrHead($semester,$year) {
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
        //бШБНДХЛ ГЮЦНКНБНЙ 
        $this->Cell($baseWidth,3*$baseHeight,"О",1,0,'C'); 
        $this->MultiCell(14*$baseWidth,3*$baseHeight,"$semester ЯЕЛЕЯРП\nдХЯЖХОКХМШ",1,3,'C'); 
        $this->Cell(1.5*$baseWidth,3*$baseHeight,"йют",1,0,'C'); 
        $this->Cell($baseWidth,3*$baseHeight,"гюв",1,0,'C'); 
        $this->MultiCell($baseWidth,3*$baseHeight,"дхт\nгюв",3,$baseHeight,'C'); 
        $this->Cell($baseWidth,3*$baseHeight,"щйг",1,0,'C'); 
//        $this->Cell(6*$baseWidth+1.2*$baseWidth,$baseHeight,"рПСДНЕЛЙНЯРЭ, ВЮЯ",1,2,'C'); 
        $this->Cell(6*$baseWidth+1.2*$baseWidth,$baseHeight,"бЯЕЦН ВЮЯНБ",1,2,'C'); 
        $this->Cell(1.2*$baseWidth,2*$baseHeight,"бЯЕЦН",1,0,'C'); 
        $this->Cell($baseWidth,2*$baseHeight,"кей",1,0,'C'); 
        $this->Cell($baseWidth,2*$baseHeight,"соп",1,0,'C'); 
        $this->Cell($baseWidth,2*$baseHeight,"кюа",1,0,'C'); 
        $this->Cell($baseWidth,2*$baseHeight,"яюл",1,0,'C'); 
        $this->Cell(2*$baseWidth,$baseHeight,"Б МЕДЕКЧ",1,2,'C'); 
        $this->Cell($baseWidth,$baseHeight,"юсд",1,0,'C'); 
	$this->Cell($baseWidth,$baseHeight,"яюл",1,0,'C');
	$this->SetXY($this->GetX(),$this->GetY()-2*$baseHeight); 
	$this->MultiCell(4*($baseWidth-3),3*$baseHeight,"нАЗЕЛ йл,\nВЮЯ",1,7,'C');
        $this->Cell(21*($baseWidth-3),$baseHeight,"цПЮТХЙ БШОНКМЕМХЪ ЙНМРПНКЭМШУ ЛЕПНОПХЪРХИ",1,2,'C'); 
	$this->SetFont('TimesNewRomanPSMT','',10); 
	$date = Array();
	$j=0;
	$count=0;
	if (fmod($semester,2)) {
		$month = Array(Array("яЕМРЪАПЭ","нЙРЪАПЭ","мНЪАПЭ","дЕЙЮАПЭ","ъМБЮПЭ"),Array(0,0,0,0,0));
		for ($i=0;$i<5;$i++) {
			for ($j=1;$j<32;$j++) {
				if ($day = mktime(0,0,0,($i!=4)? 9+$i : $i-3 ,$j,($i!=4)?$year:($year+1))) 
					if (date('D',$day)=='Sat') {
						$date[$count++] = $j;
						$month[1][$i]++;
					}
			if ($count == 21) break;
			}
		if ($count == 21) break;
		}
	}
	else {
		$month = Array(Array("тЕБПЮКЭ","лЮПР","юОПЕКЭ","лЮИ","хЧМЭ"),Array(0,0,0,0,0));
		for ($i=0;$i<5;$i++) {
			for ($j=1;$j<32;$j++) {
				if ($day = mktime(0,0,0,2+$i,$j,$year+1)) 
					if (date('D',$day)=='Sat') {
						$date[$count++] = $j;
						$month[1][$i]++;
					}
			if ($count == 21) break;
			}
		if ($count == 21) break;
		}
	}
	$x=$this->GetX();
	$y=$this->GetY();
        for ($i=0;$i<5;$i++) $this->Cell($month[1][$i]*($baseWidth-3),$baseHeight,$month[0][$i],1,0,'C');
	$this->SetXY($x,$y+$baseHeight);
	for ($i=1;$i<22;$i++) {
		$this->Cell($baseWidth-3,$baseHeight,$date[$i-1],1,0,'C');
	}
	$this->Ln();
	}
	
	function PrintOtr($subfaculty,$speciality,$semester,$year) {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$X = $this->GetX();
	$Y = $this->GetY();
	$X_max = 45*$baseWidth + 5.4;
	$width = Array (14,0,1.5,1,1,1,1.2,1,1,1,1,1,1);
	$sum = Array(0,0,0,0,0,0,0,0,0,0,0,0,0);
		$count=0;
		$this->OtrHead($semester,$year);
		$pg = new pgsql();
		$pg->_query("SET client_encoding TO 'WIN1251'");
		$control = new pgsql();
		$control->_query("SET client_encoding TO 'WIN1251'");
		$pg->_query("SELECT prog.program_id as id, weeks,
						 ltrim(rtrim(discipline_title)), 
						 dis.subfaculty, 
						 CASE WHEN zach = true THEN 'ГЮВ' ELSE '-' END as zach,
						 CASE WHEN difzach = true THEN 'ГЮВ' ELSE '-' END as difzach,
						 CASE WHEN exam = true THEN 'ЩЙГ' ELSE '-' END as exam,
						 lectures + seminars + labs + individual as total,
						 lectures,
						 seminars,
						 labs,
						 individual,
						 round(cast(lectures + seminars + labs AS numeric) / weeks,1) as aud,
						 round(cast(individual AS numeric)/ weeks,1) as indiv
						 from prog
						 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
						 INNER JOIN prog_status ON (prog.program_id = prog_status.program_id)
						 WHERE subfaculty_for='$subfaculty' 
						 AND speciality_for='$speciality'
						 AND semester='$semester'
						 AND year='$year'
						 AND admin='1'
						 ORDER BY case 
						 					when dis.subfaculty~'бо' then 24 
						 					when dis.subfaculty~'тб' then 25
											when practice > 0 then 26 
						 					when discipline_code~'цящ' then 1 
						 					when discipline_code~'ем' then 2 
						 					when discipline_code~'нод' then 3 
					 						when discipline_code~'яо' then 4 
					 						when discipline_code~'дя' then 5 
					 						when discipline_code~'трд' then 6
					 						else 10 end ,
					 						discipline_title"
					  	);
	$this->SetFont('TimesNewRomanPSMT','',10);
	$this->SetFillColor(192,192,192); 
		while ($rez=$pg->_getResultArray(true,PGSQL_NUM)) {
			switch ($rez[1]) { // яЕЛЕЯРП
			case 13: $controlMask = Array (1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1); break;
			case 17: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1); break;
			case 20: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1); break;
			default: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); break;
			}
			$aud_week+=$rez[12];
			$indiv_week+=$rez[13];
			for($i=12;$i<14;$i++)
			    if (!fmod($rez[$i],1)) 
				$rez[$i]=intval($rez[$i]);
			for ($i=0;$i<count($rez)-1;$i++) {
			if ($i==0) { // i == 0 - Лчцачлуе дуъфунйуль
				$title = explode(" ",rtrim(ltrim(str_replace("&#8470;","╧",$rez[$i+2]))));
				$num = count($title);
				$j = 0;
				$multi=0;
				$str = '';
				$length=0;
				while (++$j <= $num) {
					$str.=(($j==1)?"":" ").$title[$j-1];
					if ((strlen($str)+strlen($title[$j]))>(($multi+1)*65)) {
						// echo "ln - ".strlen($str)." - ".$length;
						$str.="\n";
						$multi++;
						$length+=strlen($str)-1;
					}
				}
				if ($multi) {
					$baseHeight = 0.9*($multi+1)*$this->baseHeight;
					$this->Cell($baseWidth,$baseHeight/2,++$count,1,0,'C');
					$this->MultiCell($width[$i]*$baseWidth,$baseHeight/2,$str,1,3,'L');
				}
				else {
					$baseHeight = $this->baseHeight;
					$this->Cell($baseWidth,$baseHeight/2,++$count,1,0,'C');
					$this->Cell($width[$i]*$baseWidth,$baseHeight/2,$str,1,0,'L');
				}
			
			$i++;
			} else {
				if ($i>2) {
					if ($i<6) {
						if ($rez[$i+1] != "-") {
						$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
						$sum[$i+1]++;
					//	echo $rez[$i]." - ".$i; 
						}
					}
					else {
						$sum[$i+1]+=$rez[$i+1];
					//	echo $rez[$i]." - ".$i; 
						$this->SetFont('TimesNewRomanPSMT','',10);
					} 
				}
				$this->Cell($width[$i]*$baseWidth,$baseHeight/2,rtrim(ltrim($rez[$i+1])).(($i>5 && $i<13)?" ":""),1,0,($i>5 && $i<13)?'R':'C');
			}
			}
//			print_r($rez);
//			print_r($sum);
//			print("<br>");
			$control->_query("SELECT * FROM control WHERE program_id = '".$rez[0]."' ORDER BY week");
			$week = 0;
			$vol='';
			while ($control_rez=$control->_getResultArray()) {
				while ($control_rez["week"] != $week++) {
				}
			$vol.=$control_rez["vol"].'  ';
			}
			$this->Cell(4*($baseWidth-3),$baseHeight/2,$vol,1,0,'R');
			$control->_query("SELECT * FROM control WHERE program_id = '$rez[0]' ORDER BY week");
			$week = 0;
			while ($control_rez=$control->_getResultArray()) {
//			if ()
				while (($control_rez["week"]-1) != $week++) {
					$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$week-1]);
				}
				$this->Cell($baseWidth-3,$baseHeight/2,$control_rez["control_type"],1,0,'C',$controlMask[$week-1]);
				if ($control_rez["control_type"]=='йо') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // йСПЯНБНИ ОПНЕЙР
                                        ($week == 15) ? $arr = array("","","","","","","","йо","","","йо","","","йо","","йо","","") : "";
                                        ($week == 14) ? $arr = array("","","","","йо","","","йо","","","йо","","","","йо","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
				if ($control_rez["control_type"]=='до') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // ЙБЮКХТХЙЮЖХНММЮЪ ПЮАНРЮ
                                        ($week == 17) ? $arr = array("","","","","","до","","","","до","","","","до","","","","до","","","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
/*				if ($control_rez["control_type"]=='дг') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // йСПЯНБНИ ОПНЕЙР
                                        ($week == 15) ? $arr = array("","","","","","","","йо","","","йо","","","йо","","йо","","") : "";
                                        ($week == 14) ? $arr = array("","","","","йо","","","йо","","","йо","","","","йо","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
*/			}
			while ($week++ < 21) 
					$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$week-1]);
			$this->Ln();
		}
		while ($count<15) {
			++$count;
			$this->Cell($baseWidth,$baseHeight/2,"",1,0,'C');
			for ($i=0;$i<13;$i++)
				if($i!=1) $this->Cell($width[$i]*$baseWidth,$baseHeight/2,"",1,0,'L');
			$this->Cell(4*($baseWidth-3),$baseHeight/2,"",1,0,'C');
			for ($i=0;$i<21;$i++)
				$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$i]);
			$this->Ln();
		}
		$b_Y = $this->GetY();			
		$this->Cell(($width[0]+$width[2]+1)*$baseWidth,$baseHeight,"хРНЦН: ",1,0,'R');
		for($i=3;$i<13;$i++)
			$this->Cell($width[$i]*$baseWidth,$baseHeight,$sum[$i+1],1,0,'C');
		$this->MultiCell(4*($baseWidth-3),$baseHeight,"мЕДЕКХ  -ВХЯК\n               -ГМЮЛ",1,4,'R');
		for ($i=1;$i<22;$i++)
			$this->MultiCell($baseWidth-3,$baseHeight,(!fmod($i,2))?"\n$i":"$i\n",1,4,'C');
		$this->Ln();
		$Y_max = $this->GetY();			
//	print_r($sum);
	$this->Cell(26*$baseWidth,$baseHeight,'б МЕДЕКЧ - '.($sum[12]+$sum[13]).'   ',0,0,'R');
	$this->Ln();
	$this->SetLineWidth(0.5);
	$baseHeight = 5;
	$dx = 0;
//	$Y_max = 18*$baseHeight+$Y+1.4;
	$this->Line($X,$Y,$X_max,$Y);
	$this->Line($X,3*$baseHeight+$Y,$X_max,3*$baseHeight+$Y);
	$this->Line($X,$Y_max-2*$baseHeight+1,$X_max,$Y_max-2*$baseHeight+1);
	$this->Line($X,$Y_max,$X_max,$Y_max);
	$this->Line($X,$Y,$X,$Y_max);
	$dx = 16*$baseWidth+4.6;
	$this->Line($X + $dx,$Y,$X + $dx,$Y_max);
	$dx += 3*$baseWidth;
	$this->Line($X + $dx,$Y,$X + $dx,$Y_max);
	$dy = $baseHeight;
	$this->Line($X + $dx,$Y + $dy,$X + $dx + 7*$baseWidth + 1.4, $Y + $dy);
	$dx += 1.2*$baseWidth;
	$this->Line($X + $dx,$Y+$dy,$X + $dx, $Y_max);
	$dx += 3*$baseWidth;
	$this->Line($X + $dx,$Y+$dy,$X + $dx, $Y_max);
	$dx += $baseWidth;
	$this->Line($X + $dx,$Y+$dy,$X + $dx, $Y_max);
	$dx += 2*$baseWidth;
	$this->Line($X + $dx,$Y,$X + $dx,$Y_max);
	$this->Line($X + $dx,$Y,$X + $dx,$Y_max);
	$this->Line($X,$Y,$X,$Y_max);
	$this->Line($X,$Y,$X,$Y_max);
	$this->Line($X,$Y,$X,$Y_max);
	$this->Line($X_max,$Y,$X_max,$Y_max);
	$this->SetLineWidth(0.2);
	}

	function PrintOtrF($subfaculty) {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
	$this->Cell(11*$baseWidth,$baseHeight,"гЮБЕДСЧЫХИ ЙЮТЕДПНИ ".$subfaculty,0,0,'L');
	$this->Cell(11*$baseWidth,$baseHeight,"дЕЙЮМ ТЮЙСКЭРЕРЮ ".substr($subfaculty,0,strpos($subfaculty,"-")),0,0,'L');
	$this->Cell(11*$baseWidth,$baseHeight,"сВЕАМНЕ СОПЮБКЕМХЕ",0,0,'L');
	$this->Cell(11*$baseWidth,$baseHeight,"лЕРНДХВЕЯЙХИ НРДЕК",0,0,'L');
	$this->SetFont('TimesNewRomanPSMT','',10);
	$this->Ln();
	}
}
?>
