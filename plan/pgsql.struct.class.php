<?php
/* йКЮЯЯ: pgsql
 * мЮГМЮВЕМХЕ: нАЕЯОЕВХБЮЕР ДНЯРСО Й ад PostgreSQL
 * 
 * бЕПЯХЪ: 0.2
 */
class pgsql {

	protected $connect;
	protected $result;
	protected $resultValues;
	
	/* йНМЯРПСЙРНП НАЗЕЙРЮ
	 * нРЙПШБЮЕР ЯНЕДХМЕМХЕ Я ад
	 * оЮПЮЛЕРПШ: ХЛЪ ОНКЭГНБЮРЕКЪ, ОЮПНКЭ, МЮГБЮМХЕ АЮГШ, УНЯР, ОНПР
	 */

	function __construct($user="alexey", $password="psql", $dbname="struct", $host="localhost", $port="5432") {
		$this->connect=pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$password."") 
			or die("мЕБНГЛНФМН СЯРЮМНБХРЭ ЯНЕДХМЕМХЕ Я АЮГНИ ДЮММШУ");
		pg_set_client_encoding($this->connect,"WIN1251");
	}

	/* дЕЯРПСЙРНП НАЗЕЙРЮ
	 * нЯБНАНФДЮЕР ОЮЛЪРЭ БШДЕКЕММСЧ ОНД ПЕГСКЭРЮР
	 * гЮЙПШБЮЕР ЯНЕДХМЕМХЕ Я ад
	 */

	function __destruct() {
		if ($this->result) pg_free_result($this->result);
//		if ($this->connect) pg_close($this->connect);
	}
	
	/* лЕРНД _query() БШОНКМЪЕР SQL ГЮОПНЯ
	 * оЮПЮЛЕРПШ: яРПНЙЮ SQL ГЮОПНЯЮ 
	 * бНГБПЮЫЮЕР ЯЯШКЙС МЮ ЛЮЯЯХБ Я ПЕГСКЭРЮРЮЛХ ГЮОПНЯЮ
	 */

	function _query($sql,$showerror=true) {
		$this->result=pg_query($this->connect, $sql);
		if (!$this->result) {
			if ($showerror) {
				print("мЕБНГЛНФМН БШОНКМХРЭ ГЮОПНЯ \"".$sql."\"");
				exit;
			}
			else 
				return 0;
		}
		return 1;
	}
	 
	/* лЕРНД _getResult() БНГБПЮЫЮЕР ЯЯШКЙС МЮ ЮЯЯНЖХЮРХБМШИ ЛЮЯЯХБ Я ПЕГСКЭРЮРЮЛХ ГЮОПНЯЮ
	 */
		
	function _getResult($showerror=true) {
		if ( ! $this->result) {
			if ($showerror) {
				print("пЕГСКЭРЮР ОСЯРНИ!");
				exit;
			}
			else
				return 0;
		}
		$this->resultValues=pg_fetch_row($this->result, NULL, PGSQL_ASSOC);

		return $this->resultValues;	
	}

	/* лЕРНД _getResult() БНГБПЮЫЮЕР ЯЯШКЙС МЮ ЮЯЯНЖХЮРХБМШИ ЛЮЯЯХБ Я ПЕГСКЭРЮРЮЛХ ГЮОПНЯЮ
	 */
		
	function _getResultArray($showerror=true, $mode=PGSQL_ASSOC) {
		if ( ! $this->result) {
			if ($showerror) {
				print("пЕГСКЭРЮР ОСЯРНИ!");
				exit;
			}
			else
				return 0;
		}
		$this->resultValues=pg_fetch_array($this->result, NULL, $mode);

		return $this->resultValues;	
	}

	/* лЕРНД _version() НРНАПЮФЮЕР БЕПЯХЧ ЙКХЕМРЯЙНИ ВЮЯРХ ад 
	 */

	function _version()
	{
		$ver = pg_version($this->connect);
		echo $ver['client'];
	}
}

?>