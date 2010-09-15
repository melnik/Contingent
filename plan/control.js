var ctrl_id='';
var dz=0;
var weeks_old=17;

<?php
require_once('pgsql.class.php');

	$action=$_GET["action"];
	$id=$_GET["id"];


/*function setWeeks(action)
{
	if (action!="view")
		weeks_old = element("weeks").value;
}*/
?>

function unhide(divID) {
    var item = document.getElementById(divId);
    if (item) {
	item.className=(item.className=='hidden')?'unhidden':'hidden';
    }
}

function roundNumber(number,decimals) {
	var newString;// The new rounded number
	decimals = Number(decimals);
	if (decimals < 1) {
		newString = (Math.round(number)).toString();
	} else {
		var numString = number.toString();
		if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
			numString += ".";// give it one at the end
		}
		var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
		var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
		var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
		if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
			if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
				while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
					if (d1 != ".") {
						cutoff -= 1;
						d1 = Number(numString.substring(cutoff,cutoff+1));
					} else {
						cutoff -= 1;
					}
				}
			}
			d1 += 1;
		} 
		if (d1 == 10) {
			numString = numString.substring(0, numString.lastIndexOf("."));
			var roundedNum = Number(numString) + 1;
			newString = roundedNum.toString() + '.';
		} else {
			if (d1 < 5) d1=5; else {numString=numString*1+1;numString+='';d1=0;}
			newString = numString.substring(0,cutoff) + d1.toString();
		}
	}
	if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
		newString += ".";
	}
	var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
	for(var i=0;i<decimals-decs;i++) newString += "0";
	//var newNumber = Number(newString);// make it a number if you like
	return newString; // Output the result to the form field (change for your purposes)
}


function ShowSub(obj,what)
{
	visible = (element(what).style.display=='none');

	element(what).style.display=(visible)?'inline':'none';
	return obj.src=(visible ?'img/b-minus.gif':'img/b-plus.gif');
}

function sum(action)
{
	var sum=0, i=0, self=0, km=0;
	var krsum=0, krcount=0;
	var kmsum=0, kmcount=0;
	var dzsum=0, dzcount=0;
	var rsum=0, rcount=0;
	var kusum=0, kucount=0;
	var vrsum=0, vrcount=0;
	var kzsum=0, kzcount=0;
	var practice_sum=0;
	var othersum=0, asum=0, esum=0, ursum=0, tosum=0, tocsum=0;
	var cnt, lectures, seminars, labs, individual, vol;
	var weeks=19, ch, zach, difzach, exam;

	cnt = element("sum");
	if (action=="view")
	{	
		lectures = parseInt(element("lectures").innerHTML);
		practice = parseInt(element("practice").innerHTML);
		seminars = parseInt(element("seminars").innerHTML);
		labs = parseInt(element("labs").innerHTML);
		individual = parseInt(element("individual").innerHTML);
<?php//		weeks = parseInt(element("weeks").innerHTML);
?>		
		if (element("zach").innerHTML=="+" && element("zach_count").checked) zach = 1; 
		if (element("difzach").innerHTML=='+') difzach = 1;
		if (element("exam").innerHTML=='+') exam = 1;
	}
	else
	{
		practice = parseInt(element("practice").value);
		lectures = parseInt(element("lectures").value);
		element("lecturescount").value = lectures/2;
		seminars = parseInt(element("seminars").value);
		element("seminarscount").value = seminars/2;
		labs = parseInt(element("labs").value);
		element("labscount").value = labs/2;
		individual = parseInt(element("individual").value);
<?php//		weeks = parseInt(element("weeks").options[element("weeks").selectedIndex].value);
?>
		if (element("zach").checked && element("zach_count").checked) zach = 1;
		if (element("difzach").checked) difzach = 1;
		if (element("exam").checked) exam = 1;
	}

	if (zach) {
		esum+=18; 
		element("zach_sum").innerHTML="18";
		}	
	else
		element("zach_sum").innerHTML="";
	if (difzach) {esum+=18; element("difzach_sum").innerHTML="18";}	
	else element("difzach_sum").innerHTML="";
	if (exam) {esum+=36; element("exam_sum").innerHTML="36";}	
	else element("exam_sum").innerHTML="";

   for (i=1;i<weeks+1;i++)
   {
		if (action=="view") {
			ch = element("th"+i).innerHTML;
			vol=element("vol"+i).innerHTML;
		}		
		else	{
			if (element("vol"+i).innerHTML) {
				vol=element("cvol"+i).value;
			}
			else vol = 0;
			ch=element("choice"+i).value;
		}
	  	if (vol)
	  	{
			switch (ch) {
			case "КР": krsum+=parseInt(vol); krcount++; break;
<?php /*		case "КМ": kmsum+=parseInt(vol); kmcount++; break; */ ?>
			case "ДЗ": dzsum+=parseInt(vol); dzcount++; break;
 			case "Р ": rsum+=parseInt(vol); rcount++; break;
 			case "Р": rsum+=parseInt(vol); rcount++; break;
			case "КУ": kusum+=parseInt(vol); kucount++; break;
<?php /*		case "ВР": vrsum+=parseInt(vol); vrcount++; break; */ ?>
			case "КЗ": kzsum+=parseInt(vol); kzcount++; break;
			default: othersum+=parseInt(vol);
			}
 			sum+=parseInt(vol);
 			km+=parseInt(vol);
 		}
   }

	if (kusum) esum+=18;
	if (kzsum>0) kz_sum.innerHTML=kzsum; else kz_sum.innerHTML='';
	kz_count.innerHTML = kzcount;
	kr_sum.innerHTML = krsum;
	kr_count.innerHTML = krcount;
	asum=lectures+seminars+labs+krsum+kzsum;
	a_sum.innerHTML = asum;
	r_sum.innerHTML = rsum;
	r_count.innerHTML = rcount;
	ku_sum.innerHTML = kusum;
	ku_count.innerHTML = kucount;
	dz_sum.innerHTML = dzsum;
	dz_count.innerHTML = dzcount;
	other_sum.innerHTML = individual - rsum - kusum - dzsum;
	
	ursum = asum + parseInt(individual);
	ur_sum.innerHTML = ursum;

	if (practice) {
		tosum = practice*54;
		element("practice_sum").innerHTML = tosum;
		
	}
	else
		tosum = ursum + esum;
	to_sum.innerHTML = tosum;
	
	toc_sum.innerHTML = roundNumber(tosum/36,1);
	
//   cnt.innerHTML = parseInt(lectures) + parseInt(seminars) + parseInt(labs) + parseInt(individual);
   if (sum > parseInt(individual))
   	element("individual").bgColor='#FF0000';
   if (action=="view")
   {
   	if (kusum) {
   		element("zach_ku").innerHTML='+';
   		element("zach_ku_sum").innerHTML='18';
   	}
   	else
   		element("zach_ku").innerHTML='-';

   	self = parseInt(individual) - parseInt(km);
   	element("self").innerHTML = self; 
	   if (self <= 0)
   		element("self").bgColor='#FF0000';
   }
}

function cHit(week,type,vol,action)
{
	var ch,v,i=0;
	var color = new Array('#bbbbbb','#999999','#777777');
	
        if (type=="ДЗ" && action=="view") {
	if ((week-vol/2)<0) color='#ff9999';
	    for (i=week; i>(week-vol/2) && i>0; i--) {
		if (element("th"+i).bgColor==color[0])
		    element("th"+i).bgColor=color[1];
		else if (element("th"+i).bgColor==color[1])
		    element("th"+i).bgColor=color[2];
		else 
		    element("th"+i).bgColor=color[0];
	    }
	dz++
	}
	else 
	    if (type == "КП") {
		for (i=1; i<=week; i++) 
    		    element("th"+i).bgColor=color[1];
    	    }
	v = element("vol"+week);
	if (action=="view") 
	{
	        ch = element("th"+week);
		ch.innerHTML=type;
		v.innerHTML=vol;
	}
	else
	{
	        ch = element("choice"+week);
		ch.value=type;
		v.innerHTML="<input type=text id='cvol"+week+"' name='cvol"+week+"' class='control' maxlength='3' value='" + vol + "'  onBlur=sum()>";	
	}
}

function cDis(action)
{
   var title = new Array (new Array("Неделя","План КМ", "КР","КМ","ДЗ","Р","КУ","ВР","КЗ","Объем") , new Array("week","choice","kr","km","dz","r","ku","vr","kz","vol"));
	var cont = "";
	var weeks = 0;
	var diff = 0;

	if (action=="view")
	{
		weeks = 21;
	}	
	else		
		weeks = 21;
<?php /*		weeks = element("weeks").value; */ ?> 
	tbl = element("cont");
	cont += "<table id='control' class='spisok'>";	
	for (i=0;i<10;i++)
	{
		cont += "<tr id='" + title[1][i] + "'>\n";
		if (action=="view" && (i<2 || i>8) )		
			cont += "<th>" + title[0][i] + "</th>\n";
		else
			if( action!="view")		
				cont += "<th>" + title[0][i] + "</th>\n";
		for (j=1;j<parseInt(weeks)+1;j++) 
			switch (i)
			{
				case 0: cont += "<th>" + j + "</th>";break;
				case 1: if (action!="view") 
					    cont += "<td id='th" + j + "'>" + "<input type='text' readonly id='" + title[1][i]+j + "' name='" + title[1][i]+j + "' size='2' maxlength='2' value='' class='control'>\n" + "</td>";
					else
					    cont += "<td id='th" + j + "' width='20px' height='20px' class='control'>&nbsp</td>";
					break;
				case 9: cont += "<th id='vol" + j + "'></th>";break;
				default: if (action!="view") 
								cont += "<th height=15px width=15px onClick=control('" + j + "','" + title[0][i] + "')>&nbsp</th>";
							break;
			}
		cont += "</tr>\n";
	}	
	cont += "</table>\n";	
	tbl.innerHTML = cont;
<?php
	if ($id)
		if ($action=="edit" || $action=="view") 
		{
			$pg = new pgsql();
			if (!$pg->_query("SELECT * FROM control WHERE program_id='$id'") ) 
				die("Ошибка");
			
			while($rez=$pg->_getResult())
			{	
				$week=$rez["week"];
				$type=$rez["control_type"];
				$vol=$rez["vol"];
				($action=="view") ? print("cHit('$week','$type','$vol',action);") : print ("cHit('$week','$type','$vol',action);");
			}
		}
?>

}


function specSelect()
{	
	newwindow=window.open();
	newdocument=newwindow.document;
		newdocument.writeln("<html>");
		newdocument.writeln("<head>");
					newdocument.writeln("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
					newdocument.writeln("<meta http-equiv='Content-Language' content='ru' />");
					newdocument.writeln("<title>Справочник специальностей</title>");
					newdocument.writeln("<link rel='stylesheet' type='text/css' href='./css/style.css'>");
					newdocument.writeln("</head>");
					newdocument.writeln("<body>");
					newdocument.writeln("<table align='center' class='spisok'>");
					newdocument.writeln("<tr><th>ОКСО</th>");
					newdocument.writeln("<th>Специализация</th>");
					newdocument.writeln("<th>Квалификация</th></tr>");
<?php

$doc = new DOMDocument(); 
    if ($doc->load('speciality.xml')) {
    $specs = $doc->getElementsByTagName('speciality');

    $data="";
    $count = 1;

    foreach ($specs as $param) {
	$sp = $param->getAttribute('speciality_index').$param->getAttribute('direction_index').$param->getAttribute('qualification_index');
	$s = iconv("utf-8","utf-8",$param->getAttribute('speciality_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('speciality_title'));
	$d = iconv("utf-8","utf-8",$param->getAttribute('direction_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('direction_title'));
	$q = iconv("utf-8","utf-8",$param->getAttribute('qualification_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('qualification_title'));

		$act = "onClick=window.opener.window.element('spec').value='$sp';window.opener.window.groupUpdate();window.close();>";

		?>
					newdocument.writeln("<tr><td <?php echo $act.$s; ?></td><td <?php echo $act.$d; ?></td><td <?php echo $act.$q; ?></td>");
					newdocument.writeln("</tr>");
<?php
    $count++;
    }
    } else {
    ?>
	newdocument.writeln("Справочник специальностей недоступен!");
    <?php
    }

?>
					

					newdocument.writeln("</table>");
					newdocument.writeln("</body>");
					newdocument.writeln("</html>");
	newdocument.close(); 
}


function specSelectAll()
{	
	newwindow=window.open();
	newdocument=newwindow.document;
		newdocument.writeln("<html>");
		newdocument.writeln("<head>");
					newdocument.writeln("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
					newdocument.writeln("<meta http-equiv='Content-Language' content='ru' />");
					newdocument.writeln("<title>Справочник специальностей</title>");
					newdocument.writeln("<link rel='stylesheet' type='text/css' href='./css/style.css'>");
					newdocument.writeln("</head>");
					newdocument.writeln("<body>");
					newdocument.writeln("<table align='center' class='spisok'>");
					newdocument.writeln("<tr><th>ОКСО</th>");
					newdocument.writeln("<th>Специализация</th>");
					newdocument.writeln("<th>Квалификация</th></tr>");
<?php

$doc = new DOMDocument(); 
    if ($doc->load('speciality.xml')) {
    $specs = $doc->getElementsByTagName('speciality');

    $data="";
    $count = 1;

    foreach ($specs as $param) {
	$sp = $param->getAttribute('speciality_index').$param->getAttribute('direction_index').$param->getAttribute('qualification_index');
	$s = iconv("utf-8","utf-8",$param->getAttribute('speciality_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('speciality_title'));
	$d = iconv("utf-8","utf-8",$param->getAttribute('direction_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('direction_title'));
	$q = iconv("utf-8","utf-8",$param->getAttribute('qualification_index'))." - ".iconv("utf-8","utf-8",$param->getAttribute('qualification_title'));

		$act = "onClick=window.opener.window.element('spec_all').value='$sp';window.close();>";

		?>
					newdocument.writeln("<tr><td <?php echo $act.$s; ?></td><td <?php echo $act.$d; ?></td><td <?php echo $act.$q; ?></td>");
					newdocument.writeln("</tr>");
<?php
    $count++;
    }
    } else {
    ?>
	newdocument.writeln("Справочник специальностей недоступен!");
    <?php
    }

?>
					

					newdocument.writeln("</table>");
					newdocument.writeln("</body>");
					newdocument.writeln("</html>");
	newdocument.close(); 
}




function langSelect()
{
	var first=-1, second=-1,i=0;
	var el, ch=''; 
	
	first = element('lang_first').value;
	second = element('lang_second').value;

	newwindow=window.open();
	newdocument=newwindow.document;
		newdocument.writeln("<html>");
		newdocument.writeln("<head>");
					newdocument.writeln("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
					newdocument.writeln("<meta http-equiv='Content-Language' content='ru' />");
					newdocument.writeln("<title>Справочник языков</title>");
					newdocument.writeln("<link rel='stylesheet' type='text/css' href='./css/style.css'>");
					newdocument.writeln("</head>");
					newdocument.writeln("<body>");
					newdocument.writeln("<form name='lang_form'>");
					newdocument.writeln("<table align='center' class='spisok'>");
					newdocument.writeln("<tr><td>");

					newdocument.writeln("<table align='center' class='spisok'>");
					newdocument.writeln("<tr><th colspan='3'>Языки</th>");
					newdocument.writeln("<th>Первый</th>");
					newdocument.writeln("<th>Второй</th></tr>");

<?php

$doc = new DOMDocument(); 

    if ($doc->load('lang.xml')) {
//    echo "123";
    $langs = $doc->getElementsByTagName('lang');

    $data="";
    $count = 1;

//		echo "alert('".($langs->length)."');";

    foreach ($langs as $param) {
      $data = iconv("utf-8","utf-8",$param->getAttribute('title'));
      $short = iconv("utf-8","utf-8",$param->getAttribute('titleshort'));
      $index = iconv("utf-8","utf-8",$param->getAttribute('index'));
		
		?>
		if (first==<?php echo $index; ?>) ch = ' checked'; else ch = '';
					newdocument.writeln("<tr><td><?php echo $index; ?></td><td><?php echo $data; ?></td><td><?php echo $short; ?></td><td>");
		newdocument.writeln('<input type="radio" name="lang_first" id="lang_first" value="<?php echo $index; ?>"'+ch+' onClick=window.opener.window.element("lang_first").value=<?php echo $index ?>;></td><td>');
		if (second==<?php echo $index; ?>) ch = ' checked'; else ch = '';
		newdocument.writeln('<input type="radio" name="lang_second" value="<?php echo $index; ?>"'+ch+' onClick=window.opener.window.element("lang_second").value=<?php echo $index ?>;>');
					newdocument.writeln("</td></tr>");
<?php

if ($count==($langs->length/2)) { ?>
					newdocument.writeln("</table></td><td valign='top'>");
					newdocument.writeln("<table class='spisok'>");
					newdocument.writeln("<tr><th colspan='3'>Языки</th>");
					newdocument.writeln("<th>Первый</th>");
					newdocument.writeln("<th>Второй</th></tr>"); <?php
    }

    $count++;
    }
    
    } else {
?>	newdocument.writeln("Справочник языков недоступен!"); <?php
    }
?>
					

					newdocument.writeln("</table></td></tr><tr><th colspan='2' onClick=window.close();>Изменить</th></tr>");
					newdocument.writeln("</table>");
					newdocument.writeln("</form>");
					newdocument.writeln("</body>");
					newdocument.writeln("</html>");

	newdocument.close(); 
//	lang_first=window.opener.window.element('lang_first').value;
//el = document.forms[0];
//alert(el.lang_first[window.opener.window.element('lang_first').value].value);
}


function departmentSelect(target)
{
	newwindow=window.open();
	newdocument=newwindow.document;
		newdocument.writeln("<html>");
		newdocument.writeln("<head>");
					newdocument.writeln("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
					newdocument.writeln("<meta http-equiv='Content-Language' content='ru' />");
					newdocument.writeln("<title>Справочник кафедр</title>");
					newdocument.writeln("<link rel='stylesheet' type='text/css' href='./css/style.css'>");
<?php //  					newdocument.writeln("<script src='./hide.js' type='text/javascript'>");
?>					newdocument.writeln("</head>");
					newdocument.writeln("<body>");
<?php
$doc = new DOMDocument();

if ($doc->load('struct.xml')) {
//$struct = $doc->getElementsByTagName('subfaculty');
    $struct = $doc->getElementsByTagName('faculty');

    $data="";
    foreach ($struct as $faculty) {
		$deps = $faculty->getElementsByTagName('subfaculty');
		$f_id = $faculty->getAttribute('id');
		echo 'newdocument.writeln("<table align=\'center\' class=\'spisok\' width=\'60%\'><tr><th align=left onClick=document.getElementById(\''.$f_id.'\').className=(document.getElementById(\''.$f_id.'\').className==\'hidden\')?\'unhidden\':\'hidden\';>");';
		$f_name = iconv("utf-8","utf-8",$faculty->getAttribute('abbr'))." - ".iconv("utf-8","utf-8",$faculty->getAttribute('name'));
		echo "newdocument.writeln('$f_name');";
		echo 'newdocument.writeln("</th>");';
		echo 'newdocument.writeln("</tr></table>");';
    }

    $struct = $doc->getElementsByTagName('faculty');

    $data="";


    foreach ($struct as $faculty) {
	$f_id = $faculty->getAttribute('id');
	echo 'newdocument.writeln("<div align=\'center\' id = \''.$f_id.'\' class=\'hidden\'><table align=\'center\' class=\'spisok\' width=\'60%\'><tr>");';
	$deps = $faculty->getElementsByTagName('subfaculty');
/*	echo 'newdocument.writeln("<table align=\'center\' class=\'spisok\' width=\'60%\'><tr><th>");';
	$f_id = $faculty->getAttribute('id');
	$f_name = iconv("utf-8","utf-8",$faculty->getAttribute('abbr'))." - ".iconv("utf-8","utf-8",$faculty->getAttribute('name'));
	echo "newdocument.writeln('$f_name');";
	echo 'newdocument.writeln("</th>");';
	echo 'newdocument.writeln("</tr></table><table  align=\'center\' class=\'spisok\' width=\'60%\'><tr>");';
*/	foreach ($deps as $dep) {
      $data = iconv("utf-8","utf-8",$dep->getAttribute('abbr'));
      $s_id = iconv("utf-8","utf-8",$dep->getAttribute('id'));
      $s_name = $data." - ".iconv("utf-8","utf-8",$dep->getAttribute('name'));
?>
	newdocument.writeln("<td onClick=window.opener.window.element('"+target+"').value='<?php echo $data; ?>';window.opener.window.element('"+target+"_id').value='<?php echo $s_id; ?>';window.opener.window.groupUpdate();window.close();>");
<?php
		echo "newdocument.writeln('$s_name');";
?>
	newdocument.writeln("</td></tr><tr>");
<?php
	}
	
	echo 'newdocument.writeln("</tr></table></div>");';
    }
    }
    else {
	newdocument.writeln("Справочник кафедр недоступен!");
    }
?>
					
	newdocument.writeln("</table></body>");
	newdocument.writeln("</html>");
	newdocument.close(); 
}


function	annotation(action)
{
//alert(window.opener.window.element('memo').value);
<?php
	if ($id)
		if ($action=="edit" || $action=="view") 
		{
			if (!$pg->_query("SELECT * FROM prog WHERE program_id='$id'") ) 
				die("Ошибка");
			
			while($rez=$pg->_getResult())
			{	
				$memo=$rez["memo"]; ?>
					document.writeln("<html>");
					document.writeln("<head>");
					document.writeln("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
					document.writeln("<meta http-equiv='Content-Language' content='ru' />");
					document.writeln("<title>Печать</title>");
					document.writeln("<link rel='stylesheet' type='text/css' href='./css/style.css'>");
					document.writeln("</head>");
					document.writeln("<body>");
					document.writeln(window.opener.window.element('memo').value);
					document.writeln("</body>");
					document.writeln("</html>"); <?php
//					document.write(parent.element(id).innerHTML);
//					print ("document.write(window.opener.window.element('memo').value);");
//				print ("alert(window.opener.window.element('memo').value);");
			}
		}
?>
}

function moveControl(id)
{
	if (!ctrl_id && element(id).innerHTML!='') 
	{
		ctrl_id=id;
		element(id).bgColor="#99ff99";
	}
	else
	if (ctrl_id==id)
	{
		element(ctrl_id).bgColor='';
		ctrl_id='';
	}
	else
	if (id!=ctrl_id && element(id).innerHTML=='' && element(id).id.substring(0,1)==element(ctrl_id).id.substring(0,1))
	{
		element(ctrl_id).bgColor='';
		element(id).innerHTML=element(ctrl_id).innerHTML;
		element(ctrl_id).innerHTML='';
		ctrl_id='';
	}
}

function checkOrtCopy(id)
{
	var check=4;
	
	if (element("spec_all").value == element("spec").value) check--; 
	if (element("subfac").value == element("subfaculty").value) check--; 
	if (element("lang_first").value == element("lang_first_old").value) check--; 
	if (element("lang_second").value == element("lang_second_old").value) check--; 
	
	if (!check) 
		alert ("Внимание! Необходимо изменить хотябы один параметр!");
	else {
		alert ("OK!");
		id.submit();
	}
}

function control(elem,value)
{
	var offset=11;
 
	cnt = element("choice"+elem);
   ho = element("vol"+elem);

	if (cnt.value==value)
	{
		cnt.value='';
		ho.innerHTML="";
	}
	else
	{		
		cnt.value=value;	
		if (!ho.innerHTML) 
			ho.innerHTML="<input type=text id='cvol"+elem+"' name='cvol"+elem+"' class='control' maxlength='3' value='2' onBlur=sum()>";
	}	
	sum();
}

function colorControl(row, col, vol)
{
    var i=0;
    for (i=parseInt(col);i>(parseInt(col)-Math.round(vol/2)) && i>=0;i--) {
	cell = element(row + "" + i);
	if (cell.bgColor == "#999999")
	    cell.bgColor="#777777";
	if (cell.bgColor == "#bbbbbb")
	    cell.bgColor="#999999";
	else
	    cell.bgColor="#bbbbbb";
//	cell.innerHTML = cell.bgColor
    }
}
