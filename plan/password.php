<?php
$f = fopen("pass.txt","w");
$i=-1;
$j=-1;
$count = 0;
$parsed = simplexml_load_file('struct.xml');
	while(($current_faculty = $parsed->faculty[++$i])) {
		while($current_faculty->subfaculty[++$j]['abbr']) {
			$name = str_replace("-","",translit(toKoi($current_faculty->subfaculty[$j]['abbr'])))."-plan"; 
			$pass = generatePassword();
			$fio = toKoi($current_faculty->subfaculty[$j]['chief']);
			if ($fio=='') $fio = 'нет';
			$subfac = toKoi($current_faculty->subfaculty[$j]['abbr']);
			echo "INSERT INTO au_user (fio, login, password) VALUES ('$fio', '$name', md5('$pass')); \n";
			echo "INSERT INTO au_user_role SELECT (id as user_id, 39 as role_id FROM au_user WHERE login = '$name' AND password = md5('$pass'));\n";
			echo "INSERT INTO au_user_parameter SELECT (id as user_id, 1 as parameter_id, '$subfac' as value FROM au_user WHERE login = '$name' AND password = md5('$pass'));\n";
			fwrite($f,$count++." | $name | $pass | $fio | $subfac\n");
		}
	$j=-1;
	}
fclose($f);

function toKoi($str) {
	return iconv("UTF-8","koi8-r",$str);
}

function translit($str) {
	$str = strtolower($str);
	$trans = '';
	$i=0;
	for ($i=0;$i<strlen($str);$i++) {
		switch ($str[$i]) {
		case 'а':$trans .= 'a'; break;
		case 'б':$trans .= 'b'; break;
		case 'в':$trans .= 'v'; break;
		case 'г':$trans .= 'g'; break;
		case 'д':$trans .= 'd'; break;
		case 'е':$trans .= 'ye'; break;
		case 'ё':$trans .= 'yo'; break;
		case 'ж':$trans .= 'zh'; break;
		case 'з':$trans .= 'z'; break;
		case 'и':$trans .= 'i'; break;
		case 'й':$trans .= 'i'; break;
		case 'к':$trans .= 'k'; break;
		case 'л':$trans .= 'l'; break;
		case 'м':$trans .= 'm'; break;
		case 'н':$trans .= 'n'; break;
		case 'о':$trans .= 'o'; break;
		case 'п':$trans .= 'p'; break;
		case 'р':$trans .= 'r'; break;
		case 'с':$trans .= 's'; break;
		case 'т':$trans .= 't'; break;
		case 'у':$trans .= 'u'; break;
		case 'ф':$trans .= 'f'; break;
		case 'х':$trans .= 'h'; break;
		case 'ц':$trans .= 'ts'; break;
		case 'ч':$trans .= 'ch'; break;
		case 'ш':$trans .= 'sh'; break;
		case 'щ':$trans .= 'sch'; break;
		case 'ъ':$trans .= ''; break;
		case 'ы':$trans .= 'i'; break;
		case 'ь':$trans .= ''; break;
		case 'э':$trans .= 'e'; break;
		case 'ю':$trans .= 'yu'; break;
		case 'я':$trans .= 'ya'; break;
		default: $trans .= $str[$i]; break;
		}
	}
	return $trans;
}

function generatePassword ($length = 8)
{

  // start with a blank password
  $password = "";

  // define possible characters
  $possible = "0123456789abcdfghjkmnpqrstvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
    
  // set up a counter
  $i = 0; 
    
  // add random characters to $password until $length is reached
  while ($i < $length) { 

    // pick a random character from the possible ones
    $char = substr($possible, mt_rand(0, strlen($possible)-1), 1);
        
    // we don't want this character if it's already in the password
    if (!strstr($password, $char)) { 
      $password .= $char;
      $i++;
    }

  }

  // done!
  return $password;

}
?>
