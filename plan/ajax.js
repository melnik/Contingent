var cont="";
var sem=lf=ls="";

function showInfo(action, id)
{
	cont = $("#"+id).attr("innerHTML");
	if (!cont)
	cont = $("#"+id).attr("value");

//	alert(cont);
	$("#"+id).wTooltip({
		ajax: "ajax.php?action="+action+"&index="+cont
	});

}

function showInfoGroup(action, id, speciality, semester, lang_first, lang_second)
{
	cont = $("#"+speciality).attr("innerHTML");
	if (!cont)
	cont = $("#"+speciality).attr("value");

	sem = $("#"+semester).attr("innerHTML");
	if (!sem)
	sem = $("#"+semester).attr("value");

	lf = $("#"+lang_first).attr("innerHTML");
	if (!lf)
	lf = $("#"+lang_first).attr("value");

	ls = $("#"+lang_second).attr("innerHTML");
	if (!ls)
	ls = $("#"+lang_second).attr("value");

//	alert(cont);
	$("#"+id).wTooltip({
		ajax: "ajax.php?action="+action+"&index="+cont+"&semester="+sem+"&lang_first="+lf+"&lang_second="+ls
	});

}