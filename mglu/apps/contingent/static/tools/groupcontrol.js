
function gc_fill_faculties(id)
{
	var el = document.getElementById(id + '_faculty');
	var op;
	var i;
	var len = faculties.length;
	
	for (i = 0; i < len; i++) {
		op = document.createElement('option');
		op.setAttribute('value', faculties[i]);
		op.appendChild(document.createTextNode(faculties[i]));
		el.appendChild(op);
	}
}

function _gc_fill_department(el, faculty)
{
	var i;
	var len = departments[faculty].length;

	while (el.firstChild != null)
		el.removeChild(el.firstChild);
	
	for (i = 0; i < len; i++) {
		op = document.createElement('option');
		op.setAttribute('value', departments[faculty][i]);
		op.appendChild(document.createTextNode(departments[faculty][i]));
		el.appendChild(op);
	}
}

function _gc_fill_term(el, department)
{
	var i;

	if (!terms[department])
		return;

	var len = terms[department].length;
	
	while (el.firstChild != null)
		el.removeChild(el.firstChild);

	for (i = 0; i < len; i++) {
		op = document.createElement('option');
		op.setAttribute('value', terms[department][i]);
		op.appendChild(document.createTextNode(terms[department][i]));
		el.appendChild(op);
	}
}

function _gc_fill_group(el, ghdr)
{
	var i;
	
	if (!group_names[ghdr])
		return;

	var len = group_names[ghdr].length;
	
	while (el.firstChild != null)
		el.removeChild(el.firstChild);
	
	for (i = 0; i < len; i++) {
		op = document.createElement('option');
		op.setAttribute('value', group_ids[ghdr][i]);
		op.appendChild(document.createTextNode(group_names[ghdr][i]));
		el.appendChild(op);
	}

	el.selectedIndex = 0;
}

function gc_fill(id, layers)
{
	var pos;
	var el;
	
	if (layers >= 3) {
		el = document.getElementById(id + '_department');
		if (el.nodeName == 'SELECT') {
			pos = el.value;
			_gc_fill_department(el, document.getElementById(id + '_faculty').value);
			el.value = pos;
		}
	}
	if (layers >= 2) {
		el = document.getElementById(id + '_term');
		pos = el.value;
		_gc_fill_term(el, document.getElementById(id + '_faculty').value +
			document.getElementById(id + '_department').value);
		el.value = pos;
	}
	if (layers >= 1) {
		el = document.getElementById(id + '_group');
		pos = el.value;
		_gc_fill_group(el, document.getElementById(id + '_faculty').value +
			document.getElementById(id + '_department').value + '-' +
			document.getElementById(id + '_term').value);
		el.value = pos;
	}

	document.getElementById(id).value = document.getElementById(id + '_group').value;
}

function gc_set(id, faculty, department, term, group)
{
	document.getElementById(id + '_faculty').value = faculty;
	gc_fill(id, 3);
	document.getElementById(id + '_department').value = department;
	gc_fill(id, 2);
	document.getElementById(id + '_term').value = term;
	gc_fill(id, 1);
	document.getElementById(id + '_group').value = group;
	gc_fill(id, 0);
}
