<?php
require_once('html.class.php');

$doc = new html("Вход в систему");
$doc->_form("login","index.php","post");
$doc->_table();
        $doc->_tr();
                $doc->_td();
                        echo "Имя";
                $doc->_utd();
                $doc->_td();
                        echo $doc->_inputText("name",25,25);
                $doc->_utd();
        $doc->_utr();
        $doc->_tr();
                $doc->_td();
                        echo "Пароль";
                $doc->_utd();
                $doc->_td();
                        echo $doc->_inputPassword("password",25,25);
                $doc->_utd();
        $doc->_utr();
$doc->_utable();
$doc->_uform("Войти");

?>

