if global.controllermode == 0 and room != rm_menu {
cursor_sprite = spr_player_cursor;
window_set_cursor(cr_none);
} else if global.controllermode == 0 {
	cursor_sprite = noone
	window_set_cursor(cr_handpoint);
} else {
	window_set_cursor(cr_none);	
	
}