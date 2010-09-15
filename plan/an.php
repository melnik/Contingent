
<?php
require_once('html.class.php');
require_once('pgsql.class.php');

switch ($target) {
	case "annotationMemo": $title="Аннотация"; break;
	case "lecturesMemo": $title="Лекции"; break;
	case "seminarsMemo": $title="Саминары"; break;
	case "labsMemo": $title="Лабораторные работы"; break;
	case "individualMemo": $title="Самостоятельная работа"; break;
	case "literatureMemo": $title="Список рекомендуемой литературы"; break;
	case "dzMemo": $title="Домашнее задание"; break;
	case "krMemo": $title="Контрольная работа"; break;
	case "rkMemo": $title="Рубежный контроль"; break;
	case "zachMemo": $title="Зачет"; break;
	case "difzachMemo": $title="Дифференцированный зачет"; break;
	case "examMemo": $title="Экзамен"; break;
	default: $title="Аннотация";
}
$pg = new pgsql();
$doc = new html($title);
?>
<script>
window.focus();
</script>

<?php
	if ($id)
		if ($action=="view") 
		{
			$col = str_replace('Memo','',$target);
			if ($col == '') $col = 'annotation';
			if (!$pg->_query("SELECT * FROM memo WHERE program_id='$id'") ) 
				die("Ошибка");
			while($rez=$pg->_getResult())
			{	
				$txt=$rez[$col];
				$txt=explode("\n",$txt);
				for ($i=0;$i<count($txt);$i++) {
				(!$i)?$tag="h1":$tag="div";
				print ("<$tag>\n");
				print ($txt[$i]);
				print ("</$tag>\n<br>\n");
				}
			}
		}
		if ($action=="edit")
		{
				echo "<textarea name='$target' rows='20' style='width:100%'></textarea>";
				echo "<a href='#' onClick=save()>Изменить</a>";
?>
<script>
	element('<?php echo $target; ?>').value=window.opener.window.element('<?php echo $target; ?>').value;

function save()
{
	window.opener.window.element('<?php echo $target; ?>').value=element('<?php echo $target; ?>').value;
	window.close();	
}
</script>
<?php
		}
?>
