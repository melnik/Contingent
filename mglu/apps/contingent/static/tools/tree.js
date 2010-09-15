var single_selection = 0;
var unload_needed = 0;

function showhide (itemname)
{
	var x, s, openname;

	if (!itemname && itemname == '')
		return;

	x = document.getElementById (itemname)
	s = document.getElementById ('sign_' + itemname);
	if (!x || !s)
		return;

	if (x.parentNode.tagName == 'BLOCKQUOTE') {
		openname = document.getElementById ('shown_' +
			x.parentNode.getAttribute('id'));
		if (!openname.firstChild)
			openname.appendChild (document.createTextNode(''));
		openname = openname.firstChild;
	} else
		openname = null;


	if (x.style.display != "none") {
		x.style.display = "none";
		s.firstChild.setAttribute ('src', '/img/folder.png');
		if (openname)
			openname.nodeValue = '';
	} else {
		if (openname && single_selection) {
			openobj = document.getElementById('sign_' + openname.nodeValue);
			if (openobj) {
				action = openobj.getAttribute('href').replace('javascript:','');
				eval(action);
			}
			openname.nodeValue = itemname;
		}
		x.style.display = "block";
		s.firstChild.setAttribute ('src', '/img/folder_open.png');
	}
}

function unloadnode (itemname, url)
{
	var x;

	document.getElementById ("sign_" + itemname).setAttribute
		('href', 'javascript:loadnode("' + itemname + '","' + url + '");');
	showhide (itemname);

	x = document.getElementById (itemname);
	if (!x)
		return;

	while (x.firstChild)
		x.removeChild (x.firstChild);
}


function loadnode (itemname, url)
{
	document.getElementById ("sign_" + itemname).setAttribute
		('href', 'javascript:unloadnode("' + itemname + '","' + url + '");');
	if (service) {
		service.location = url;
	} else
		alert ("No service frame");

	showhide (itemname);
}

function is_ie ()
{
	return (document.all != null);
}

function addnode (parent, newid, text, url, hint)
{
	var p, x, t, l, s, sh, img;

	p = document.getElementById (parent);
	if (!p)
		return;

	if (is_ie()) {
		p.innerHTML = p.innerHTML + "<p id='" + 'hdr_' + parent +
			newid + "/' class='tree'></p>";
		t = document.getElementById ('hdr_' + parent + newid + '/');
	} else {
		t = document.createElement ('p');
		t.setAttribute ('class', 'tree');
		p.appendChild (t);
	}

	sh = document.createElement ('span');
	sh.setAttribute ('id', "shown_"+ parent + newid + "/");
	sh.style.display = 'none';

	p.appendChild (sh);

	s = document.createElement ('a');
	s.setAttribute ('id', 'sign_' + parent + newid + '/');
	s.setAttribute ('href', 'javascript:showhide("' +
		parent + newid + '/");');

	img = document.createElement ('img');
	img.setAttribute ('src', '/img/folder.png');

	s.appendChild (img);
	t.appendChild (s);
	t.appendChild (document.createTextNode (' '));

	if (url) {
		l = document.createElement ('a');
		l.setAttribute ('href', url);
		l.setAttribute ('target', 'list');
		if (hint)
			l.setAttribute ('title', hint);
	} else
		l = document.createElement ('span');
	l.setAttribute ('id', 'title_' + parent + newid + '/');
	l.appendChild (document.createTextNode (text));
	t.appendChild (l);

	if (is_ie ()) {
		p.innerHTML = p.innerHTML + "<blockquote id='" + parent +
			newid + "/' class='tree'></blockquote>";
		x = document.getElementById (parent + newid + '/');
	} else {
		x = document.createElement ('blockquote');
		x.setAttribute ('class', 'tree');
		x.setAttribute ('id', parent + newid + "/");
		p.appendChild (x);
	}

	x.style.display = 'none';
}

function addextnode (parent, newid, location, text, url, hint)
{
	addnode (parent, newid, text, url, hint);
	document.getElementById ("sign_" + parent + newid + "/").setAttribute
		('href', 'javascript:loadnode("' + parent + newid + '/","' +
		location + '");');
}

var __uniq_id = 0;

function uniq_id ()
{
	__uniq_id = __uniq_id + 1;
	return __uniq_id;
}

function addleaf (parent, text, url, hint)
{
	var p, x, l, newid, i;

	newid = uniq_id ();

	p = document.getElementById (parent);
	if (!p)
		return;

		if (is_ie()) {
		p.innerHTML = p.innerHTML + "<p id='" + 'hdr_' + parent +
			newid + "/' class='tree'></p>";
		x = document.getElementById ('hdr_' + parent + newid + '/');
	} else {
		x = document.createElement ('p');
		x.setAttribute ('class', 'tree');
	}

	i = document.createElement ('img');
	i.setAttribute ('src', '/img/file.png');

	x.appendChild (i);
	x.appendChild (document.createTextNode (' '));

	if (url) {
		l = document.createElement ('a');
		l.setAttribute ('href', url);
		l.setAttribute ('target', 'list');
		if (hint)
			l.setAttribute ('title', hint);
	} else
		l = document.createElement ('span');

        l.appendChild (document.createTextNode (text));
	x.appendChild (l);
	p.appendChild (x);
}

var state = '';

function initstate(newstate)
{
	state = newstate;
}

function setstate(newstate)
{
	if (state != newstate) {
		var loc = document.location.href;
		document.location.href = loc;
	}
}
