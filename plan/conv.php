<?php

function type($type) {

switch ($type) {

case 1: return "йо";
case 2: return "дг";
case 3: return "пй";
case 4: return "йп";

}

}

$f = fopen("./zdn.csv","r");

$srt="";
$arr="";
$end=0;
$dz=0;
$top=0;

if (!$f) {
 echo "error!!!";
 exit;
}

while ( !feof($f)) {

	$str = fgets($f);
//	echo $str;
	$arr = explode('|',$str,8);
	for ($i=0;$i<7;$i++)
	{
		$comm[$i] = $arr[$i];
	}
	$zd = explode(' ',$arr[$i]);
//		var_dump($zd);
//	var_dump($comm);
        $imp = implode('|',$comm);
//	echo "imp=$imp\n";
//	var_dump(count($zd));
	for ( $i = 0; $i < count($zd)-1; $i++) {
	  $zad=$zd[$i];
//	echo "\n";
//	var_dump($zad);
//	echo "\n";
	  $i++;
	  $count=0;
	  $numOfElm=$i;
	  $i++;
//	  var_dump(intval($zd[$numOfElm]));
	   do {
            echo $imp."|".type($zad)."|".$zd[$i]."\n";
	    ($zad=="2" || $zad=="1") ? $i+=3 : $i+=2;	
	    $count++;
//	    var_dump($count);
	   }  while( $count < intval($zd[$numOfElm]) );
	  $i--;
	// }
/*	 else {
          var_dump($zd[$i]);
          $i++;
           for($j=$i;$j<($i+intval($zd[$i]));$j=$j+2)
            echo "|".$zd[$j];
	 }
	$i+=$j;
*/	}
//	echo "\n";
	    
//	echo "\n".$res."\n";
//	var_dump($arr);
//	echo stripslashes($imp);
//	echo "\n";
}

fclose($f);

?>

