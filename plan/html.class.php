<?php
/* Класс: html
 * Назначение: Обеспечивает формирование HTML документа
 * 
 * Версия: 0.1
 */
if( !isset($_SESSION) && $_GET["action"]!='prog' && $_GET["action"]!='otr' && $_GET["action"]!='zap' && !$_GET["target"] ) {
	session_start();
}
	global $reference,$reference_xpath;
			// Загружаем справочники
			$reference = new DOMDocument('1.0', 'UTF-8');
			$reference->appendChild($reference->createElement('content'));
			
			//Структура
			$structure = new DOMDocument('1.0', 'UTF-8');
			$rez = $structure->load('struct.xml');
			if (!$rez) echo "Не возможно подключить справочник \"Структура университета\"";
			$node=$reference->importNode($structure->getElementsByTagName("structure")->item(0), true);
			$reference->documentElement->appendChild($node);
			
			//Специальности
			$structure = new DOMDocument('1.0', 'UTF-8');
			$rez = $structure->load('speciality.xml');
			if (!$rez) echo "Не возможно подключить справочник специальностей";
			
			$node=$reference->importNode($structure->getElementsByTagName("specialities")->item(0), true);
			$reference->documentElement->appendChild($node);
			
			//Языки
			$structure = new DOMDocument('1.0', 'UTF-8');
			$rez = $structure->load('lang.xml');
			if (!$rez) echo "Не возможно подключить справочник языков";
			
			$node=$reference->importNode($structure->getElementsByTagName("languages")->item(0), true);
			$reference->documentElement->appendChild($node);
			
			$reference_xpath = new DOMXPath($reference);
			
class html {
	
	function __construct($title="HTML документ", $enc="UTF-8", $style="css/style.css") {
	echo "<html>\n";	
	echo "<head>\n";
	echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=".$enc."\" />\n";
	echo "<meta http-equiv=\"Content-Language\" content=\"ru\" />\n";
	echo "<meta http-equiv=\"Cache-Control\" content=\"no-cache\">";
	echo "<title>".$title."</title>\n";
	echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"".$style."\">\n";
	echo "<script type=\"text/javascript\" src=\"./jquery-1.3.2.min.js\"></script>\n";
	echo "<script type=\"text/javascript\" src=\"./jquery-ui-1.7.2.custom.min.js\"></script>\n";
	echo "<script type=\"text/javascript\" src=\"./wtooltip.min.js\"></script>\n";
	echo "<script type=\"text/javascript\" src=\"./ajax.js\"></script>\n";
	echo "<script type=\"text/javascript\" src=\"./common.js\"></script>\n";
	echo "<script type=\"text/javascript\" src=\"./control.js?action=".$_GET["action"]."&subfaculty=".$_GET["subfaculty"]."&id=".$_GET["program"]."\"></script>\n";
	echo "</head>\n";
//	echo "<body>\n";
	}

	function __destruct() {
	echo "</body>\n</html>\n";
	}

	public function _table($style="", $id="", $mode="align='center'") {
		echo "\t<table";
		$id ? print(" id='".$id."'") : "";
		$style ? print(" style='".$style."'") : "";
		$mode ? print(" $mode") : "";
		echo ">\n";
	}	

	public function _utable() {
		echo "\t";		
		echo "</table>\n";
	}	

	public function _td($style="", $id="", $mode="") {
		echo "\t\t\t";		
		echo "<td";
		$mode ? print(" $mode") : "";
		$id ? print(" id='".$id."'") : "";
		$style ? print(" class='".$style."'") : "";
		echo ">";
	}

	public function _utd() {
		echo "</td>\n";
	}

	public function _th($cont, $style="", $id="", $mode="") {
		echo "\t\t\t";		
		echo "<th";
		$mode ? print(" $mode") : "";
		$id ? print(" id='".$id."'") : "";
		$style ? print(" style='".$style."'") : "";
		echo ">";
		echo $cont;
		$this->_uth();
	}

	public function _uth() {
		echo "</th>\n";
	}

	public function _tr($class="", $id="", $mode="") {
		echo "\t\t";		
		echo "<tr";
		$id ? print(" id=".$id."") : "";
		$class ? print(" class=".$class."") : "";
		$mode ? print(" $mode") : "";
		echo ">\n";
	}
	
	public function _utr() {
		echo "\t\t";		
		echo "</tr>\n";
	}

	public function _div($id="", $style="") {
		echo "\t\t";		
		echo "<div";
		$id ? print(" id='".$id."'") : "";
		$style ? print(" style='".$style."'") : "";
		echo ">\n";
	}

	public function _udiv() {
		echo "\t\t";		
		echo "</div>\n";
	}
	
	public function _cdiv($content="", $id="", $style="") {
		$this->_div($id, $style);
		echo "\t\t".$content;
		$this->_udiv(); 
	}

	public function _select($name="select", $size="1", $value="", $title="", $mode="") {
		$option="<select name='$name' size='$size' $mode>\n";
			for ($i=0;$i<count($value);$i++)
				$option.="<option value='$value[$i]'>$title[$i]</option>\n";
		$option.="</select>\n";
		return $option;
	}

	public function _form($name, $action, $method="get", $jaction="", $enctype="application/x-www-form-urlencoded") {
		echo "\t";
		echo "<form name='$name' action='$action' method='$method' enctype='$enctype' $jaction>\n";
	}
	
	public function _uform($btitle="Продолжить", $type="submit", $action="") {
		echo "\n<br>\t";
		$this->_table();
			$this->_tr();
				$this->_td();
					$this->_fbutton($btitle, $type, $action);
				$this->_utd();
			$this->_utr();		
		$this->_utable();
		echo "\t";
		echo "</form>\n"; 
	}

	public function _inputText($name="text", $size="20", $max="20", $value="", $mode="") {
		return "<input type='text' name='$name' id='$name' size='$size' maxlength='$max' align='$align' value='$value' $mode>\n";
	}	

	public function _inputTextRO($name="text", $size="2", $max="2", $value="") {
		return "<input type='text' name='$name' id='$name' size='$size' maxlength='$max' value='$value' readonly>\n";
	}	

	public function _inputHidden($name="hidden", $value="") {
		return "<input type='hidden' name='$name' id='$name' value='$value'>\n";
	}
	
	public function _inputPassword($name="password", $size="20", $max="20", $value="", $mode="") {
		return "<input type='password' name='$name' id='$name' size='$size' maxlength='$max' align='$align' value='$value' $mode>\n";
        }

	public function _radio($name="radio", $value="") {
		return "<input type='radio' name='$name' id='$name' value='$value'>\n";
	}	 

	public function _submit($title="Продолжить", $action="") {	
		echo "<input type='submit' value='$title' name='Send' $action>\n";
	}

	public function _fbutton($title="Продолжить", $type="submit", $action="") {	
		echo "<input type='$type' value='$title' name='Send' $action>\n";
	}

	public function _cText($action="view", $name="text", $value="text", $default="", $size="80", $max="20", $align="right", $mode="", $bold=0, $style='') {
		($action=="add") ? $this->_ctd( $this->_inputText($name,$size,$max,$default,$mode) ): "";
		($action=="edit") ? $this->_ctd( $this->_inputText($name,$size,$max,$value,$mode), ($style)?$style:"" ) : "" ;
		($action=="view") ? ((!$bold) ? $this->_ctd($value,($style)?$style:"",$name,$mode) : $this->_ctd("<b>".$value."</b>",($style)?$style:"",$name,$mode)): "";		
	}
	
	public function _cSelect($name='select', $size='1', $arr='', $selected='')
	{
		$i=0;
		$max=count($arr[0]);
		$ret = "<select name='$name' id='$name' size='$size'>";
			for ($i=0;$i<$max;$i++)
				($arr[0][$i]==$selected) ? 
				$ret .= "<option selected value='".$arr[0][$i]."'>".$arr[1][$i]."</option>" : 
				$ret .= "<option value='".$arr[0][$i]."'>".$arr[1][$i]."</option>";
		$ret .= "</select>";
		return $ret;
	}
	
	public function _cCheck($action="view", $name="check", $value="text", $style='', $script='', $checked=false) {
		($action=="add") ? $this->_ctd( $this->_checkBox($name,$value,$checked,$script) ): "";
		($action=="edit") ? $this->_ctd( $this->_checkBox($name,$value,$checked,$script), ($style)?$style:"" ) : "" ;
		($action=="view") ? $this->_ctd( ($value=="t" || $checked==treu) ? "+" : "-" , ($style)?$style:"" ,$name ) : "";		
	}

	public function _checkBox($name="check", $value="", $checked=false, $script='') {
		if ($value) 
			if ($value=="t" || $checked)
				return "<input type='checkbox' name='$name' id='$name' value='$value' checked $script>\n"; 
			else
				return "<input type='checkbox' name='$name' id='$name' value='$value' $script>\n";
		else return "<input type='checkbox' name='$name' id='$name' value=1 $script>\n";
	}

	/*
	 * Метод _ctd ver. 1.0
	 * Выводит теги <td> ... </td> и содержимое $cont между ними
	 * Агрументы:
	 * $cont - значение ячейки
	 * $style - css стиль 
	 * $id - идентификатор
	 * $mode - дополнительные свойства (перечисляются через пробел)
	 */	
	public function _ctd($cont="&nbsp;", $style="", $id="", $mode="") {
		$this->_td($style, $id, $mode);
		echo $cont;
		$this->_utd();
	}

}

?>
