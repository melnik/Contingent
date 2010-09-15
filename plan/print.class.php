<?php
ini_set('max_execution_time', '120');
require_once('pgsql.class.php');
require_once('html.class.php');

define(SESSIONID,4);
ini_set("soap.wsdl_cache_enabled", "0");

//$client = new SoapClient( "http://contingent.bmstu.ru:82/contingent.wsdl", array("trace" => 1) );
//$client = new SoapClient( "http://work.e-u.bmstu.ru/contingent/contingent.wsdl", array("trace" => 0) );//ЯЕПБХЯ ЯРСДЕМРНБ
function toCP($str='') {
	return iconv("UTF-8", "CP1251", $str);
}
function toUTF($str='') {
	return iconv("CP1251", "UTF-8", $str);
}

class stud
        {
        }

class listStudentsRequest {
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

function ListByGroup( $client, $group, $_lastname=NULL, $_firstname=NULL, $_middlename=NULL, $_pcn=NULL )
        {
        return 10;
	$count = 0;
 //       $client = new SoapClient( "http://work.e-u.bmstu.ru/contingent/contingent.wsdl", array('trace'=>1) );
        try
                {
                        $gr = explode(" ",toUTF($group));
			for ($i=0;$i<count($gr);$i++) {
			    //echo $gr[$i];
    			    $student = $client->listStudents(new listStudentsRequest( NULL, NULL, NULL, $gr[$i], NULL ))->student;
			    //var_dump($student);
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
        $pg_cmp->_query("SELECT DISTINCT semester, weeks, lectures, seminars, labs, labscount, individual, zach, difzach, exam, subfaculty_for, speciality_for, seminarscount, zach_count FROM prog WHERE program_id = '$id' OR  program_id = '$pid'");
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
            $ret[0] = '';
            $ret[1] = '';
                $parsed = simplexml_load_file('struct.xml');
                while(($current_faculty = $parsed->faculty[++$i])) {
                    $j=-1;
//                  echo $this->toKOI($current_faculty['abbr'])."<br>";
                        while($current_subfaculty = $current_faculty->subfaculty[++$j]) {
                                $k=-1;
//                              echo "---".$this->toKOI($current_subfaculty['abbr'])."<br>";
                                if ($subfaculty == toCP($current_subfaculty['abbr']))
                                        while ($current_group = $current_subfaculty->group[++$k]) {
                                            if ($current_group['speciality_code'] == $speciality && $current_group['semester'] == $semester) {
                                                $ret[0] .= $current_subfaculty->group[$k]['id']." ";
						$ret[1] .= toCP($current_subfaculty->group[$k]['abbr'])." ";
					    }
                                        }
                        }
        }
	$ret[0] = rtrim($ret[0]);
	$ret[1] = rtrim($ret[1]);
	return $ret;
}

class MyPDF extends FPDF {

	public $xml;
	public $xpath;
		
		function __construct($orientation='P',$unit='mm',$format='A4') {
			// Загружаем справочники
			$this->xml = new DOMDocument('1.0', 'UTF-8');
			$this->xml->appendChild($this->xml->createElement('content'));
			
			//Структура
			$structure = new DOMDocument('1.0', 'UTF-8');
			$file = "xml/structure".$_GET["year"].".xml";
				$rez = $structure->load($file);
			if (!$rez)
				$rez = $structure->load('xml/structute.xml');
			if (!$rez) echo "Не возможно подключить справочник \"Структура университета\"";
			$node=$this->xml->importNode($structure->getElementsByTagName("structure")->item(0), true);
			$this->xml->documentElement->appendChild($node);
			
			//Даты
			$structure = new DOMDocument('1.0', 'UTF-8');
			$file = "dates/dates".$_GET["year"].".xml";
				$rez = $structure->load($file);
			if (!$rez)
				$rez = $structure->load('struct.xml');
			if (!$rez) echo "Не возможно подключить справочник \"Организация учебного процесса\"";
			$node=$this->xml->importNode($structure->getElementsByTagName("year_organize")->item(0), true);
			$this->xml->documentElement->appendChild($node);
			
			//Специальности
			$structure = new DOMDocument('1.0', 'UTF-8');
			$rez = $structure->load('speciality.xml');
			if (!$rez) echo "Не возможно подключить справочник специальностей";
			
			$node=$this->xml->importNode($structure->getElementsByTagName("specialities")->item(0), true);
			$this->xml->documentElement->appendChild($node);
			
			//Языки
			$structure = new DOMDocument('1.0', 'UTF-8');
			$rez = $structure->load('lang.xml');
			if (!$rez) echo "Не возможно подключить справочник языков";
			
			$node=$this->xml->importNode($structure->getElementsByTagName("languages")->item(0), true);
			$this->xml->documentElement->appendChild($node);
			
			$this->xpath = new DOMXpath($this->xml);
			
// 			echo $this->xml->saveXML();
		FPDF::__construct($orientation,$unit,$format);
		} 

		function getDate($week, $semester, $year) {
			$semester = (fmod($semester,2)==0)?2:1;
			$exp="//year[@semester='$semester']";
//	echo $exp;
			$org = '';
			$elements=$this->xpath->query($exp);
			foreach ($elements as $element) {
				$org[0]=toCP($element->getAttribute('begin'));
				$org[1]=toCP($element->getAttribute('end'));
   		}
   		print_r($org);
	
		} 
        function writeRotie($x,$y,$txt,$text_angle,$font_angle = 0)
                {
                if ($x < 0) {
                $x += $this->w;
                }
                if ($y < 0) {
                $y += $this->h;
                }
                
                /* Escape text. */
                $text = $this->_escape($txt);
                
                $font_angle += 90 + $text_angle;
                $text_angle *= M_PI / 180;
                $font_angle *= M_PI / 180;
                
                $text_dx = cos($text_angle);
                $text_dy = sin($text_angle);
                $font_dx = cos($font_angle);
                $font_dy = sin($font_angle);
                
                $s= sprintf('BT %.2f %.2f %.2f %.2f %.2f %.2f Tm (%s) Tj ET', $text_dx, $text_dy, $font_dx, $font_dy,$x * $this->k, ($this->h-$y) * $this->k, $text);
                if($this->underline && $txt!='')
                $s.=' '.$this->_dounderline($x,$y,$txt);
                if($this->ColorFlag)
                $s='q '.$this->TextColor.' '.$s.' Q';
                $this->_out($s);
                }               

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
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Cell(12*$baseWidth, $baseHeight, $record_number."/".$record_date,0,0,'L');
//	$this->SetXY($this->GetX()+12*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'Проректору по учебной работе',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '',0,0,'C');
	$this->Ln();
	$this->SetY($this->GetY()+14*$baseHeight);
	$this->Cell($full*$baseWidth, $baseHeight, 'Служебная записка',0,0,'C');
	$this->Ln();
	$this->Ln();
	$this->Write($baseHeight,"     Прошу разрешить внести следующие изменения в рабочие учебные планы на $year/".($year+1)." учебный год:\n");
	$this->Ln();
	$num = 0;
		$this->Write($baseHeight,"     Изменить дисциплину(ы):\n");
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
			$zach_count=$rez['zach_count'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$subfaculty=$rez['subfaculty'];
			$title=str_replace("&#8470;","№",$rez['discipline_title']);
			$id = $rez['program_id'];
			$f_id = $rez['parent_id'];
			$cmp = comparePrograms($id, $f_id);
			$first = 0;
			$chg = Array("название","виды учебных работ","контрольные мероприятия");
			$msg = '';
			for ($i = 1; $i < 4; $i++)
			    if ($cmp[$i]=='1') {
				if (!$first) $first=1; 
				else $msg.=", ";
			    	$msg.=$chg[$i-1];
				}
			$msg.="; в связи с (указать причину):";
				
		$this->Write($baseHeight,++$num.".\"$title\" для специальности $spec кафедры $subfac, $semester семестр; изменения: $msg\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
		$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$num = 0;
		$this->Write($baseHeight,"     Добавить дисциплину(ы):\n");
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
			$zach_count=$rez['zach_count'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$title=str_replace("&#8470;","№",$rez['discipline_title']);
			$subfaculty=$rez['subfaculty'];
		$this->Write($baseHeight,++$num.". \"$title\" для специальности $spec кафедры $subfac, $semester семестр; в связи с (указать причину):\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
		$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$num = 0;
		$this->Write($baseHeight,"     Удалить дисциплину(ы):\n");
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
			$zach_count=$rez['zach_count'];
			$difzach=$rez['difzach'];
			$exam=$rez['exam'];
			$uuid=$rez['discipline_id'];
			$subfac=$rez['subfaculty_for'];
			$spec=$rez['speciality_for'];
			$title=str_replace("&#8470;","№",$rez['discipline_title']);
			$subfaculty=$rez['subfaculty'];
		$this->Write($baseHeight,++$num.". \"$title\" для специальности $spec кафедры $subfac, $semester семестр; в связи с (указать причину):\n");
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
		$this->Ln();
		$this->Cell($full*$baseWidth, $baseHeight, '','B',0,'C');
	 	$this->Ln();
	 	$this->Ln();
		}
	(!$num) ? $this->Write($baseHeight," - \n") : "";
	$this->Ln();
	$this->Write($baseHeight,"     Изменения в дисциплины будут внесены в рабочие программы до начала учебного семестра.");
	$this->Ln();
	$this->Cell($full*$baseWidth, $baseHeight, "Заведующий кафедрой $subfaculty",0,0,'L');

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

	$a=$kr=$krcount=$kz=$kzcount=$r=$rcount=$ku=$kucount=$dz=$dzcount=$sr=0;
	$baseWidth = $this->baseWidth;
	$baseHeight = 1.1*$this->baseHeight;
	$tbl = array(12,3,3);
	$full = 0;
	for ($i=0;$i<3;$i++)
	$full += $tbl[$i];

 			$pg = new pgsql();
			$pg->_query("SET client_encoding TO 'WIN1251'");
			$pg->_query("SELECT * from prog WHERE program_id='$id'" );
			$rez=$pg->_getResult();
			$year=$rez['year'];			
			$semester=$rez['semester'];
			$weeks=$rez['weeks'];			
			$a+=$lectures=$rez['lectures'];
			$lecturescount=$rez['lecturescount'];
			$a+=$seminars=$rez['seminars'];			
			$seminarscount=$rez['seminarscount'];			
			$a+=$labs=$rez['labs'];			
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
// 			$lang_first=$rez['lang_first'];
// 			$lang_second=$rez['lang_second'];
			$pg->_query("SELECT * from lang WHERE f_id='$id'" );
			$langs=$pg->_getResultAll();
			$pg->_query("SELECT * from dis WHERE discipline_id='$uuid'" );
			$rez=$pg->_getResult();
			$code=$rez['discipline_code'];
			$titleShort=str_replace("&#8470;","№",$rez['discipline_titleshort']);
			$title=str_replace("&#8470;","№",$rez['discipline_title']);
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
				switch ($rez["control_type"]) {
				case "КР": $kr+=$rez["vol"]; $krcount++; break;
				case "КЗ": $kz+=$rez["vol"]; $kzcount++; break;
				case "Р": $ind+=$r+=$rez["vol"];$rcount++;break;
				case "КУ": $ind+=$ku+=$rez["vol"];$kucount++;break;
				case "ДЗ": $ind+=$dz+=$rez["vol"];$dzcount++;break;
				}
			}
			$a+=$kz+$kr;

/*	$exp="//lang[@index='$lang_first' or @index='$lang_second']";
//	echo $exp;
	$lang = '';
	$elements=$this->xpath->query($exp);
	foreach ($elements as $element) {
		
   	$lang[]=toCP($element->getAttribute('titleshort'));
   }
	
*/
	$l = '';
  	$groups="";
	foreach ($langs as $lang) {
	
	$exists=0;

	$exp="//group[@speciality_code = '$spec' and @semester = '$semester' and @lang_first='".$lang["lang_first"]."' and @lang_second='".$lang["lang_second"]."' and @active='true']";
//	echo $exp;
	$elements=$this->xpath->query($exp);
//	print_r($elements->saveXML());
	foreach ($elements as $element) {
	$exists++;
   	$groups.=toCP($element->getAttribute('abbr'));
   	$groups.=" ";
	$study_form = toCP($element->getAttribute('study_form'));
	}

	
	  if ($exists) {
	    $exp_f="//lang[@index='".$lang["lang_first"]."']";
	    $exp_s="//lang[@index='".$lang["lang_second"]."']";
	    $elements=$this->xpath->query($exp_f);
	    foreach ($elements as $element) {
	      $l.=toCP($element->getAttribute('titleshort'));
	    }
	    $l.="/";
	    $elements=$this->xpath->query($exp_s);
	    foreach ($elements as $element) {
	      $l.=toCP($element->getAttribute('titleshort'));
	    }
	    $l.=" ";
	  }
// 	$langs = $lang[0]."/".$lang[1];
	$langs = $l;
	}
	
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Форма 1',0,0,'R');
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	//Выводим наименование компании 
	$this->Cell($full*$baseWidth, $baseHeight, 'Министерство образования и науки Российской Федерации',0,0,'C');
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Государственное образовательное учреждение высшего профессионального образования',0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('name')),0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, '('.toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('abbr')).')','B',3,'C');
	$this->SetFont('TimesNewRomanPSMT','',12); 
	//Переходим на следующую строку 
	$this->Cell(5*$baseWidth, $baseHeight, (($record)? $record_number."/".$record_date : ""),0,0,'C');
	$this->SetXY($this->GetX()+7*$baseWidth,$this->GetY());
	$this->Cell(5*$baseWidth, $baseHeight, '"Утверждаю"',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, 'Проректор по учебной работе',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('abbr')),0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '_________________',0,0,'C');
	$this->SetXY($this->GetX()-5*$baseWidth,$this->GetY()+$baseHeight);
	$this->Cell(5*$baseWidth, $baseHeight, '"____""__________" '.date('Y').' г.',0,0,'C');
	$this->Ln(); 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Выписка из рабочей программы учебной дициплины',0,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$y = $this->GetY();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',14); 
	//Выводим наименование компании 
	FPDF::MultiCell(0, $baseHeight, $title,0,'C',0);
	//Переходим вниз на 4 строки 
//	$this->SetY($y+4*$baseHeight);
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Учебный год '.$year.'/'.($year+1).' Семестр '.$semester.' Недель '.$weeks,0,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Для специальности '.$spec.' Кафедры '.$subfac.' Читает '.$disSubfaculty,0,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Cell($full*$baseWidth, $baseHeight, ' Группа(ы) '.$groups,0,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln(); 
	//Переходим на следующую строку 
 	$this->Cell($full*$baseWidth, $baseHeight, ' Языки '.$langs,0,0,'C');
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'Виды учебных работ',1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'Обьем, час',1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'Количество',1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Аудиторный занятия (А), в т.ч.:',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$a,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'',1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'Лекции (Л)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$lectures,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$lecturescount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Семинары (С)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$seminars,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$seminarscount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Практическое занятие (ПЗ)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$labs,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$labscount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Контрольная работа (КР)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$kr,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$krcount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Контрольное занятие (КЗ)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$kz,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$kzcount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Самостоятельная работа (СР), в т.ч.:',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$individual,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Реферат (Р)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$r,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$rcount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Курсовая работа (КУ)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$ku,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$kucount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Домашнее задание (ДЗ)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$dz,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$dzcount,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Другие виды работ',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$individual-$ind,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,'',1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Учебная работа (УР = А + СР) студента',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$ur=$a+$individual,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Практика (Недели)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$practice*54,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,$practice,1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(14*$baseWidth, $baseHeight,'Объем работы студента в период экзаменационной сессии (Э)',1,0,'L'); 
//	$this->Cell(14*$baseWidth, $baseHeight,'Объем работы студента в период экзаменационной сессии, по резултатам практики и за курсовую работу (Э)',1,0,'L'); 
/*	//Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(14*$baseWidth, $baseHeight,'Контроль знаний',1,0,'C'); 
	*///Переходим на следующую строку 
	$this->Ln();
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(8*$baseWidth, $baseHeight,'Зачет',1,0,'L');
	if ($zach=='t') {
		$this->SetFont('TimesNewRomanPS-BoldMT','B',12) ;
		$this->Cell(3*$baseWidth, $baseHeight,$zachvol=($zach_count=='t')?18:0,1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"+",1,0,'C');
		$e+=$zachvol;
	}
	else {
		$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"-",1,0,'C');
	}
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Дифференцированный зачет',1,0,'L'); 
	if ($difzach=='t') {
		$this->SetFont('TimesNewRomanPS-BoldMT','B',12);
		$this->Cell(3*$baseWidth, $baseHeight,$zachvol=18,1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"+",1,0,'C');
		$e+=$zachvol;
	}
	else {
		$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"-",1,0,'C');
	}
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Экзамен (защита ВКР)',1,0,'L'); 
	if ($exam=='t') {
		$this->SetFont('TimesNewRomanPS-BoldMT','B',12);
		$this->Cell(3*$baseWidth, $baseHeight,$exam=36,1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"+",1,0,'C');
		$e+=$exam;
	}
	else {
		$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"-",1,0,'C');
	}
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Оценка за курсовую работу',1,0,'L'); 
	if ($ku) {
		$this->SetFont('TimesNewRomanPS-BoldMT','B',12);
		$this->Cell(3*$baseWidth, $baseHeight,$zachvol=18,1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"+",1,0,'C');
		$e+=$zachvol;
	}
	else {
		$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C');
		$this->Cell(3*$baseWidth, $baseHeight,"-",1,0,'C');
	}
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'Теоретическое обучение (ТО = УР + Э)',1,0,'L'); 
	$this->Cell(3*$baseWidth, $baseHeight,$to=$ur+$e,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->SetX($this->GetX()+2*$baseWidth); 
	$this->Cell(8*$baseWidth, $baseHeight,'В кредитах (ТО/36)',1,0,'L'); 
	$kred=round($to/36,1); 
	$kred=explode('.',$kred);
//	print_r($kred);
	if ($kred[1] > 0 && $kred[1] <= 5) $mod=0.5;
	elseif ($kred[1] > 5 && $kred[1] < 10) $mod=1;
	else $mod=0;
	$this->Cell(3*$baseWidth, $baseHeight,$kred[0]+$mod,1,0,'C'); 
	$this->Cell(3*$baseWidth, $baseHeight,"",1,0,'C'); 
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Ln();
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'График выполнения контрольных мероприятий (КМ)',0,0,'C');
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Ln();
	$baseWidth = 1.25*$baseHeight; 
	$this->Cell(3*$baseWidth, $baseHeight,'Неделя',1,0,'C');
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,$i+1,1,0,'C');
	}
	$this->Ln(); 
	$this->Cell(3*$baseWidth, $baseHeight,'План КМ',1,0,'C'); 
	$count = 0;
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,($control[$count]["week"]==($i+1))?$control[$count++]["type"]:"",1,0,'C');
	}
	$this->Ln(); 
	$count = 0;
	$this->Cell(3*$baseWidth, $baseHeight,'Объем',1,0,'C'); 
	for ($i = 0; $i<21; $i++) {
		$this->Cell($baseWidth, $baseHeight,($control[$count]["week"]==($i+1))?$control[$count++]["vol"]:"",1,0,'C');
	}
	$this->Ln();
	$this->Ln();
	if ($subfac!=$disSubfaculty)
		$this->Cell(12*$baseWidth, $baseHeight,'Заведующий кафедрой '.$disSubfaculty,0,3,'L'); 
	$this->Cell(12*$baseWidth, $baseHeight,"Заведующий выпускающей кафедрой",0,3,'L'); 
 	$this->Cell(12*$baseWidth, $baseHeight,"(руководитель выпускающего межкафедрального объединения)",0,3,'L'); 
	$this->Cell(12*$baseWidth, $baseHeight,'Начальник учебного отдела ',0,3,'L'); 
	}
}

class PLAN extends MyPDF {

	public $baseWidth = 9; 
	public $baseHeight = 9; 
	public $total = array();
	public $br=0;

	function PrintPlan($subfaculty,$year) {
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
//	$width = Array (1,14,1.5,1,1,1,6,1.2,1,1,1,1,2,1,1);
	$height = Array (1.1,2.2,4.4,8.8,17.6,35.2);
//	$width = Array (3,8,12,2,1,1,1,1,1,1,1,1,1,1.5,1.5,1.5,1.5,1.5,1.5,1.5);
	$width = Array (3,8,12,2,1,1,1,1,1,1,1,1,1.5,1.5,1.5,1.5,1.5,1.5);
	$width_count=0;

	  $this->PrintSemester($subfaculty,$year,1);
	  $this->PrintSemester($subfaculty,$year,2);

	for ($i=0;$i<4;$i++) $this->total[$i]='';
	$this->total[1]="Итого за год";
	for ($i=0;$i<count($width);$i++) {
		$this->Cell($width[$i]*$baseWidth,$baseHeight,$this->total[$i],1,0,($i==1 || $i==2)?'L':'C',1);
	}
  $this->ln();
	$this->MultiCell(20*$baseWidth,5*$baesHeight,"Начальник учебного отдела _____________________ \"____\"__________ 20___.' г.",1,3,'L'); 
	$this->MultiCell(20*$baseWidth,5*$baesHeight,"Заведующий кафедрой _____________________ \"____\"__________ 20___.' г.",1,3,'L'); 
	}
	
	function Header(){
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
//	$width = Array (1,14,1.5,1,1,1,6,1.2,1,1,1,1,2,1,1);
	$height = Array (1.1,2.2,4.4,8.8,17.6,35.2);
	$width = Array (3,8,12,2,1,1,1,1,1,1,1,1,1,1.5,1.5,1.5,1.5,1.5,1.5,1.5);
	$width_count=0;
	if ($this->PageNo()==1) $this->PrintHeader(toCP($_GET["subfaculty"]),$_GET["year"]);
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
        $this->MultiCell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Факультет\nКурс\nГруппа",$height[4]*$baseHeight/2,3,'C');
//        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Группа",1,0,'C'); 
        $this->MultiCell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Направление подготовки (специальность),\nквалификация(степень)",$height[4]*$baseHeight/2,3,'C');
//        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Направление подготовки (специальность), квалификация(степень)",1,0,'C'); 
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Программа дисциплины",1,0,'C'); 
        $this->MultiCell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Форма\nобучения",$height[4]*$baseHeight/2,3,'C');
        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell(($width[$width_count++]+$width[$width_count])*$baseWidth,$height[3]*$baseHeight,"",1,3,'C'); 
        $X_txt=$this->GetX()-3+$width[$width_count]*$baseWidth;
        $Y_txt=$this->GetY();
        $this->writeRotie($X_txt, $Y_txt, "Форма промежуточной", 90);
        $this->writeRotie($X_txt+=3, $Y_txt, "     аттестации в", 90);
        $this->writeRotie($X_txt+=3, $Y_txt, "  экзаменационную", 90);
        $this->writeRotie($X_txt+=3, $Y_txt, "       сессию", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[3]*$baseHeight, "Экзамен (Э)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[3]*$baseHeight, "Диф. зачет (Д)", 90);
	$this->SetXY($this->GetX(),$Y);
        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Руксовая работа (КУ)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Реферат (Р)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Выпускной курс (В)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Количество недель практики", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Количество членов ГАК (декан ф-та)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[4]*$baseHeight, "Кол-во часов за руководство кафедрой (в год)", 90);
        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell(($width[$width_count++]+$width[$width_count])*$baseWidth,$height[3]*$baseHeight,"Количество",1,3,'C'); 
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "Студентов (докторантов", 90);
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[3]*$baseHeight, "аспирантов, соискателей)", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "Групп (потоков)", 90);
	$this->SetXY($this->GetX(),$Y);

        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell(($width[$width_count]+$width[$width_count+1]+$width[$width_count+2]+$width[$width_count+3])*$baseWidth,$height[1]*$baseHeight,"Виды учебной работы (часов)",1,3,'C'); 
//        $this->MultiCell($width[$width_count++]*$baseWidth,$height[4]*$baseHeight,"Форма\nобучения",$height[4]*$baseHeight/2,3,'C');
        $this->MultiCell(($width[$width_count]+$width[$width_count+1])*$baseWidth,($height[1]+$height[2])*$baseHeight,"Чтение\nлекций",$height[2]*$baseHeight/2,3,'C'); 
        $this->MultiCell(($width[$width_count]+$width[$width_count+1])*$baseWidth,($height[1]+$height[2])*$baseHeight,"Проведение\nдругих видов\nаудиторных\nзанятий",$height[2]*$baseHeight/2,3,'C'); 
	$this->SetXY($X,$Y+$height[3]*$baseHeight);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "по плану", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "Всего", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "по плану", 90);
        $this->Cell($width[$width_count++]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-7, $this->GetY()+$height[3]*$baseHeight, "Всего", 90);

//        $this->Cell($width[1]*$baseWidth,$height[0]*$baseHeight,"$semester семестр",1,2,'C');
//        $this->SetXY($X,$Y+$baseHeight); 
	$this->Ln();
	}

	function PrintHeader($subfaculty,$year) {
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
//	$width = Array (1,14,1.5,1,1,1,6,1.2,1,1,1,1,2,1,1);
	$height = Array (1.1,2.2,4.4,8.8,17.6,35.2);
	$width = Array (3,8,12,2,1,1,1,1,1,1,1,1,1,1.5,1.5,1.5,1.5,1.5,1.5,1.5);
	$width_count=0;

	$this->SetMargins(20,20);
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell($full*$baseWidth, $baseHeight, 'Форма 3',0,0,'R');
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	//Выводим наименование компании 
	$this->Cell($full*$baseWidth, $baseHeight, 'Министерство образования и науки Российской Федерации',0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, 'Государственное образовательное учреждение высшего профессионального образования',0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('name')).' ('.toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('abbr')).')',0,3,'C');
        //Выводим заголовок 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->MultiCell(10*$baseWidth,5*$baesHeight,"Утверждаю\nПроректор по учебной работе\n _____________________\n\n\"____\"__________ 20___.' г.",1,3,'L'); 
	$exp="//subfaculty[@abbr='".toUTF($subfaculty)."']";
//	echo $exp;
	$subfaculty_name = '';
	$elements=$this->xpath->query($exp);
	foreach ($elements as $element) {
		$subfaculty_name=toCP($element->getAttribute('name'));
	}
	$this->MultiCell(30*$baseWidth,5*$baesHeight,"Выписка из учебных планов для кафедры $subfaculty($subfaculty_name) на $year/".($year+1)." учебный год.",1,3,'L'); 
//	$this->MultiCell(4*$baseWidth,5*$baesHeight,"Форма 4",1,3,'R'); 

	//Переходим на следующую строку 
	$this->SetY($this->GetY()+5*$baseHeight);

	}
	
	function PrintSemester($subfaculty,$year,$semester) {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$X = $this->GetX();
	$Y = $this->GetY();
	$X_max = 45*$baseWidth + 5.4;
	$width = Array (3,8,12,2,1,1,1,1,1,1,1,1,1.5,1.5,1.5,1.5,1.5,1.5);
//	$width = Array (8,0,1.5,1,1,1,1,1,1,1,0.8,0.8,0.8,0.8,0.8,0.8,1,1,1.1,1.1,3.5);
//	$width = Array (8,0,1.5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3);
//	$width = Array (14,0,1.5,1,1,1,1.2,1,1,1,1,1,1);
	$sum = Array(0,0,0,0,0,0,0,0,0,0,0,0,0);
	$sem = ($semester==1)?1:0;
		$count=0;
		$pg = new pgsql();
		$pg->_query("SET client_encoding TO 'WIN1251'");
		$control = new pgsql();
		$control->_query("SET client_encoding TO 'WIN1251'");


		$sql = "SELECT prog.program_id as id, weeks,
						 ltrim(rtrim(discipline_title)) as title, 
						 dis.subfaculty, speciality_for as speciality, semester,
						 CASE WHEN difzach = true THEN 'Д' ELSE '' END as difzach,
						 CASE WHEN exam = true THEN 'Э' ELSE '' END as exam,
						 lectures,
						 seminars,
						 labs,
						 individual,
						 round(cast(lectures + seminars + labs AS numeric) / weeks,1) as aud,
						 round(cast(individual AS numeric)/ weeks,1) as indiv
						 from prog
						 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id AND subfaculty='$subfaculty')
						 INNER JOIN prog_status ON (prog.program_id = prog_status.program_id)
						 WHERE year='$year'
						 AND mod(semester,2)=$sem
					 	 ORDER BY semester, discipline_title";
		$pg->_query($sql);

	$this->SetFont('TimesNewRomanPSMT','',10);
	$this->SetFillColor(192,192,192); 
//var_dump($pg->_getResultAll());
  $prog = $stat = array();
  $prog[1]=$semester." полугодие";
  $stat[1]="Итого за ".$prog[1];
	$br=0;
  for ($i=0;$i<count($width);$i++) {
     $this->Cell($width[$i]*$baseWidth,$baseHeight/2,$prog[$i],1,0,($i==1 || $i==2)?'L':'C',0);
  }
  $this->ln();

  $prog = array();

		while ($rez=$pg->_getResultArray(true,PGSQL_ASSOC)) {
		  $prog[0]="";
		  $prog[1]=$rez["speciality"]." - ";

		  $exp="//specialities/speciality[@name='".$rez["speciality"]."']";
//	echo $exp;
	$spec = '';
	$elements=$this->xpath->query($exp);
	foreach ($elements as $element) {
		
   	$spec.=toCP($element->getAttribute('speciality_title'));
	if ($element->getAttribute('direction_title')) {
	$spec.="(";
	$spec.=toCP($element->getAttribute('direction_title'));
	$spec.="}";
	}
   }
		$langs_sql = "SELECT * FROM lang WHERE f_id = '".$rez["id"]."'";
		$control->_query($langs_sql);
		$count=1;
		$group=0;
		$students=0;
		while ($langs_rez=$control->_getResultArray()) {
			$exp="//group[@speciality_code = '".$rez["speciality"]."' and @semester = '".$rez["semester"]."' and @lang_first='".$langs_rez["lang_first"]."' and @lang_second='".$langs_rez["lang_second"]."' and @active='true']";
		//	echo $exp;
			$elements=$this->xpath->query($exp);
		//		print_r($elements->saveXML());
			foreach ($elements as $element) {
				$students+=toCP($element->getAttribute('students_count'));
   			$prog[0].=toCP($element->getAttribute('abbr'));
    			$prog[0].="\n";
    			$prog[3]=toCP($element->getAttribute('study_form'));
   			$count+=2.6;
   			$group++;
   			}
		}
if ($prog[0]) {

		  $prog[1].=$spec;
		  $prog[2]=$rez["title"];
		  if ($prog[4]=$rez["exam"])$stat[4]++;
		  if ($prog[5]=$rez["difzach"]) $stat[5]++;
		  $stat[14]+=$prog[14]=$rez["lectures"];
		  $prog[16]=$rez["seminars"]+$rez["labs"];

		$control->_query("SELECT * FROM control WHERE program_id = '".$rez["id"]."' ORDER BY week");
		$week = 0;
		$vol='';
		while ($control_rez=$control->_getResultArray()) {
			while ($control_rez["week"] != $week++) {
			}
			switch ($control_rez["control_type"]) {
			case "КУ": $stat[6]++;$prog[6]=$control_rez["control_type"]; break;
			case "Р ": $stat[7]++;$prog[7]=$control_rez["control_type"]; break;
			case "ПЗ": 
			case "КР": 
			case "КЗ": $prog[16]+=$control_rez["vol"]; break;
			}
		}
		$prog[0] = trim($prog[0]);
		$stat[12]+=$prog[12] = $students;
		$stream = intval($students/100)+(fmod($students,100)?1:0);
		$prog[13] = $group." (".$stream.")";
		$stat[15]+=$prog[15] = $rez["lectures"]*$stream;
		$stat[17]+=$prog[17] = $prog[16]*$group;
		$stat[16]+=$prog[16];
		$x=$this->GetX();
		$y=$this->GetY();
		$buttom=$y+$baseHeight/2+$count;
//		echo $prog[0]."<br>";
		if ($buttom > 277) { $this->AddPage();
		  $x=$this->GetX();
		  $y=$this->GetY();
		}
		  for ($i=0;$i<count($width);$i++) {
		      $X=$this->GetX();
		      $Y=$this->GetY();
//  		      echo "b: $buttom Y: ".$y." COUNT: ".$count." Pn: ".$this->PageNo()."<br>";
		      $this->MultiCell($width[$i]*$baseWidth,$baseHeight/2+$count,$prog[$i],1,3,($i==1 || $i==2)?'L':'C');
		      $this->SetXY($X+$width[$i]*$baseWidth, $Y);
// 		     $this->MultiCell($width[$i]*$baseWidth,$count*$baseHeight/2,$prog[$i],$count*$baseHeight/2,3,($i==1 || $i==2)?'L':'C');
//		     $this->Cell($width[$i]*$baseWidth,$baseHeight/2,$prog[$i],1,0,($i==1 || $i==2)?'L':'C');
		  }
		  $this->ln();
		  $this->SetY($y+$count+$baseHeight/2);
		}
}
//		$this->SetXY($x,$y);
  for ($i=0;$i<count($width);$i++) {
    $this->Cell($width[$i]*$baseWidth,$baseHeight/2,"",1,0,($i==1 || $i==2)?'L':'C',1);
  }
  $this->ln();
		
//			for ($i=0;$i<17;$i++) $sum[$i]=0;
  for ($i=0;$i<count($width);$i++) {
     $this->Cell($width[$i]*$baseWidth,$baseHeight/2,$stat[$i],1,0,($i==1 || $i==2)?'L':'C',1);
	 $this->total[$i] += $stat[$i]; 
  }
  $this->ln();

	}
}

class OTR extends MyPDF {

	public $baseWidth = 9; 
	public $baseHeight = 9; 
	public $lf = '';
	public $ls = '';
	
	function Footer() {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$this->Cell($full*$baseWidth,$baseHeight,"Обозначение контрольных мероприятий (КМ): КР - Контрольная работа     КМ - Контрольное мероприятие    ДЗ - домашнее задание     Р - Реферат     КУ - Курсовая работа     ВР - Квалификационная работа     КЗ - Контрольное занятие",0,0,'L');
	}

    function PrintTitle($year,$subfaculty,$speciality,$semester,$lang_first,$lang_second,$prog_weeks=19) {

	$exp="//lang[@index='$lang_first' or @index='$lang_second']";
//	echo $exp;
	$lang = '';
	$elements=$this->xpath->query($exp);
	foreach ($elements as $element) {
		
   	$lang[]=toCP($element->getAttribute('titleshort'));
   }
    
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
        //Выводим логотип 
        //$this->Image($image,6,6,40,20); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$X=$this->GetX();
	$this->Cell($full*$baseWidth, $baseHeight, 'Форма 3',0,0,'R');
	//Переходим на следующую строку 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	//Выводим наименование компании 
	$this->SetXY($X, $this->GetY());
	$this->Cell($full*$baseWidth, $baseHeight, 'Министерство образования и науки Российской Федерации',0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, 'Государственное образовательное учреждение высшего профессионального образования',0,3,'C');
	$this->Cell($full*$baseWidth, $baseHeight, toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('name')).' ('.toCP($this->xml->getElementsByTagName("structure")->item(0)->getAttribute('abbr')).')',0,3,'C');
	//Выводим наименование компании 
	$this->Cell(20*$baseWidth,$baseHeight,'Утверждаю',0,0,'L'); 
	//Переходим на следующую строку 
	$this->Ln(); 
	$this->Cell(20*$baseWidth,$baseHeight,'Проректор по учебной работе',0,0,'L'); 
	//Переходим на следующую строку 
	$this->Ln(); 
        //Устанавливаем шрифт для наименования компании 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	//Выводим наименование компании 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(25*$baseWidth,$baseHeight,'Рабочий учебный план на '.$year.'/'.($year+1).' учебный год',0,0,'R'); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(5*$baseWidth,$baseHeight,'Специальность ',0,0,'R'); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(5*$baseWidth,$baseHeight,$speciality." (".$lang[0]."/".$lang[1].")",0,0,'L'); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(3*$baseWidth,$baseHeight,'Кафедра ',0,0,'R'); 
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(2*$baseWidth,$baseHeight,$subfaculty,0,0,'L'); 
	$this->SetFont('TimesNewRomanPSMT','',12); 
	$this->Cell(2*$baseWidth,$baseHeight,'Курс ',0,0,'R');
	$this->SetFont('TimesNewRomanPS-BoldMT','B',12); 
	$this->Cell(1*$baseWidth,$baseHeight,round($semester/2),0,0,'L');
	$this->SetFont('TimesNewRomanPSMT','',12); 
        //Переходим на следующую строку 
        $this->Ln(); 
        //Делаем отступ от левого края (рисуя прозрачную ячейку) 
//        $this->Cell(37); 
        //Устанавливаем цвет заливки следующих ячеек (R,G,B) 
//        $this->SetFillColor(209,204,244); 
        //Устанавливаем шрифт для наименования документа 
//        $this->SetFont('Verdana','',12); 
        //Выводим наименование документа 
//        $this->Cell(150,8,$title,0,0,'C',1); 
        //Переходим на следующую строку 
        $this->Ln(); 
        //Устанавливаем шрифт заголовка таблицы 
	$graf = Array(6.7,2.8,2,5,4.5,4.5,4.5,4.5,4.5,4.5);
	$old = $baseHeight;
	$baseHeight = 2*$baseHeight;
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
	$this->MultiCell($graf[0]*$baseWidth+5,$baseHeight,"Группа (колличество)",1,3,'C'); 
	$this->MultiCell($graf[1]*$baseWidth,$baseHeight,"Кол-во\nстудентов",1,3,'C'); 
	$this->MultiCell($graf[2]*$baseWidth,$baseHeight,"Семестр",1,3,'C'); 
	$this->MultiCell($graf[3]*$baseWidth,$baseHeight,"Период проведения\nпрактических занятий",1,3,'C'); 
	$this->MultiCell($graf[4]*$baseWidth,$baseHeight,"Зачетная неделя\n(зачеты, диф.зачеты)",1,3,'C'); 
	$this->MultiCell($graf[6]*$baseWidth,$baseHeight,"Экзаменационная\nсессия",1,3,'C'); 
	$this->MultiCell($graf[5]*$baseWidth,$baseHeight,"Подготовка выпускной\nквалификац. работы",1,3,'C'); 
	$this->MultiCell($graf[7]*$baseWidth,$baseHeight,"Итоговая\nгос. аттестация",1,3,'C'); 
	$this->MultiCell($graf[7]*$baseWidth,$baseHeight,"Практика, недель",1,3,'C'); 
	$this->MultiCell($graf[8]*$baseWidth,$baseHeight,"Каникулы, период",1,3,'C'); 
	$this->Ln();
	$this->Ln();
	$head = new pgsql();
	$head->_query("SET client_encoding TO 'WIN1251'");
	$head->_query("SELECT DISTINCT prog.semester as semester, prog.weeks as weeks, theory_begin, theory_end, tests_begin, 
						tests_end, exams_begin, exams_end, holidays_begin, holidays_end 
						FROM year, year_organize, prog, lang
						WHERE year.year='$year' 
						AND lang.f_id = program_id AND lang_first='$lang_first' AND lang_second='$lang_second'
						AND year_organize.semester='".(!fmod($semester,2)?"2":"1")."' 
						AND year.id = year_organize.f_id
						AND subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='$semester'
						AND practice=0
						AND prog.weeks=year_organize.weeks
						AND year.year=prog.year");
	$rez = $head->_getResult();
	$rez_weeks=$rez["weeks"];
	$head->_query("SELECT DISTINCT practice FROM prog
						WHERE subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='$semester'
						AND year='$year'
						AND practice > 0");
	$pr = $head->_getResult();
	
	$exp="//group[@speciality_code = '$speciality' and @semester = '$semester' and @lang_first='$lang_first' and @lang_second='$lang_second'] and @active='true'";
//	echo $exp;
	$count=$students=0;
	$elements=$this->xpath->query($exp);
//		print_r($elements->saveXML());
	foreach ($elements as $element) {
		$students+=toCP($element->getAttribute('students_count'));
   	$dates[0].=toCP($element->getAttribute('abbr'))."(".toCP($element->getAttribute('students_count')).")";
   	if (fmod($count,2)!=0)
   		$dates[0].="\n";
   	else
   		$dates[0].=" ";
   	$count++;
   	$gid = toCP($element->getAttribute('id'));
   }
   $dates[1]=$students;
   $dates[2]=$semester;
//	echo $dates[2]." ";
   $sem = (fmod($dates[2],2))?1:2;
//   echo $sem;
	$exp="//year[@semester = '$sem']/weeks/week";
	$count=0;
	$elements=$this->xpath->query($exp);
//		print_r($elements->saveXML());
	foreach ($elements as $element) {
   	$week = $element->getAttribute('week');
   	$weeks[$week][0] = $element->getAttribute('begin');
   	$weeks[$week][1] = $element->getAttribute('end');
   }
//	print_r($weeks);

	$exp="//group[@id = '$gid' and @speciality_code = '$speciality' and @semester = '$semester' and @lang_first='$lang_first' and @lang_second='$lang_second']/date";

//	echo $exp;
	$count=0;
	$elements=$this->xpath->query($exp);
//		print_r($elements->saveXML());
//	$element = $elements[0];
	foreach ($elements as $element) {
		switch ( toCP($element->getAttribute('type')) ) {
// группа[0], кол-во[1], семестр[2], практические занятия[3], зачеты[4], экзамены[5], ВКР[6], ГОС[7], практика[8], каникулы[9]
		case "Уз":
			$dates[3].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
			break;
		case "З":
			$dates[4].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
			break;
		case "Э":
			$dates[5].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
			break;
		case "А":
			$dates[7].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
			break;
		case "К":
			$dates[9].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
			break;
		case "Ср":
		case "Ус": break;
		default:
			$dates[8].= $weeks[$element->getAttribute('begin')][0]."-".$weeks[$element->getAttribute('end')][1]."\n";
		break;
		}
   	$count++;
   }
	$head->_query("SELECT DISTINCT prog.semester as semester, prog.weeks as weeks, theory_begin, theory_end, tests_begin, 
						tests_end, exams_begin, exams_end, holidays_begin, holidays_end 
						FROM year, year_organize, prog, lang
						WHERE year.year='$year' 
						AND year_organize.semester='".(!fmod(($semester+1),2)?"2":"1")."' 
						AND lang.f_id = program_id AND lang_first='$lang_first' AND lang_second='$lang_second'
						AND year.id = year_organize.f_id
						AND subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='".($semester+1)."'
						AND year.year=prog.year");
	$rez = $head->_getResult();
	print_r($rez);
	$dates[3].=$prog_weeks." недель";
   for ($_i=0;$_i<10;$_i++)
   	$dates[$_i]=trim($dates[$_i]);
//	var_dump($date);
	
//	    $count=10;
//	print_r($group_1);
	$val = $dates;
	
	for($i=0;$i<10;$i++) {
		$this->MultiCell((($i)?$graf[$i]*$baseWidth:($graf[$i]*$baseWidth+5)),$baseHeight,$val[$i],1,3,'C'); 
//		$this->Cell((($i)?$graf[$i]*$baseWidth:($graf[$i]*$baseWidth+5)),$baseHeight,$val[$i],1,0,'C'); 
	}
	$baseHeight=$old;
	$this->Ln();
/*	$this->Ln();
	$head->_query("SELECT DISTINCT prog.semester as semester, prog.weeks as weeks, theory_begin, theory_end, tests_begin, 
						tests_end, exams_begin, exams_end, holidays_begin, holidays_end 
						FROM year, year_organize, prog, lang
						WHERE year.year='$year' 
						AND lang.f_id = program_id AND lang_first='$lang_first' AND lang_second='$lang_second'
						AND year_organize.semester='".(!fmod(($semester+1),2)?"2":"1")."' 
						AND year.id = year_organize.f_id
						AND subfaculty_for='$subfaculty' 
						AND speciality_for='$speciality'
						AND prog.semester='".($semester+1)."'
						AND year.year=prog.year");
	$rez = $head->_getResult();
	$val = Array($group_2[1], $count, $rez["semester"],$rez["weeks"],dateto($rez["theory_begin"])." - ".dateto($rez["theory_end"]),dateto($rez["tests_begin"])." - ".dateto($rez["tests_end"]),dateto($rez["exams_begin"])." - ".dateto($rez["exams_end"]),'',dateto($rez["holidays_begin"])." - ".dateto($rez["holidays_end"]));
	for($i=0;$i<10;$i++) {
		$this->Cell((($i)?$graf[$i]*$baseWidth:($graf[$i]*$baseWidth+5)),$baseHeight,$val[$i],1,0,'C'); 
	}
*/	$this->Ln();
	$this->Ln();
    }

    function OtrHead($semester,$year) {
	$baseWidth = $this->baseWidth;
	$baseHeight = 5;
//	$width = Array (1,14,1.5,1,1,1,6,1.2,1,1,1,1,2,1,1);
	$height = Array (1,2,3,4,5);
	$width = Array (1,8,1.5,1,1,1,1,1,1,1,1,0.8,0.8,0.8,0.8,0.8,0.8,1,1,1.1,1.1,3.5);
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
        //Выводим заголовок 
        $this->Cell($width[0]*$baseWidth,$height[4]*$baseHeight,"п",1,0,'C'); 
        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell($width[1]*$baseWidth,$height[0]*$baseHeight,"$semester семестр",1,2,'C');
//        $this->SetXY($X,$Y+$baseHeight); 
        $this->MultiCell($width[1]*$baseWidth,$height[3]*$baseHeight,"\n\nНаименование дисциплин, практик и\nдругих видов учебной работы",1,3,'C'); 
        $this->SetXY($this->GetX(),$Y);
        $this->Cell($width[2]*$baseWidth,$height[4]*$baseHeight,"Кафедра",1,0,'C'); 
        $X=$this->GetX();
        $Y=$this->GetY();
        $this->Cell(($width[3]+$width[4]+$width[5])*$baseWidth,$height[0]*$baseHeight,"Форма контроля",1,2,'C'); 
//        $this->SetXY($X,$Y+$baseHeight); 
        $this->Cell($width[3]*$baseWidth,$height[3]*$baseHeight,"Зачет",1,0,'C'); 
        $this->MultiCell($width[4]*$baseWidth,$height[3]*$baseHeight,"Диф.\nзачет",3,$baseHeight,'C'); 
        $this->Cell($width[5]*$baseWidth,$height[3]*$baseHeight,"Экз.",1,0,'C'); 
        $this->SetXY($this->GetX(),$Y);
        $this->Cell($width[6]*$baseWidth,$height[4]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-5, $this->GetY()+$height[3]*$baseHeight+4, "Трудоемкость", 90);
        $this->writeRotie($this->GetX()-2, $this->GetY()+$height[3]*$baseHeight+4, " в кредитах", 90);
        $this->Cell(($width[7]+$width[8]+$width[9]+$width[10]+$width[11]+$width[12]+$width[13]+$width[14]+$width[15]+$width[16]+$width[17])*$baseWidth,$baseHeight,"Общая трудоемкость (час)",1,2,'C'); 
        $this->Cell($width[7]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight, "Всего", 90);
//        $this->SetXY($this->GetX(),$this->GetY()-$baseHeight);
        $this->Cell(($width[8]+$width[9]+$width[10]+$width[11]+$width[12]+$width[13]+$width[14]+$width[15]+$width[16])*$baseWidth,$baseHeight,"Теоретическое обучение (час)",1,2,'C'); 
        $this->Cell($width[9]*$baseWidth,$height[2]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight-3, "Всего", 90);
        $this->Cell(($width[10]+$width[11]+$width[12]+$width[13]+$width[14]+$width[15]+$width[16])*$baseWidth,$baseHeight,"Аудиторные занятия (час)",1,2,'C'); 
        $this->Cell($width[10]*$baseWidth,$height[1]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight-5, "Всего", 90);
        $this->Cell(($width[11]+$width[12]+$width[13]+$width[14]+$width[15]+$width[16])*$baseWidth,$baseHeight,"в том числе (час)",1,2,'C'); 
        $this->Cell($width[11]*$baseWidth,$baseHeight,"Л",1,0,'C'); 
        $this->Cell($width[12]*$baseWidth,$baseHeight,"С",1,0,'C'); 
        $this->Cell($width[13]*$baseWidth,$baseHeight,"ПЗ",1,0,'C'); 
        $this->Cell($width[14]*$baseWidth,$baseHeight,"КР",1,0,'C'); 
        $this->Cell($width[15]*$baseWidth,$baseHeight,"",1,0,'C'); 
        $this->Cell($width[16]*$baseWidth,$baseHeight,"КЗ",1,0,'C'); //2
        $this->SetXY($this->GetX(),$this->GetY()-2*$baseHeight); 
        $this->Cell($width[17]*$baseWidth,$height[2]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-5, $this->GetY()+$height[2]*$baseHeight-1, "Сам.", 90);
        $this->writeRotie($this->GetX()-2, $this->GetY()+$height[2]*$baseHeight-1, "работа", 90);
        $this->SetXY($this->GetX(),$this->GetY()-$baseHeight); 
        $this->Cell($width[18]*$baseWidth,$height[3]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight-1, "Экз", 90);
        $this->SetXY($this->GetX(),$this->GetY()-$baseHeight); 
//        $this->Cell(($width[19]+$width[20])*$baseWidth,$baseHeight,"",1,2,'C');
        $this->MultiCell(($width[19]+$width[20])*$baseWidth,$height[1]*$baseHeight,"Всего часов\nв неделю",1,3,'C');
        $this->SetXY($this->GetX()-($width[19]+$width[20])*$baseWidth,$this->GetY()+$height[1]*$baseHeight); 
        $this->Cell($width[19]*$baseWidth,$height[2]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight-1, "Аудит.", 90);
        $this->Cell($width[20]*$baseWidth,$height[2]*$baseHeight,"",1,0,'C'); 
        $this->writeRotie($this->GetX()-3, $this->GetY()+$height[2]*$baseHeight-1, "Самост.", 90);
        
	$this->SetXY($this->GetX(),$this->GetY()-2*$baseHeight); 
	$this->MultiCell($width[21]*$baseWidth,$height[4]*$baseHeight,"Объем КМ,\nчас",1,7,'C');
        $this->Cell(21*($baseWidth-3),$baseHeight,"График выполнения контрольных мероприятий",1,2,'C'); 
	$this->SetFont('TimesNewRomanPSMT','',10); 
	$date = Array();
	$j=0;
	$count=0;
	if (fmod($semester,2)) {
		$month = Array(Array("Сентябрь","Октябрь","Ноябрь","Декабрь","Январь"),Array(0,0,0,0,0));
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
		$month = Array(Array("Февраль","Март","Апрель","Май","Июнь"),Array(0,0,0,0,0));
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
        for ($i=0;$i<5;$i++) $this->Cell($month[1][$i]*($baseWidth-3),3*$baseHeight,$month[0][$i],1,0,'C');
	$this->SetXY($x,$y+3*$baseHeight);
	for ($i=1;$i<22;$i++) {
		$this->Cell($baseWidth-3,$baseHeight,$date[$i-1],1,0,'C');
	}
	$this->Ln();
	}
	
	function PrintOtr($subfaculty,$speciality,$semester,$year,$lang_first,$lang_second) {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$X = $this->GetX();
	$Y = $this->GetY();
	$X_max = 45*$baseWidth + 5.4;
	$width = Array (8,0,1.5,1,1,1,1,1,1,1,0.8,0.8,0.8,0.8,0.8,0.8,1,1,1.1,1.1,3.5);
//	$width = Array (8,0,1.5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,3);
//	$width = Array (14,0,1.5,1,1,1,1.2,1,1,1,1,1,1);
	$sum = Array(0,0,0,0,0,0,0,0,0,0,0,0,0);
		$count=0;
		$this->OtrHead($semester,$year);
		$pg = new pgsql();
		$pg->_query("SET client_encoding TO 'WIN1251'");
		$control = new pgsql();
		$control->_query("SET client_encoding TO 'WIN1251'");

/*		$pg->_query("SELECT * from prog, lang
					 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
						 WHERE subfaculty_for='$subfaculty' 
						 AND speciality_for='$speciality'
						 AND semester='$semester'
						 AND year='$year'
						AND lang.f_id = program_id AND lang_first='$lang_first' AND lang_second='$lang_second'
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
*/
		$pg->_query("SELECT prog.program_id as id, weeks,
						 ltrim(rtrim(discipline_title)), 
						 dis.subfaculty, 
						 CASE WHEN zach = true THEN 'зач' ELSE '-' END as zach,
						 CASE WHEN difzach = true THEN 'зач' ELSE '-' END as difzach,
						 CASE WHEN exam = true THEN 'экз' ELSE '-' END as exam,
						 lectures,
						 seminars,
						 labs,
						 individual,
						 round(cast(lectures + seminars + labs AS numeric) / weeks,1) as aud,
						 round(cast(individual AS numeric)/ weeks,1) as indiv,
						 zach_count
						 from prog
						 INNER JOIN dis ON (prog.discipline_id=dis.discipline_id)
						 INNER JOIN prog_status ON (prog.program_id = prog_status.program_id)
						 INNER JOIN lang ON (f_id = prog.program_id AND lang_first='$lang_first' AND lang_second='$lang_second')
						 WHERE subfaculty_for='$subfaculty' 
						 AND speciality_for='$speciality'
						 AND semester='$semester'
						 AND year='$year'
						 
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
	$this->SetFont('TimesNewRomanPSMT','',10);
	$this->SetFillColor(192,192,192); 
			for ($i=0;$i<17;$i++) $sum[$i]=0;
		while ($rez=$pg->_getResultArray(true,PGSQL_NUM)) {
			switch ($rez[1]) { // Семестр
//			case 13: $controlMask = Array (1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1); break;
//			case 17: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1); break;
//			case 20: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1); break;
			default: $controlMask = Array (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); break;
			}
			for ($i=5;$i<19;$i++) $otr[$i]=0;
			for ($i=0;$i<5;$i++)
				$otr[$i]=$rez[$i+2];
			for ($i=9;$i<12;$i++)
				$otr[$i]=$rez[$i-2];
			$otr[15]=$rez[$i-2];
			$otr[16]+=($otr[2]!="-")?18:0;
			$otr[16]+=($otr[3]!="-")?18:0;
			$otr[16]+=($otr[4]!="-")?36:0;
//			print_r($rez);
//			print_r($otr);
			$control->_query("SELECT * FROM control WHERE program_id = '".$rez[0]."' ORDER BY week");
			$week = 0;
			$vol='';
			while ($control_rez=$control->_getResultArray()) {
//				print_r($control_rez);
				while ($control_rez["week"] != $week++) {
				}
				switch ($control_rez["control_type"]) {
				case "КР": $otr[12]+=$control_rez["vol"]; break;
				case "КЗ": $otr[14]+=$control_rez["vol"]; break;
				}
			$vol.=$control_rez["vol"].' ';
			}

			for ($i=9;$i<15;$i++)
				$otr[8]+=$otr[$i];
			$otr[17]=round($otr[8]/$rez[1]);
			$otr[18]=round($otr[16]/$rez[1]);
			$otr[7]=$otr[8]+$otr[15];
			$otr[6]=$otr[7]+$otr[16];
			$otr[5]=intval($otr[6]/36);
			$rem = $otr[6]/36-$otr[5];
//			print_r($rem."-");
			if ($rem >= 0 && $rem <=0.25)
			$otr[5]+=0;
			else if ($rem > 0.25 && $rem <=0.75)
			$otr[5]+=0.5;
			else
			$otr[5]++;

			for ($i=0;$i<3;$i++)
				($otr[$i+2]!="-")?$sum[$i]++:""; 
			for ($i=3;$i<17;$i++)
				$sum[$i]+=$otr[$i+2];
			
			$aud_week+=$rez[12];
			$indiv_week+=$rez[13];
			for($i=12;$i<14;$i++)
			    if (!fmod($rez[$i],1)) 
				$rez[$i]=intval($rez[$i]);
			for ($i=0;$i<count($width)-1;$i++) {
			if ($i==0) { // i == 0 - мЮГБЮМХЕ ДХЯЖХОКХМШ;
//				$title = explode(" ",rtrim(ltrim(str_replace("&#8470;","№",$rez[$i+2]))));
				$num = count($title);
				$multi_count = 1;
				$multi=0;
				$str = "";
				$length=0;
				$title=rtrim(ltrim(str_replace("&#8470;","№",$otr[$i])));
				$multi = floor(strlen($title)/42);
				$title_array=explode(" ",$title);
				if ($multi>0) {
					for ($multi_counti=0; $multi_counti<count($title_array); $multi_counti++) {
						$strlen = strlen($str." ".$title_array[$multi_counti]);
						if ($strlen<42*$multi_count)
							$str.=" ".$title_array[$multi_counti];
						else {
							$str.="\n".$title_array[$multi_counti];
							++$multi_count;
						//	echo "1";
						}
					}
				}
				else $str = $title;
//				echo $str." - ".$title."\n";
//				echo $multi;
/*				while (++$j <= $num) {
					$str.=(($j==1)?"":" ").$title[$j-1];
					if ((strlen($str)+strlen($title[$j]))>(($multi+1)*42)) {
						// echo "ln - ".strlen($str)." - ".$length;
						$str.="\n";
							$multi++;
						$length+=strlen($str)-1;
					}
				}
*/				if ($multi>0) {
					$baseHeight = 2*$this->baseHeight;
					$this->Cell($baseWidth,$baseHeight/2,++$count,1,0,'C');
					$this->MultiCell($width[$i]*$baseWidth,$baseHeight/2,$str,1,3,'L');
				}
				else {
					$baseHeight = 1.5*$this->baseHeight;
					$this->Cell($baseWidth,$baseHeight/2,++$count,1,0,'C');
					$this->Cell($width[$i]*$baseWidth,$baseHeight/2,$str,1,0,'L');
				}
			
			$i++;
			} else {
		
				$this->Cell($width[$i]*$baseWidth,$baseHeight/2,rtrim(ltrim($otr[$i-1])).(($i>5 && $i<13)?" ":""),1,0,($i>5 && $i<13)?'R':'C');
			}
			}
//			print_r($rez);
//			print_r($sum);
//			print("<br>");
			$control->_query("SELECT * FROM control WHERE program_id = '".$rez[0]."' AND control_type!='КЗ' ORDER BY week");
			$week = 0;
			$vol='';
			while ($control_rez=$control->_getResultArray()) {
				while ($control_rez["week"] != $week++) {
				}
			$vol.=$control_rez["vol"].' ';
			}
			$this->Cell($width[$i]*$baseWidth,$baseHeight/2,$vol,1,0,'R');
			$control->_query("SELECT * FROM control WHERE program_id = '$rez[0]' AND control_type!='КЗ' ORDER BY week");
			$week = 0;
			while ($control_rez=$control->_getResultArray()) {
//			if ()
				while (($control_rez["week"]-1) != $week++) {
					$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$week-1]);
				}
				$this->Cell($baseWidth-3,$baseHeight/2,$control_rez["control_type"],1,0,'C',$controlMask[$week-1]);
/*				if ($control_rez["control_type"]=='КП') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // Курсовой проект
                                        ($week == 15) ? $arr = array("","","","","","","","КП","","","КП","","","КП","","КП","","") : "";
                                        ($week == 14) ? $arr = array("","","","","КП","","","КП","","","КП","","","","КП","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
				if ($control_rez["control_type"]=='ДП') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // квалификационная работа
                                        ($week == 17) ? $arr = array("","","","","","ДП","","","","ДП","","","","ДП","","","","ДП","","","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
/*				if ($control_rez["control_type"]=='ДЗ') {
				$this->SetX($this->getX()-($baseWidth-3)*($week));
                                        // Курсовой проект
                                        ($week == 15) ? $arr = array("","","","","","","","КП","","","КП","","","КП","","КП","","") : "";
                                        ($week == 14) ? $arr = array("","","","","КП","","","КП","","","КП","","","","КП","","") : "";
				    for ($i=1;$i<=$week;$i++)
					$this->Cell($baseWidth-3,$baseHeight/2,$arr[$i],1,0,'C',($i<=$week)?1:$controlMask[$week-1]);
				
				}
*/			}
			while ($week++ < 21) 
					$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$week-1]);
			$this->Ln();
		}
		while ($count<20) {
			$baseHeight = 1.5*$this->baseHeight;
			++$count;
			$this->Cell($baseWidth,$baseHeight/2,"",1,0,'C');
			for ($i=0;$i<21;$i++)
				if($i!=1) $this->Cell($width[$i]*$baseWidth,$baseHeight/2,"",1,0,'L');
//			$this->Cell(4*($baseWidth-3),$baseHeight/2,"",1,0,'C');
			for ($i=0;$i<21;$i++)
				$this->Cell($baseWidth-3,$baseHeight/2,"",1,0,'C',$controlMask[$i]);
			$this->Ln();
		}
		$b_Y = $this->GetY();			
		$this->Cell(($width[0]+$width[2]+1)*$baseWidth,$baseHeight,"Итого: ",1,0,'R');
		for($i=3;$i<20;$i++)
			$this->Cell($width[$i]*$baseWidth,$baseHeight,$sum[$i-3],1,0,'C');
		$this->MultiCell($width[$i]*$baseWidth,$baseHeight,"Недели  -числ\n               -знам",1,4,'R');
		for ($i=1;$i<22;$i++)
			$this->MultiCell($baseWidth-3,$baseHeight,(!fmod($i,2))?"\n$i":"$i\n",1,4,'C');
		$this->Ln();
		$Y_max = $this->GetY();			
//	print_r($sum);
	$this->Cell(26*$baseWidth,$baseHeight,'В неделю - '.($sum[15]+$sum[16]).'   ',0,0,'R');
	$this->Ln();
	$this->SetLineWidth(0.5);
	$baseHeight = 5;
	$dx = 0;
//	$Y_max = 18*$baseHeight+$Y+1.4;
/*	$this->Line($X,$Y,$X_max,$Y);
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
	$this->Line($X_max,$Y,$X_max,$Y_max);*/
	$this->SetLineWidth(0.2);
	}

	function PrintOtrF($subfaculty) {
	$baseWidth = $this->baseWidth;
	$baseHeight = $this->baseHeight;
	$this->SetFont('TimesNewRomanPS-BoldMT','B',10); 
	$this->Cell(8*$baseWidth,$baseHeight,"Заведующий кафедрой ".$subfaculty,0,0,'L');
	$this->Cell(25*$baseWidth,$baseHeight,"Заведующий выпускающей кафедрой (руководитель выпускающего межкафедрального объединения)",0,0,'L');
	$this->Cell(11*$baseWidth,$baseHeight,"Начальник учебно-методического управления",0,0,'L');
	$this->SetFont('TimesNewRomanPSMT','',10);
	$this->Ln();
	}
}
?>
