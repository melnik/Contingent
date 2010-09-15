<?php

$file=fopen("spec.csv","r");
if (!$file) echo "ERROR";
while (!feof($file))
{
        $buffer=fgets($file,4096);
        //echo $buffer;
        $res=explode(" ",$buffer);
        $num=count($res);
        for($i=0;$i<$num;$i++)
	echo "INSERT INTO gr_sp_conv VALUES ('".$res[$i]."','".str_replace("\n","",$res[++$i])."');\n";
}
fclose($file);
?>

