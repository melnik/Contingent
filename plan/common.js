function element(id)
{
	if (document.getElementById)
		return document.getElementById(id);
   else if (document.all)
      return document.all[id];
}

function printDoc(id)
{
	wnd = window.open("", "Печать");
	wnd.document.writeln("<html>");
	wnd.document.writeln("<head>");
	wnd.document.writeln("<meta http-equiv='Content-Type' content='text/html; charset=koi8-r' />");
	wnd.document.writeln("<meta http-equiv='Content-Language' content='ru' />");
	wnd.document.writeln("<title>Печать</title>");
	wnd.document.writeln("<link rel='stylesheet' type='text/css' href='css/style.css'>");
	wnd.document.writeln("</head>");
	wnd.document.writeln("<body>");
	wnd.document.write(parent.element(id).innerHTML);
	wnd.document.writeln("</body>");
	wnd.document.writeln("</html>");
}

function select(id) {
    element(id+'o').bgColor='#00ff00';
    element(id+'p').bgColor='#00ff00';
}

function disSelect(id) {
    element(id+'o').bgColor='#ffffff';
    element(id+'p').bgColor='#ffffff';
}

function cmp(id) {
    var i=0;
    var j='';
    for (i=1;i<34;i++) 
    if (element(i+id+'o').innerHTML!=element(i+id+'p').innerHTML) {
    element(i+id+'o').bgColor='#00ff00';
    element(i+id+'p').bgColor='#00ff00';
    }
}

function groupUpdate() {
	var subfac,spec,sem,lf,ls,query='';
	if ($("#subfac").val() && $("#spec").val())
	subfac = $("#subfac").val();
	spec = $("#spec").val();
	sem = $("#semester option:selected").val();
	$(".allGroups").each(function(index){
		gr = $(this);
		ind = index;
		lf = $("#lang_first",this).html();
		ls = $("#lang_second",this).html();
		q="action=group&subfac="+subfac+"&index="+spec+"&semester="+sem+"&lang_first="+lf+"&lang_second="+ls;
		$.ajax({
			type: "GET",
			url: "ajax.php",
			async: false,
			data: "action=group&subfac="+subfac+"&index="+spec+"&semester="+sem+"&lang_first="+lf+"&lang_second="+ls,
			dataType: "html",
			success: function(msg) {
			  g = msg;
			}
		});
	$("#groups\\["+ind+"\\]",this).html(g);
	}); 
}
	
$(document).ready(function() {
	var value;

	$(".subfaculty").mouseover(function() {
		if ($(this).val())
			value = $(this).val();
		else
			value = $(this).html();
		$(this).wTooltip({
			ajax: "ajax.php?action=subfaculty&index="+value 
		});
	});

	$("#semester").change(function() {
			groupUpdate();
	});

	$(".language").mouseover(function() {
		if ($(this).val())
			value = $(this).val();
		else
			value = $(this).html();
		$(this).wTooltip({
			ajax: "ajax.php?action=lang&index="+value 
		});
	});

	$(".speciality").mouseover(function() {
		if ($(this).val())
			value = $(this).val();
		else
			value = $(this).html();
		$(this).wTooltip({
			ajax: "ajax.php?action=speciality&index="+value 
		});
	});

});
