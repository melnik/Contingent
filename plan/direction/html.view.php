<?php
/*
 * Класс Html формирует вывод документов
 */
class Html
{

/*
 * Метод Head() выводит "шапку" документа
 * Принемает необязательный параметр $meta, отвечающий за META-теги HTML документа
 */
 
  function Head($title, $meta='')
  {
   ?>
   <html>
   <head>
	<?php
		echo $meta;
	?> 
   <meta http-equiv="Content-Type" content="text/html; charset=KOI8-R">
	<link href="css/style.css" rel="stylesheet" type="text/css">
   </head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table1" height="100%">
	<tr>
		<td width="15" height="15">
			<img src="img/page_01.gif" width="15" height="15" alt=""></td>
		<td background="img/page_02.gif" colspan="3" width="100%"></td>
		<td width="15" height="15">
			<img src="img/page_04.gif" width="15" height="15" alt=""></td>
	</tr>
	<tr>
		<td background="img/page_05.gif" rowspan="4">&nbsp;</td>
		<td valign="top" colspan="3" height="95" width=100%>

		
		<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table5" background="img/page_08.gif" height="60">
			<tr>
				<td rowspan="2" width="388" height="95">
			<img src="img/page_06.gif" width="388" height="95" alt=""></td>
				<td align="center" valign="top">
			<img src="img/page_13.gif" width="145" height="50" alt="" style="margin-top:5px"></td>
				<td align="center" valign="top">
			<img src="img/page_15.gif" width="145" height="50" alt="" style="margin-top:5px"></td>
				<td align="center" valign="top">
			<img src="img/page_17.gif" width="145" height="50" alt="" style="margin-top:5px"></td>
				<td rowspan="2" width="4" height="95">
			<img src="img/page_09.gif" width="4" height="95" alt=""></td>
			</tr>
			<tr>
				<td colspan="3" height="30"><?php echo $title; ?></td>
			</tr>
		</table>

		
		</td>
		<td background="img/page_10.gif" rowspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" width="4" height="4"><img src="img/page_20.gif" width="4" height="4" alt=""></td>
		<td valign="top" width="100%" background="img/page_22.gif"></td>
		<td valign="top" width="4" height="4"><img src="img/page_23.gif" width="4" height="4" alt=""></td>
	</tr>
	<tr>
		<td valign="top" width="4" background="img/page_24.gif"></td>
		<td valign="top" background="img/page_28.gif" style="background-repeat:repeat-x">

		<table border="0" height=100% cellpadding="0" cellspacing="0" width="100%" id="table9">
			<tr>
				<td background="img/page_33.gif">
		  		<table border="0" cellpadding="0" cellspacing="0">
   				<tr class=topmenu>
   					<?php					
							($_GET["degree"]==62) ? $this->tdButtonSel("index.php?degree=62","Бакалавр") : $this->tdButton("index.php?degree=62","Бакалавр");
							($_GET["degree"]==65) ? $this->tdButtonSel("index.php?degree=65","Инженер") : $this->tdButton("index.php?degree=65","Инженер");
							($_GET["degree"]==68) ? $this->tdButtonSel("index.php?degree=68","Магистр") : $this->tdButton("index.php?degree=68","Магистр");
						?>
       			</tr>
	 			</table>
				</td>
				<td width="5"><img src="img/page_40.gif" width="5" height="21" alt=""></td>
	 		</tr>
			<tr>
				<td background="img/page_51.gif" style="background-repeat:repeat-y;padding:10px" bgcolor=white class=content height=100% valign=top>

  <?php
  }

/*
 * Метод Ending() выводит "хвотс" документа
 */

	function tdButton($link, $title, $action='')
	{
		echo "<td><img src='img/page_29.gif' width=5 height=21></td>\n";
		echo "<td background='img/page_31.gif'>";
		echo "<a href=$link $action>$title</a></td>\n";
		echo "<td><img src='img/page_32.gif' width=5 height=21></td>";
		echo "<td width=5>&nbsp;</td>\n";
	}
	
        function tdButtonSel($link, $title, $action='')
        {               
                echo "<td><img src='img/page_34.gif' width=5 height=21></td>\n";
                echo "<td background='img/page_36.gif'>";
                echo "<a href=$link $action>$title</a></td>\n";   
                echo "<td><img src='img/page_37.gif' width=5 height=21></td>";
                echo "<td width=5>&nbsp;</td>\n"; 
        }


  function Ending()
  {
   ?>
				<td width="5" background="img/page_55.gif" valign=top><img src="img/page_50.gif" width="5" height="3" alt=""></td>
			</tr>
			<tr>
				<td  height="5" background="img/page_60.gif">
			<img src="img/page_59.gif" width="5" height="5" alt=""></td>
				<td width="5">
			<img src="img/page_62.gif" width="5" height="5" alt=""></td>
			</tr>
   			</td>
	 		</tr>
	   </table>
		</td>
		<td valign="top" background="img/page_41.gif"></td>
	</tr>
	<tr>
		<td valign="top" height="34" colspan="3">
		<table valign="top" border="0" cellpadding="0" cellspacing="0" width="100%" id="table4">
			<tr>
				<td width="4" height="34" >
			<img src="img/page_72.gif" width="4" height="34" alt=""></td>
				<td background="img/page_74.gif">
				<div style="height:34px;padding-left:294;background-image:url(img/page_73.gif);background-repeat:no-repeat;padding-top:12px">
					<b>Разработано в ОИИС</b></div>
			</td>
				<td width="4"><img src="img/page_76.gif" width="4" height="34" alt=""></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td width="15" height="15">
			<img src="img/page_77.gif" width="15" height="15" alt=""></td>
		<td background="img/page_78.gif" colspan="3"></td>
		<td width="15" height="15">
			<img src="img/page_80.gif" width="15" height="15" alt=""></td>
	</tr>
</table>
</body>
</html>   
<?php
  }

}

?>
