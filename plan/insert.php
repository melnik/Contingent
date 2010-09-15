<?php
require_once('pgsql.class.php');
/*$pg = new pgsql("alexey","asd123","speciality");
$pg->_version();
$pg->_query("SELECT * FROM speciality");
while ($res=$pg->_getResult() ) var_dump($res);
*/


// Connecting, selecting database
$link = mysql_connect('localhost', 'root', '')
    or die('Could not connect: ' . mysql_error());
echo 'Connected successfully';
mysql_query("SET CHARACTER SET 'koi8r'", $link);
mysql_select_db('emstu_structure') or die('Could not select database');

// Performing SQL query
$query = 'SELECT id,code,name FROM ms_speciality';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());
$val="";
$pg = new pgsql("alexey","asd123","plan");
$pg->_version();
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    foreach ($line as $col_value) {
        echo "$col_value ";
        $val=$val."'$col_value',";
    }
   $pg->_query("INSERT INTO speciality VALUES (".substr($val,0,strlen($val)-1).")");
    echo "\n";
    echo substr($val,0,strlen($val)-1);
    $val="";
}
// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);

//while ($res=$pg->_getResult() ) var_dump($res);


?>