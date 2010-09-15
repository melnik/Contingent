<?php
$con=mssql_pconnect("10.0.0.3","sa","Helen");
if (!$con) {
	echo "error connecting";
	exit;
}

?>