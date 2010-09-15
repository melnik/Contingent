<?php
$ret = "";
/*
$_GET["action"]="group";
$_GET["index"]="0402010065";
$_GET["semester"]="1";
$_GET["lang_first"]="3";
$_GET["lang_second"]="32";
*/
	switch($_GET["action"]) {
	
	case "speciality":
		$data = "speciality.xml";
		$rs = simplexml_load_file($data);
		$exp="//speciality[concat(@speciality_index, @direction_index, @qualification_index ) = '".$_GET["index"]."']";
		$result = $rs->xpath($exp);
		$ret .= $result[0]["speciality_title"];
		$ret .= ($result[0]["direction_index"]!='00')?" (".$result[0]["direction_title"].")":"";
		$ret .= "<br>";
		
		$data = "struct.xml";
		$rs = simplexml_load_file($data);
		$exp = "//group[@speciality_code='".$_GET["index"]."' and @semester='".$_GET["semester"]."' and @lang_first='".$_GET["lang_first"]."' and @lang_second='".$_GET["lang_second"]."']";
//		echo $exp;
		foreach ($rs->xpath($exp) as $result) { 
			$gr .= $result["abbr"]." ";
			$count++;
		}
		echo trim($ret);
//		echo trim($ret).(($count==1)?"Группа: ":"Группы: ").trim($gr);
		break;
		
	case "lang":
		$data = "lang.xml";
		$rs = simplexml_load_file($data);
		$exp = "//lang[@index='".$_GET["index"]."']";
		$result = $rs->xpath($exp);
		$ret .= $result[0]["title"];
		echo $ret;
		break;
		
	case "subfaculty":
		$data = "struct.xml";
		$rs = simplexml_load_file($data);
		$exp = "//subfaculty[@abbr='".iconv("utf-8","utf-8",$_GET["index"])."']";
//		echo $exp;
		$result = $rs->xpath($exp);
//		print_r($result);
		$ret .= $result[0]["name"];
		echo $ret;
		break;
		
	case "group":
		$count=0;
		$data = "struct.xml";
		$rs = simplexml_load_file($data);
		$exp = "//subfaculty[@abbr='".$_GET["subfac"]."']/group[@speciality_code='".$_GET["index"]."' and @semester='".$_GET["semester"]."' and @lang_first='".$_GET["lang_first"]."' and @lang_second='".$_GET["lang_second"]."']";
//		echo $exp;
		foreach ($rs->xpath($exp) as $result) { 
			$ret .= $result["abbr"]." ";
			$count++;
		}
		echo $ret;
//		echo trim($ret);
		break;
		
	}
?>
