// Ugly include...
document.write('<script language="javascript" src="/cookie.js"></script>');

function height()
{
	if (document.all != null) {
		// IE-specific
		if (document.body) {
		        return document.body.clientHeight;
		} else {
			return 0;
		}
	} else {
	        return window.innerHeight;
	}
}

function tabframe(name)
{
	var w = window;
	var c = 20;
	while ((!eval("w." + name)) && (w != w.parent) && (c > 0)) {
		w = w.parent;
		c = c - 1;
	}
	if (c == 0) {
		alert("No such frame (" + name + ") found");
		return null;
	}
	return w;
}

function find_frameset(parent_frame, frame_name)
{
	var fs = parent_frame.document.getElementsByTagName('FRAME');
	for (var i = 0; i < fs.length; i++) {
		if (fs[i].name == frame_name)
			return fs[i].parentNode;
	}
	alert('Parent frameset not found');
	return null;
}

function find_panel(frameset, frame_name)
{
	var fs = frameset.getElementsByTagName('FRAME');
	for (var i = 0; i < fs.length; i++) {
		if (fs[i].name == frame_name)
			return i;
	}
	alert('Frame not found');
	return null;
}

function sizestr(osizestr, index, newpanelsize)
{
	sa = osizestr.split(',');
	sa[index] = newpanelsize;
	return sa.join(',');
}

function panel_shown(fs, i)
{
	var h = fs.getAttribute('rows').split(',')[i];
	return (h > 0);
}

function outer_height(parent_frame, name)
{
	if (eval("parent_frame." + name + ".height"))
		return eval("parent_frame." + name + ".height()");
	else
		return null;
}

function hide_panel(name)
{
	var w = tabframe(name);
	var p = find_panel(find_frameset(w, name), name);

	var prevheight = getCookie('frame_' + name + '_height');
	if (prevheight == null || prevheight == '' || prevheight == 0) {
		setCookie('frame_' + name + '_height', outer_height(w, name));
		var fs = find_frameset(w, name);
		fs.setAttribute('rows', sizestr(fs.getAttribute('rows'), p, 0));
    }
}

function show_panel(name, need_clear, default_height)
{
	var w = tabframe(name);
	var fs = find_frameset(w, name);
	var p = find_panel(fs, name);

	if (!panel_shown(fs, p)) {
		var newheight = getCookie('frame_' + name + '_height');
		if (!(newheight > 0))
			newheight = default_height;

		fs.setAttribute('rows', sizestr(fs.getAttribute('rows'), p, newheight));
		deleteCookie('frame_' + name + '_height')
	}

	if (need_clear)
		eval("w." + name + ".location.href = 'about:blank'");
}

function go_to(url)
{
	document.location.href = url;
}
