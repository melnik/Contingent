function classifier_onchange(classifier)
{
	eval ("document.main_form." + classifier + "_code.value = " +
		"document.main_form." + classifier + "_id.value.split" +
		"(':')[1];");
}
