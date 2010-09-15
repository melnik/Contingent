<?php

$file=fopen("/usr/store/spec.koi.csv","r");
if (!$file) echo "ERROR"; 
while (!feof($file))
{
	$buffer=fgets($file,4096);	
	//echo $buffer;
	$res=explode(";",$buffer);
	$num=count($res);
	($res[0]) ? $kaf=str_replace(" ","",$res[0]) : "" ;
	for($i=1;$i<$num;$i++)
		(fmod($i,2) && $res[$i]) ? print($kaf."-".$res[$i]." ") : print($res[$i]."\n");
}
fclose($file);	
?>
