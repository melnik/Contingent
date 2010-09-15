<?
$ReadingKaf="";
if($action=="exit")
	{
	$r_a = $real_action;
	foreach($_SESSION as $name => $value)
		{
		unset($_SESSION[$name]);
		unset($$name);
		}
	header( "Location:". $return_action."" );
	die();
	}
$Error = "";
$Ulogin = $_SESSION["Ulogin"];
$Upassw = $_SESSION["Upassw"];
function sd($str)
	{
	$str = stripslashes(trim($str));
	$search = array("'&'","'\''","'`'","'\"'","'<'","'>'");
	$replace = array("&amp;","&#039;","&#039;","&quot;","&lt;","&gt;");
	$str = preg_replace($search,$replace,$str);	
	return $str;
	}

if((isset($_POST["Send"]) && $_POST["Ulogin"]!="" && $_POST["Upassw"]!="") || ($_SERVER['SSL_CLIENT_M_SERIAL'] && !($_SESSION['UserFio'])))
	{
	$_POST['Send'] = '1';
	foreach($_SESSION as $name => $value)
		{
		unset($_SESSION[$name]);
		unset($$name);
		}
	$Ulogin = sd($_POST["Ulogin"]);
	$Upassw = sd($_POST["Upassw"]);
	
	ini_set("soap.wsdl_cache_enabled", "0");
	$auth_client = new SoapClient( AUTH_SERVICE, array(trace=>1) );
	$auth_user = new stdClass();
	$auth_user->login = toUTF($Ulogin);
	$auth_user->password = toUTF($Upassw);
	$auth_user->dongle_id = $_SERVER[SSL_CLIENT_M_SERIAL] ? hexdec($_SERVER[SSL_CLIENT_M_SERIAL]) : null;
	$auth_user->service_id = 4;
	try
		{
		$user_tab = $auth_client->auth($auth_user);
		}
	catch(Exception $e)
		{
		printr($e);
		printr($auth_client->__getLastResponse());
		die;
		return false;
		}
	}

if( !( ($user_tab->login && $user_tab->id && $user_tab->fio) || ($_SESSION['UserFio']) ) )// МЕ ЮБРНПХГНБЮКЯЪ
	{
	if(isset($_POST["Send"])) $Error = "<span style='color:red;'>мЕБЕПМНЕ ХЛЪ ОНКЭГНБЮРЕКЪ/ОЮПНКЭ. </span>";
	$auth_message = "<form method=post>".
	"<input type=hidden name=real_action value='".($_SERVER[REQUEST_URI])."'>".
		"<table class=table_auth align=right>".
			"<tr>".
				"<td>".$Error."</td>".
				"<td>кНЦХМ</td>".
				"<td><input type=text name='Ulogin' class=inp_text></td>".
				"<td>&nbsp;&nbsp;&nbsp;оЮПНКЭ</td>".
				"<td><input type=password name='Upassw' class=inp_text></td>".
				"<td><input type=submit value=бНИРХ class=inp_submit name=Send></td>".
			"</tr>".
		"</table>".
	"</form>";
	}
elseif( isset($_POST["Send"]) )
	{
	session_register('Ulogin', 'Upassw');
	$attributes=$user_tab->attribute->Map;
	$j=0;
	if(is_object($attributes))
		{
		if($attributes->item->key==iconv("CP1251","UTF-8","йЮТЕДПЮ"))
			{
			$ReadingKaf=$attributes->item->value;
			$KafArray[$j++]=toCP($ReadingKaf);
			}
		}
	elseif(is_array($attributes))
		{
		for($i=0;$i<count($attributes);$i++)
			{
			if($attributes[$i]->item->key==iconv("CP1251","UTF-8","йЮТЕДПЮ"))
				{
				$ReadingKaf=$attributes[$i]->item->value;
				$KafArray[$j++]=toCP($ReadingKaf);
				}
			}
		}
	$roles=$user_tab->role->string;
	
	$IsFaculty = $IsSubFaculty = $IsEdit = $IsStudentCard = $IsAdmin = 0;
	foreach( (array)$roles as $role )
		{
		if( $role == toUTF('юДЛХМХЯРПЮРНП'))
			$IsAdmin = 1;
		if( $role == toUTF('StudentCard'))
			$IsStudentCard = 1;
		if( $role == toUTF('edit'))
			$IsEdit = 1;
		if( $role == toUTF('тЮЙСКЭРЕР'))
			$IsFaculty = 1;
		if( $role == toUTF('йЮТЕДПЮ'))
			$IsSubFaculty = 1;
		if ( $role == toUTF('яРПСЙРСПЮ'))
			$IsStructure = 1;
		}
	$UserFio = toCP($user_tab->fio);
	$Department=$user_tab->department;
	$DepartmentName=toCP($user_tab->department_name);
	session_register('IsFaculty', 'IsSubFaculty', 'IsEdit', 'IsStudentCard', 'IsAdmin', 'KafArray', 'ReadingKaf', 'UserFio', 'Department', 'DepartmentName', 'IsStructure');
	if(isset($_POST["Send"]))header("Location: ".$_SERVER['REQUEST_URI']);
	die;
	}
elseif($_SESSION['UserFio'])
	{
	$auth_message = "<form method=post action=".$_SERVER[PHP_SELF].">".
	"<input type=hidden name=return_action value='".($_SERVER[REQUEST_URI])."'>".
	"<input type=hidden name=action value='exit'>".
		"<table class=table_auth align=right>".
			"<tr>".
				"<td>бШ ЮБРНПХГНБЮМШ ЙЮЙ <b>".$_SESSION['UserFio']."</b></td>".
				"<td><input type=submit value=бШИРХ class=inp_submit name=Send></td>".
			"</tr>".
		"</table>".
	"</form>";
	}
?>