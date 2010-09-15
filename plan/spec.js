var sem='';
var spec='';
var lang_first='';
var lang_second='';
var year='';

function SetSem(obj)
{
	if (sem) element("sem"+sem).bgColor='';	
	sem = obj.innerHTML;
	//alert(sem);
	obj.bgColor="#99ff99";
}

function SetSpec(obj)
{
	if (spec) element(spec).bgColor='';	
	spec = obj.innerHTML;
	//alert(sem);
	obj.bgColor="#99ff99";
}

function SetLangFirst(obj)
{
	if (lang_first) element(lang_first).bgColor='';	
	lang_first = obj.innerHTML;
	//alert(sem);
	obj.bgColor="#99ff99";
}

function SetLangSecond(obj)
{
	if (lang_second) element(lang_second).bgColor='';
	lang_second = obj.innerHTML;
	//alert(sem);
	obj.bgColor="#99ff99";
}

function SetLang(obj)
{
	var langs='';

	if (lang_first && lang_second) element(lang_first+' - '+lang_second).bgColor='';
	langs = obj.id;
	langs = langs.split(' - ');
	lang_first = langs[0];
	lang_second = langs[1];	
	//alert(sem);
	obj.bgColor="#99ff99";
}

function CheckSemSpec()
{
	if (!sem) 
	{
		alert("Выберите семестр!");
		return 0;
	}
	else if (!spec) 
	{
		alert("Выберите специальность!");
		return 0;
	}
	else if (!lang_first || !lang_second) 
	{
		alert("Выберите языки!");
		return 0;
	}
	else
		return 1;
	
}

function Select(year, subfaculty)
{
	if (CheckSemSpec())
		parent.window.location="?year="+year+"&sem="+sem+"&spec="+spec+"&lang_first="+lang_first+"&lang_second="+lang_second+"&subfaculty="+subfaculty+"&section=short&action=view";
//		alert("OK");	
}


function ShowList(sem,spec)
{
	visible = (element(what).style.display=='none');

	element(what).style.display=(visible)?'inline':'none';
	return obj.src=(visible ?'img/b-minus.gif':'img/b-plus.gif');
}
