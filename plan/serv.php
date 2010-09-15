<?php
function SelectDisDepartment()
	{
	$i=-1;
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');
	//document.getElementById('dep').innerHTML = document.getElementById(this.value).innerHTML;
	$facselect = "<select  style='width:92px;' name=fac onchange=\"document.getElementById('dep').innerHTML = document.getElementById(this.value).innerHTML;\">\n<option value=''>Факультет</option>\n";
	while(($current_faculty = $parsed->faculty[++$i]))
		{
		$j=-1;
		$facselect .= "<option value=".toCP($current_faculty[abbr]).">".toCP($current_faculty[abbr])."</option>\n";
		
		$depselect .= "<span style='display:none;' id='".toCP($current_faculty[abbr])."'><select name=dep style='width:80px;'  onchange=\"document.getElementById('att_kaf').value = this.value;document.getElementById('chief').innerHTML = document.getElementById('chief'+this.value).innerHTML;\">\n<option value=''>Кафедра</option>\n";
		while($current_faculty->subfaculty[++$j][abbr])
			{
			$depselect .= "<option value=".toCP($current_faculty->subfaculty[$j][abbr]).">".toCP($current_faculty->subfaculty[$j][abbr])."</option>\n";
			
			$chieves .= "<span id=chief".toCP($current_faculty->subfaculty[$j][abbr])." style='display:none;'>".toCP($current_faculty->subfaculty[$j][chief])."</span>\n";
			}
		$depselect .= "</select></span>\n";
		}
	$facselect .= "</select> <span id=dep></span> ";
	return $facselect.$depselect.$chieves;
	}

function MakeNormalDate($date){
	$days=array('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31');
	$month_c=array('01','02','03','04','05','06','07','08','09','10','11','12');
	$months=array('января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря');
	if(!$date){return "";}
	$data=split("-",$date);
	return $data[2]." ".$months[$data[1]-1]." ".$data[0];

}

function MakeRussianDate($date){
	if(!$date){return "";}
	$data=split("-",$date);
	return "$data[2].$data[1].".substr($data[0],-2);
}

function ExtractSem($group){
	$Semestr = split("-",$group);
	return ($Semestr[1] - $Semestr[1]%10)/10;
}

function ExtractNumber($group){
	return substr($group, -1, 1);
}

function ExtractDepartment($group){
	$Semestr = split("-",$group);
	return $Semestr[0];
}

function ExtractFaculty($group){

	if (ereg ("(.{1,30})([0-9]{1,2})-([0-9]{1,3})", $group, $regs))
		return $regs[1];
	else
		return "error";
}
function GetDean($faculty)
	{
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');
	for($i=0;$i<count($parsed);$i++)
		{
		if(trim(toCP($parsed->faculty[$i][abbr])) == $faculty)
			return toCP($parsed->faculty[$i][dean]);
		}

	}

function GetChief($department)
	{
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');
	for($i=0;$i<count($parsed);$i++)
		{
		
		//print count($parsed->faculty[$i])."<br>";
		
		for($j=0;$j<count($parsed->faculty[$i]);$j++)
			if(str_replace("-","",toCP($parsed->faculty[$i]->subfaculty[$j][abbr])) == $department)
				return (toCP($parsed->faculty[$i]->subfaculty[$j][chief]));
		
		}

	}

function MakeMenu()
	{
	global $IsAdmin;
	global $IsRector;
	global $IsFaculty;
	global $IsSubFaculty;
	global $Department;
	global $KafArray;	
	
	$i=-1;
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');
	
	while(($current_faculty = $parsed->faculty[++$i]))
		{
		if(($IsRector||$IsAdmin||($current_faculty[uid]==$Department)))
		{
		$j=-1;
		$ret2 = "";
		while($current_faculty->subfaculty[++$j][abbr])
			{
			//проверка, если юзер-кафедра
			$Kaf=0;
			for($C=0;$C<count($KafArray);$C++)
				{
				if($KafArray[$C]==ereg_replace("-","",$current_faculty->subfaculty[$j][abbr]))
					$Kaf=1;
				}
			$k=-1;
			$ret3="";
			while($current_faculty->subfaculty[$j]->group[++$k][abbr])
				{
				$ret3.= "<p class=menulevel3><img src=img/b-arrow.gif> <a target=myFr href=ndex.php?action=ShowDisciplines&group=".toCP($current_faculty->subfaculty[$j]->group[$k][abbr]).">".toCP($current_faculty->subfaculty[$j]->group[$k][abbr])."</a></p>\n";
				}
				
			$Correct=0;
			for($С=0;$С<count($KafArray);$С++)
				{
				if($IsSubFaculty&&(ereg_replace("-","",$current_faculty->subfaculty[$j][abbr])==$KafArray[$С])){$Correct=1;}
				}
			if($IsRector||$IsAdmin||$IsFaculty)$Correct=1;
			//
			if($Correct)
			{
			$ret2 .= "<p class=menulevel2>"
			.($k?"<img src=img/".((!($IsAdmin||$IsRector))&&$Kaf?'b-minus.gif':'b-plus.gif')." class=pointer_img onclick=\"this.src=ShowSub(this.src,'span$i$j')\">":"<img src=img/b-arrow.gif>")
			." <!a target=myFr href=ndex.php?action=listByDepartment&department=".ereg_replace("-","",$current_faculty->subfaculty[$j][abbr]).">".toCP($current_faculty->subfaculty[$j][abbr])." - ".toCP($current_faculty->subfaculty[$j][name])."</a></p>\n";
			$ret2.="<span id=span$i$j style='display:".((!($IsAdmin||$IsRector))&&$Kaf?'inline':'none')."'>";
			$ret2.=$ret3;
			$ret2.="</span>";
			}
			}
		
		$ret .= "<p class=menulevel1>"
		        .( $j ? "<img src=img/".(!($IsAdmin||$IsRector)?'b-minus.gif':'b-plus.gif')." class=pointer_img onclick=\"this.src=ShowSub(this.src,'spana$i')\">" : "<img src=img/b-arrow.gif>" )
		        ." <!a target=myFr href=ndex.php?action=listByFaculty&faculty=".$current_faculty[abbr].">".toCP($current_faculty[name])."</a></p>\n"
		       ."<span id=spana$i style='display:".(!($IsAdmin||$IsRector)?'inline':'none')."'>"
		       .$ret2
		       ."</span>";
		}
		}
	return $ret;
}

function MakeMenuForInsert()
	{
	global $IsAdmin;
	global $IsRector;
	global $IsFaculty;
	global $IsSubFaculty;
	global $Department;
	global $KafArray;


	$IsAdmin=true;
		
	$i=-1;
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');

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
				{
				if($KafArray[$C]==ereg_replace("-","",$current_faculty->subfaculty[$j]['abbr']))
					$Kaf=1;
				}
			$k=-1;
	
			$Correct=0;
			for($С=0;$С<count($KafArray);$С++)
				{
				if($IsSubFaculty&&(ereg_replace("-","",$current_faculty->subfaculty[$j]['abbr'])==$KafArray[$С])){$Correct=1;}
				}
			if($IsRector||$IsAdmin||$IsFaculty)$Correct=1;
			//
			if($Correct)
			{
				$ret2.= "<p class=menulevel2><img src=img/b-arrow.gif>"
				. "<a target=myFr href=nsert.php?action=listByGroup&group=".$current_faculty->subfaculty[$j]->group[$k]['abbr']."&spec_code=".$current_faculty->subfaculty[$j]->group[$k]['speciality_code']."&faculty=$current_faculty[abbr]&faculty_code=$current_faculty[uid]>"
				. $current_faculty->subfaculty[$j]['abbr']."</a></p>\n";
/*			$ret2 .= "<p class=menulevel2>"
			.($k?"<img src=img/".((!($IsAdmin||$IsRector))&&$Kaf?'b-minus.gif':'b-plus.gif')." class=pointer_img onclick=\"this.src=ShowSub(this.src,'span$i$j')\">":"<img src=img/b-arrow.gif>")
			//твоя ссылка
			." <!a target=myFr href=ndex.php?action=listByDepartment&department=".ereg_replace("-","",$current_faculty->subfaculty[$j][abbr]).">".$current_faculty->subfaculty[$j][abbr]."</a></p>\n";
			$ret2.="<span id=span$i$j style='display:".((!($IsAdmin||$IsRector))&&$Kaf?'inline':'none')."'>";
			$ret2.=$ret3;
			$ret2.="</span>"; */
			}
			}
		
		$ret .= "<p class=menulevel1>"
		        .( $j ? "<img src=img/".(!($IsAdmin||$IsRector)?'b-minus.gif':'b-plus.gif')." class=pointer_img onclick=\"this.src=ShowSub(this.src,'spana$i')\">" : "<img src=img/b-arrow.gif>" )
		        ." <!a target=myFr href=ndex.php?action=listByFaculty&faculty=".$current_faculty['abbr'].">".$current_faculty['abbr']."</a></p>\n"
		       ."<span id=spana$i style='display:".(!($IsAdmin||$IsRector)?'inline':'none')."'>"
		       .$ret2
		       ."</span>";
		}
		}
	return $ret;
}

function Pre(){
	print "<pre>";
	}
function CPre(){
	print "</pre>";
	}
function SelectGroup($action,$faculty,$department,$group)
	{
	$i=-1;
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');

	while(($current_faculty = $parsed->faculty[++$i]))
		{

		$j=-1;

		while($current_faculty->subfaculty[++$j][abbr])
			{
			$k=-1;
			//$options="";
			while($current_faculty->subfaculty[$j]->group[++$k][abbr])
				{
				if
				(
					($action=="listByFaculty" && $faculty==$current_faculty[abbr])
					||
					($action=="listByDepartment" && $department==ereg_replace("-","",$current_faculty->subfaculty[$j][abbr]))
					||
					($action=="listByGroup" && $group==$current_faculty->subfaculty[$j]->group[$k][abbr])
				)
						$options.= "<option group='".$current_faculty->subfaculty[$j]->group[$k][abbr]."'>".toCP($current_faculty->subfaculty[$j]->group[$k][abbr])."</option>\n";
				}
				


			}
		

		}
	$ret="<select name=group>".$options."</select>";
	return $ret;
	}

function SelectYear($ved_year)
	{
	$ret="<select name=ved_year onchange=\"document.SelYear.submit()\">\n";
	for($i=2004;$i<2021;$i++)
		{
		$ret.="<option value=$i". ($ved_year==$i?" selected":"") .">$i</option>\n";
		}
	$ret.="</select>";
	
	return $ret;
	}

function GetSpecCode($group)
	{
	$i=-1;
	$parsed = simplexml_load_file('http://localhost/emstu_structure/struct.xml');
	while(($current_faculty = $parsed->faculty[++$i]))
		{
		$j=-1;
		while($current_faculty->subfaculty[++$j][abbr])
			{
			$k=-1;
			while($current_faculty->subfaculty[$j]->group[++$k][abbr])
				{
				if($group == $current_faculty->subfaculty[$j]->group[$k][abbr])
					return $current_faculty->subfaculty[$j]->group[$k][speciality_code];
				}
			}
		}
	return "error";
	}
	
function SelectDisciplie($Disc)
	{
	for($i=0;$i<count($Disc);$i++)
		{
		if($Disc[$i]->test || $Disc[$i]->exam || $Disc[$i]->courseProject)
			$ret.="<option value='". $Disc[$i]->dis ."'>". ($Disc[$i]->courseProject?"Курсовой":($Disc[$i]->exam?"Экзамен":($Disc[$i]->test?"Зачёт":""))) .": ". toCP($Disc[$i]->disl) ."</option>\n";
		}
	return "<select name=discipline>\n".$ret."\n</select>";
	}
	
function MakeDisciplineArray($Disc, $group, $doctype=0)//создать массив дисциплин
	{
	global $dbconn;
	$group = toUTF($group);
	for($i=0;$i<count($Disc);$i++)
		{
		if($Disc[$i]->test || $Disc[$i]->exam || $Disc[$i]->courseProject)
			{
			$c=count($ret);
			//вычисляем состояние ведомости
			$sql = "SELECT * FROM exam_sheet LEFT JOIN exam_sheet_log ON exam_sheet.id = exam_sheet_log.exam_sheet WHERE faculty_shortname='". ExtractFaculty($group) ."' AND subfaculty_shortname='". ExtractDepartment($group) ."' AND group_number='". ExtractNumber($group) ."' AND group_term='". ExtractSem($group) ."' AND discipline_name='". $Disc[$i]->dis ."' AND doctype='$doctype'";
			$result = pg_query($dbconn, $sql );
			
			if($doctype == 0 && pg_numrows($result) > 1)
				{
				print "ОшибкаD целостности базы данных";
				}
			
			elseif(!pg_numrows($result))
				{
				$ret[$c][state]="нет";
				}
			else
				{
				$ved_tab=pg_fetch_array($result);
				$ret[$c][state] = $ved_tab[gived]?"выдана":"";
				$ret[$c][state] = $ved_tab[received]?"получена":$ret[$c][state];
				$ret[$c][state] = $ved_tab[closed]?"закрыта":$ret[$c][state];
				}
			//состояние
			
			$ret[$c][name] = toCP($Disc[$i]->dis);
			$ret[$c][nameFull] = toCP($Disc[$i]->disl);
			$ret[$c][type] = ($Disc[$i]->exam?'1':($Disc[$i]->courseProject?'3':($Disc[$i]->test?'2':"?")));
			$ret[$c][typeFull] = ($Disc[$i]->exam?'Экз':($Disc[$i]->courseProject?'Кур':($Disc[$i]->test?'Зач':"?")));
			$ret[$c][typeTitle] = ($Disc[$i]->exam?'Экзамен':($Disc[$i]->courseProject?'Курсовой':($Disc[$i]->test?'Зачёт':"?")));

			$ret[$c][audlek] = toCP($Disc[$i]->audlek);

			$ret[$c][department] = toCP($Disc[$i]->subfacultyOfDis);

			}
		}
	
	for($I=1;$I<count($ret);$I++)//сортировка по типам
		{
		for($J=count($ret)-1;$J>=$I;$J--)
			{
			if($ret[$J][type]>$ret[$J-1][type])
				{
				$Temp=$ret[$J-1];
				$ret[$J-1]=$ret[$J];
				$ret[$J]=$Temp;
				}
			}
		}
	return $ret;

	}


function SelectMark($studentid,$mark=-2,$type=1)
	{
	if($type==1 || $type==3)
		{
		$ret .= "<td><input type=radio name=mark_$studentid value='-1' ".($mark==-1?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='0' ".($mark==0?"checked":"").">";

		$ret .= "<td><input type=radio name=mark_$studentid value='-2' ".($mark==-2?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='1' ".($mark==1?"checked":"").">";
		$ret .= "<td style='border-right:solid 3px #CCCCCC;'><input type=radio name=mark_$studentid value='2' ".($mark==2?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='3' ".($mark==3?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='4' ".($mark==4?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='5' ".($mark==5?"checked":"").">";
		}
	else	{
		$ret .= "<td><input type=radio name=mark_$studentid value='-1' ".($mark==-1?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='0' ".($mark==0?"checked":"").">";

		$ret .= "<td><input type=radio name=mark_$studentid value='-2' ".($mark==-2?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='1' ".($mark==1?"checked":"").">";
		$ret .= "<td style='border-right:solid 3px #CCCCCC;'><input type=radio name=mark_$studentid value='2' ".($mark==2?"checked":"").">";
		$ret .= "<td><input type=radio name=mark_$studentid value='3' ".($mark==3?"checked":"").">";
		
		}
	
	return $ret;	
	}

function GenerateBody($group, $Student, $CurrentDisc, $Mark, $teacher_name, $teacher_name1, $teacher_name2, $FullNumber)
	{
		$body = "<?xml version='1.0' encoding='UTF-8' ?>
		<document type='ved' number='". $FullNumber ."' testtype='". toUTF($CurrentDisc[type]==1?'Экзаменационная':'Зачётная') ."' discipline='". toUTF($CurrentDisc[nameFull]) ."'>
		<prepod name1='". toUTF($teacher_name) ."' name2='". toUTF($teacher_name1) ."' name3='". toUTF($teacher_name2) ."'/>
		<students>
		";
		
		for($i=0;$i<count($Student);$i++)
			{
			$body .= "<student name='". ($Student[$i]->lastname ." ". $Student[$i]->firstname ." ". $Student[$i]->middlename) ."' mark='". ($Mark[$i]) ."' id='". $Student[$i]->id ."' zachetka='". $Student[$i]->{'personal-case-number'} ."'/>\n";
			}
		$body .= "</students>
		</document>";

	$body = ereg_replace("'",'"',$body);
	return $body;
	}

function GenerateNapr($name, $studentid, $valid_year, $valid_month, $valid_day, $group, $FullNumber, $teacher_name, $CurrentDisc, $mark, $date, $group, $att_kaf)
	{
		$dean = toUtf(GetDean(ExtractFaculty($group)));
		$chief = toUtf(GetChief(trim(str_replace("-","",$att_kaf))));
		$group=toUtf($group);
		$att_kaf=toUtf($att_kaf);
		$body = "<?xml version='1.0' encoding='UTF-8' ?>
		<document type='napr' student_name='". toUtf($name) ."' studentid='". $studentid ."' teacher_name='". toUtf($teacher_name) ."' number='". $FullNumber ."' testtype='". toUTF($CurrentDisc[type]==1?'экзамен':'зачёт') ."' discipline='". toUTF($CurrentDisc[nameFull]) ."' att_kaf='$att_kaf' valid='$valid_year-$valid_month-$valid_day' mark='".$mark."' date='".$date."' dean='$dean' chief='$chief' group='$group'/>";

	$body = ereg_replace("'",'"',$body);
	return $body;
	}

function GenerateVedNumber($group)
	{
		//выбираем максимальный номер ведомости за текущий факультет и текущий год
		global $dbconn;
		$sql = "SELECT * FROM exam_sheet WHERE faculty_shortname='". ExtractFaculty(toUTF($group)) ."' AND created>='". date('Y') ."-01-01' AND created<='". date('Y') ."-12-31'";	
		$result=pg_query($dbconn, $sql);
		while($ved_tab = pg_fetch_array($result))
			{
			if($ved_tab[number]>$VedNumber)
				$VedNumber = $ved_tab[number];
			}
		$VedNumber++;//добавляем к нему единцу, чтобы получить номер ведомости

	return $VedNumber;
	}

function GenerateFullNumber($group,$VedNumber)
	{
		$FullNumber = 100000+$VedNumber;
		$FullNumber = ltrim("$FullNumber",'1');
		$FullNumber = ExtractFaculty(toUTF($group)).date('y').$FullNumber;

	return $FullNumber;
	}

function SelectDate(){for($f=0;$f<func_num_args();$f++){$_[$f]=func_get_arg($f);}
		global $sitename;

	$days=array('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31');
	$month_c=array('01','02','03','04','05','06','07','08','09','10','11','12');
	$months=array('января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря');
	$years=array(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016);
	$ret = "<select name='$_[0]_day'>
	";
	for($i=0;$i<count($days);$i++){
	$value=$days[$i];
	$ret .= "<option value=$value ";
	if($days[$i] == $_[1]){$ret .= "selected";}
	$ret .= ">$days[$i]</option>
	";
	}
	$ret .= "</select>
	";
#-----------------------------------
	$ret .="<select name='$_[0]_month'>
	";
	for($i=0;$i<count($months);$i++){
	$value=$month_c[$i];
	$ret .= "<option value=$value ";
	if($month_c[$i] == $_[2]){$ret .= "selected";}
	$ret .= ">$months[$i]</option>
	";
	}
	$ret .= "</select>
	";
#-----------------------------------
	$ret .= "<select name='$_[0]_year'>
	";
	for($i=0;$i<count($years);$i++){
	$value=$years[$i];
	$ret .= "<option value=$value ";
	if($years[$i]==$_[3]){$ret .= "selected";}
	$ret .= ">$years[$i]</option>
	";
	}
	$ret .= "</select>
	";
return $ret;
}

?>
