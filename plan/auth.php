<?php

define("AUTH_SERVICE","http://localhost/auth_service/service/auth.wsdl");
$j=0;
$Error = "";
$Ulogin = $_SESSION["Ulogin"];
$Upassw = $_SESSION["Upassw"];

if ($_POST["name"] && $_POST["password"])
{
	$Ulogin = sd($_POST["name"]);
	$Upassw = sd($_POST["password"]);
	
	ini_set("soap.wsdl_cache_enabled", "0");
	$auth_client = new SoapClient( AUTH_SERVICE, array(trace=>0) );
	$auth_user = new stdClass();
	$auth_user->login = toUTF($Ulogin);
	$auth_user->password = toUTF($Upassw);
	$auth_user->dongle_id = $_SERVER[SSL_CLIENT_M_SERIAL] ? hexdec($_SERVER[SSL_CLIENT_M_SERIAL]) : null;
	$auth_user->service_id = 4;
	$user_tab = $auth_client->auth($auth_user);
//	echo $Ulogin."-".$Upassw."<br>";
//	print_r($user_tab);
//	echo "<br>";
if( isset($_POST["Send"]) && $user_tab->login)
	{
	if (!$_SESSION) session_start();
	session_register('Ulogin', 'Upassw');
	$attributes=$user_tab->attribute->Map;
	$j=0;
	if(is_object($attributes))
		{
		if($attributes->item->key==iconv("UTF-8","UTF-8","Кафедра"))
			{
			$ReadingKaf=$attributes->item->value;
			$KafArray[$j++]=toCP($ReadingKaf);
			}
		}
	elseif(is_array($attributes))
		{
		for($i=0;$i<count($attributes);$i++)
			{
			if($attributes[$i]->item->key==iconv("utf-8","UTF-8","Кафедра"))
				{
				$ReadingKaf=$attributes[$i]->item->value;
				$KafArray[$j++]=toCP($ReadingKaf);
				}
			}
		}
	$roles=$user_tab->role->string;
//	echo "reoles - "; 
//	var_dump($roles);
	$IsSubFaculty = $IsAdmin = 0;
	foreach( (array)$roles as $r )
		{
		if( $r == toUTF('PlanAdmin')) {
			$IsAdmin = 1;
			$role="admin";
		}
/*		if( $r == toUTF('Кафедра')) {
			$IsSubFaculty = 1;
			$role="annotation";
			}
*/		if( $r == toUTF('Зав. кафедрой')) {
			$IsSubFaculty = 1;
			$role="subfaculty";
			}
		}
	$UserFio = toCP($user_tab->fio);
	$Department=$user_tab->department;
	$name=$user_tab->login;
//	$name=$Ulogin;
	$attr=$KafArray[0];
//	($isSubfaculty == 't' ) ? $role='annotation' : "";
	session_register('IsSubFaculty', 'IsAdmin', 'KafArray', 'ReadingKaf', 'UserFio', 'Department', 'name', 'attr', 'role');
//	echo "test - ".$name;
	}

	//		( $rez['issubfaculty'] == 't' ) ? $_SESSION['role']='subfaculty' : "";
	//		( $rez['isfaculty'] == 't' ) ? $_SESSION['role']='faculty' : "";
	//		( $rez['isrector'] == 't' ) ? $_SESSION['role']='rector' : "";
	//		( $rez['isadmin'] == 't' ) ? $_SESSION['role']='admin' : "";
//print_r($_SESSION);
//echo '111'.$role.$name;
}
function auth($level=1) {
//	return 1;
	if ($_SESSION['name']) {
		switch ($_SESSION['role']) {
			case "admin": // auth(1)
				if ($level==1) return 1;
				else return 0 ;
				break;
			case "rector": // auth(2)
				if ($level==2) return 1;
				else return 0 ;
				break;
			case "faculty": // auth(4)
				if ( $_GET['subfaculty']==$_SESSION['attr'] && $level==4) 
					return 1;
				else
					return 0; break;
			case "subfaculty": // auth(8)
				if ( $_GET['subfaculty']==$_SESSION['attr'] && $level == 8)
					return 1;
				else
					return 0; break;
			case "annotation": // auth(16)
				if ( $_GET['subfaculty']==$_SESSION['attr'] && $level == 16)  
					return 1;
				else 
					return 0; break;
		}
	}
	else
		return 0;
}

function isSubfaculty() {
	if ($_SESSION['role']=="subfaculty") 
		return 1;
	return 0;
} 

function isAnnotation() {
	if ($_SESSION['role']=="annotation") 
		return 1;
	return 0;
} 

function isFaculty() {
	if ($_SESSION['role']=="faculty") 
		return 1;
	return 0;
} 

function isRector() {
	if ($_SESSION['role']=="rector") 
		return 1;
	return 0;
} 

function isAdmin() {
	if ($_SESSION['role']=="admin") 
		return 1;
	return 0;
} 

function isSignedProgram($id) {
	$pg = new pgsql();
	$pg->_query("SELECT * FROM prog_status WHERE program_id = '$id'");
	$rez = $pg->_getResult();
	if ($rez["subfaculty"]) return 8;
	if ($rez["admin"]) return 1;
	return 0;
}

function comparePrograms($id, $pid) {
	if ($id == '00000000-0000-0000-0000-000000000000' || $pid == '00000000-0000-0000-0000-000000000000') return 1000;
	$count=0;
	$ret = 0;
	$pg = new pgsql();
	$pg->_query("SELECT DISTINCT discipline_titleshort, discipline_title, subfaculty, discipline_code FROM dis  WHERE discipline_id IN (SELECT discipline_id FROM prog WHERE program_id = '$id' OR  program_id = '$pid')");
	while ($rez = $pg->_getResult()) 
		$count++;
	if ($count != 1) {
	$ret+=1;
	}
	$count=0;
	$pg->_query("SELECT DISTINCT semester, weeks, lectures, seminars, labs, labscount, individual, zach, difzach, exam, subfaculty_for, speciality_for, seminarscount FROM prog WHERE program_id = '$id' OR  program_id = '$pid'");
	while ($rez = $pg->_getResult()) 
		$count++;
	if ($count != 1) {
	$ret+=10;
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
	$ret+=100;
	}
	return $ret;
}

function sd($str)
	{
	$str = stripslashes(trim($str));
	$search = array("'&'","'\''","'`'","'\"'","'<'","'>'");
	$replace = array("&amp;","&#039;","&#039;","&quot;","&lt;","&gt;");
	$str = preg_replace($search,$replace,$str);	
	return $str;
	}

function toUTF($str) 
    { 
    return iconv("UTF-8","UTF-8",$str); 
    } 
function toCP($str) 
    { 
    return iconv("UTF-8","UTF-8",$str); 
    }
?>
