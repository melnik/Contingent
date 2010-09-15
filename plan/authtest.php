<?php
define("AUTH_SERVICE","http://localhost/auth_service/service/auth.wsdl");

	$Ulogin = "";
        $Upassw = "123";

        ini_set("soap.wsdl_cache_enabled", "0");
        $auth_client = new SoapClient( AUTH_SERVICE, array(trace=>0) );
        $auth_user = new stdClass();
        $auth_user->login = toUTF($Ulogin);
        $auth_user->password = toUTF($Upassw);
        $auth_user->dongle_id = $_SERVER[SSL_CLIENT_M_SERIAL] ? hexdec($_SERVER[SSL_CLIENT_M_SERIAL]) : null;
        $auth_user->service_id = 4;
        $user_tab = $auth_client->auth($auth_user);
        echo $Ulogin."-".$Upassw."\n";
        print_r($user_tab);
        echo "\n";
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
    return iconv("KOI8-R","UTF-8",$str);
    }
function toCP($str)
    {
    return iconv("UTF-8","KOI8-R",$str);
    }

?>
