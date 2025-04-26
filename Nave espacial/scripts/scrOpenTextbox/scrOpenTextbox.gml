function scrOpenTexbox(text){

	
	obj_Textbox.pages = scrSplitTextIntoPages(text, global.TEXTBOX_FONT, 30, 710, 141);
	obj_Textbox.page = 0;
	obj_Textbox.alarm[0] = 3;
}