<?php
/* 
 * view.php - Справочник "Специальность" - пользовательский интерфейс
 */
require_once('html.view.php');

/*
 * Если методом GET переменной $degree не присвоино значение выбираем значение по умолчанию
 * 62 - бакалавр
 * 65 - инженер
 * 68 - магистр
 */
(!$_GET["degree"]) ? $_GET["degree"]=$degree="62" : $degree=$_GET["degree"]; 

/* 
 * Создаем экземпляк класса Html
 */

$html=new Html();

/* 
 * Выводим "шапку" страницы
 */

$html->Head("Справочник направлений и специальностей");

$i=0;

/* 
 * Выводим заколовок таблицы
 */

echo "<table width='100%' class='direction'>\n";
         echo "<tr><th rowspan=2>\n";
         echo "N\n";
         echo "</th><th rowspan=2>\n";
         echo "Код (ОКСО)\n";
         echo "</th><th rowspan=2>\n";
			 ($degree==62) ? print( "Наименование направления\n" ): "" ;
			 ($degree==65) ? print( "Наименование специальности\n" ): "" ;
			 ($degree==68) ? print( "Наименование направления\n" ): "" ;
			if ($degree!=62) {         
         echo "</th><th colspan=2>\n";
	($degree==68) ? print( "Магистрская программа\n" ): print("Специализация\n");
         }
         echo "</th><th colspan=2>\n";
         echo "Квалификация\n";
         echo "</th></tr>\n";
         echo "<tr><th>\n";
         echo "Код\n";
         echo "</th><th>\n";
         echo "Наименование\n";
			if ($degree!=62) {         
         echo "</th><th>\n";
         echo "Код\n";
         echo "</th><th>\n";
         echo "Наименование\n";
         }
         echo "</th></tr>\n";

/* 
 * Открываем XML файм
 * Результат вызова функции simplexml_load_file - ассоциативный массив $xml
 */

$xml = simplexml_load_file('direction.new.xml');
//$xml = simplexml_load_file('http://localhost/direction/xml/direction.xml');
foreach ($xml->speciality as $speciality)
{
	$rowspan=count($speciality->spec);
	
/* 
 * "Расскрашиваем" данные в таблице через строчку: 
 * бакалавр - зеленый/светло-зеленый
 * специалист - синий/светло-синий
 * магистр - желтый/светло-желтый
 */
			if ($i%2)
			{
			 ($speciality->qual==62) ? $style="g_td" : "" ;
			 ($speciality->qual==65) ? $style="b_td" : "" ;
			 ($speciality->qual==68) ? $style="y_td" : "" ;
			}
			else
			{
			 ($speciality->qual==62) ? $style="lg_td" : "" ;
			 ($speciality->qual==65) ? $style="lb_td" : "" ;
			 ($speciality->qual==68) ? $style="ly_td" : "" ;
			}
	if ( $speciality->qual==$degree ) {
  echo "<tr>\n";
  echo "<td class='".$style."' rowspan='".$rowspan."'>".($i+1)."</td>\n";
  echo "<td class='".$style."' rowspan='".$rowspan."' 
  			onClick='
  			window.opener.window.element(\"spec\").value=\"".$speciality->index."00".$speciality->qual."\";
	 		window.close();
  		  '>".$speciality->index."</td>\n";
/* 
 * Перекодируем название специальности из utf8 в koi8-r
 */
  	echo "<td class='".$style."_left' rowspan='".$rowspan."'>" .iconv("utf-8","utf-8",$speciality->title)."</td>\n";
if ($degree!=62) {
//	echo "</tr><tr>";
	$spec=$speciality->spec;
	echo "<td class='".$style."' 
  			onClick='
	 		window.opener.window.element(\"spec\").value=\"".$speciality->index.iconv("utf-8","utf-8",$spec[0]->index).$speciality->qual."\";
	 		window.close();
	'>".iconv("utf-8","utf-8",$spec[0]->index)."</td>\n";
	echo "<td class='".$style."_left' 
  			onClick='
	 		window.opener.window.element(\"spec\").value=\"".$speciality->index.iconv("utf-8","utf-8",$spec[0]->index).$speciality->qual."\";
	 		window.close();
			'>".iconv("utf-8","r",$spec[0]->title)."</td>\n";
//	echo "<td class='".$style."_left'>".iconv("utf-8","utf-8",$spec[0]->title)."</td>\n";
	
}
  echo "<td class='".$style."' rowspan='".$rowspan."'>".$speciality->qual."</td>\n";
  echo "<td class='".$style."_left' rowspan='".$rowspan."'>".iconv("utf-8","utf-8",$speciality->qual_title)."</td>\n";
  echo "</tr>\n";
  $i++;
  $cnt=$rowspan;
  while ($cnt>1) {
	echo "<tr>";
	echo "<td class='".$style."' 
  			onClick='
	 		window.opener.window.element(\"spec\").value=\"".$speciality->index.iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index).$speciality->qual."\"
	 		window.close();
	'>".iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index)."</td>\n";
	echo "<td class='".$style."_left' 
  			onClick='
	 		window.opener.window.element(\"spec\").value=\"".$speciality->index.iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index).$speciality->qual."\";
	 		window.close();
			'>".iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->title)."</td>\n";
//	echo "<td class='".$style."' onClick='alert(\"".$speciality->index.iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index).$speciality->qual."\")'>".iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index)."</td>\n"
//	echo "<td class='".$style."_left' onClick='alert(\"".$speciality->index.iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->index).$speciality->qual."\")'>".iconv("utf-8","utf-8",$spec[$rowspan-$cnt+1]->title)."</td>\n";
	echo "</tr>";
	$cnt--;	
	}
//  $index_old=$speciality->index;
  	}
}

echo "</table>\n";

/* 
 * Выводим "хвост" страницы
 */

$html->Ending();
?>
