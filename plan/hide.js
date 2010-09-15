function unhide(divID) {
    var item = document.getElementById(divId);
    if (item) {
	item.className=(item.className=='hidden')?'unhidden':'hidden';
    }
}
