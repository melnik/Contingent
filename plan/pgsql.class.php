<?php
/* Класс: pgsql
 * Назначение: Обеспечивает доступ к БД PostgreSQL
 * 
 * Версия: 0.2
 */
class pgsql {

	protected $connect;
	protected $result;
	protected $resultValues;
	
	/* Конструктор объекта
	 * Открывает соединение с БД
	 * Параметры: имя пользователя, пароль, название базы, хост, порт
	 */

	function __construct($user="alexey", $password="", $dbname="plan", $host="localhost", $port="5432") {
		$this->connect=pg_connect("host=".$host." port=".$port." dbname=".$dbname." user=".$user." password=".$password."") 
			or die("Невозможно установить соединение с базой данных");
	}

	/* Деструктор объекта
	 * Освобождает память выделенную под результат
	 * Закрывает соединение с БД
	 */

	function __destruct()
    {
		if ($this->result) pg_free_result($this->result);
//		if ($this->connect) pg_close($this->connect);
	}
	
	/* Метод _query() выполняет SQL запрос
	 * Параметры: Строка SQL запроса 
	 * Возвращает ссылку на массив с результатами запроса
	 */

	function _query($sql,$showerror=true)
    {
		$this->result=pg_query($this->connect, $sql);
		if (!$this->result)
        {
			if ($showerror)
            {
				print("Невозможно выполнить запрос \"".$sql."\"");
				exit;
			}
			else 
				return 0;
		}
		return 1;
	}
	 
	/* Метод _getResult() возвращает ссылку на ассоциативный массив с результатами запроса
	 */
		
	function _getResult($showerror=true) {
		if ( ! $this->result) {
			if ($showerror) {
				print("Результат пустой!");
				exit;
			}
			else
				return 0;
		}
		$this->resultValues=pg_fetch_row($this->result, NULL, PGSQL_ASSOC);

		return $this->resultValues;	
	}

	/* Метод _getResult() возвращает ссылку на ассоциативный массив с результатами запроса
	 */
		
	function _getResultArray($showerror=true, $mode=PGSQL_ASSOC) {
		if ( ! $this->result) {
			if ($showerror) {
				print("Результат пустой!");
				exit;
			}
			else
				return 0;
		}
		$this->resultValues=pg_fetch_array($this->result, NULL, $mode);

		return $this->resultValues;	
	}

	/* Метод _getResultAll() возвращает ссылку на ассоциативный массив с результатами запроса
	 */
		
	function _getResultAll($showerror=true) {
		if ( ! $this->result) {
			if ($showerror) {
				print("Результат пустой!");
				exit;
			}
			else
				return 0;
		}
		$this->resultValues=pg_fetch_all($this->result);

		return $this->resultValues;	
	}

	/* Метод _version() отображает версию клиентской части БД 
	 */

	function _version()
	{
		$ver = pg_version($this->connect);
		echo $ver['client'];
	}
}

?>
