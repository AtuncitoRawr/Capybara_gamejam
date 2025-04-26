if (pages == noone) { exit; }


/*
var _x = 311;
var _y = 540;
*/

var _x = display_get_gui_width() / 4
var _y = display_get_gui_height() / 1.4
draw_sprite(spr_Textbox, 0, _x, _y);

draw_set_color(c_white)
draw_set_font(global.TEXTBOX_FONT);
draw_text_ext(_x + 20, _y + 12, textOnDisplay, 30, 710);