<?php
define( CONNECT_HOST, 'localhost' );
define( CONNECT_PORT, '' );
define( CONNECT_SOCKET, '' );
define( CONNECT_LOGIN, 'root' );
define( CONNECT_PASSWORD, '' );
define( CONNECT_DB, 'emstu_structure' );

define( BASE_URL, 'http://localhost/emstu_structure/');
/*
$connection_string="host=".CONNECT_HOST." user=".CONNECT_LOGIN." password=".CONNECT_PASSWORD." dbname=".CONNECT_DB."";
@$db=pg_connect($connection_string);
*/
@$connect = mysql_connect(CONNECT_HOST.":".CONNECT_PORT.CONNECT_SOCKET,
							CONNECT_LOGIN,
							CONNECT_PASSWORD
						 );

if($connect) $db = mysql_select_db( CONNECT_DB, $connect );
if( !$connect || !$db )

if( !$db )
  {
	Header('Location: error_simple.phtml');
  }


mysql_query("SET CHARACTER SET 'koi8r'", $connect);

// Performing SQL query
$query = "SELECT (SELECT UUID()) AS id, subfaculty_id, abbr, speciality_id, count, speciality_index, speciality_title FROM ms_group WHERE abbr LIKE '%-6%'";
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    echo "INSERT INTO ms_group VALUES (";
    foreach ($line as $col_value)
	echo "'".preg_replace('%-6%','-16',$col_value."',");
    echo ");\n";
}

// Free resultset
mysql_free_result($result);



unset($db);
?>
