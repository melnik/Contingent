
// Javascript for date control

function checkDate(id)
{
	var days = new Array("Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "X");
	var mtend = new Array(31,29,31,30,31,30,31,31,30,31,30,31);

	if (m == 1 && y % 4 == 0) { mtend[1]++; }

	var d = document.getElementById(id + '_day').value;
	var m = document.getElementById(id + '_month').value - 1;
	var y = document.getElementById(id + '_year').value;

	var c = new Date(y, m, d);
	var dayOfWeek = c.getDay();

	if (isNaN(dayOfWeek))
		dayOfWeek = 7;

	if (y < 1900)
		dayOfWeek = 7;

	if ((m < 0) || (m > 11))
		dayOfWeek = 7;

	if ((dayOfWeek != 7) && ((d < 1) || (d > mtend[m])))
		dayOfWeek = 7;

	var myStyle = document.getElementById(id + '_wday').style;

	document.getElementById(id + '_wday').value = days[dayOfWeek];

	if (dayOfWeek == 7) {
		// Неправильная дата
		myStyle.color = 'red';
	} else if (dayOfWeek == 0) {
		// Воскресенье
		myStyle.color = 'red';
	} else {
		myStyle.color = 'black';
	}

	if (dayOfWeek != 7) {
		document.getElementById(id).value = y + '-' + (m+1) + '-' + d;
	} else {
		document.getElementById(id).value = '';
	}
}
