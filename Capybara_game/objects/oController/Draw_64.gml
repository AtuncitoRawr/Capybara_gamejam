var _halfx = display_get_gui_width() /2 - 113
var _halfy = display_get_gui_height() /9.5 - 114


if difficulty == 1
{
draw_sprite_ext(sMarco, 0, _halfx, _halfy, 3, 3,0, c_white, 1)
}

if difficulty == 2
{
image_speed = 0.3;
draw_sprite_ext(sMarco2, -1, _halfx, _halfy, 3, 3,0, c_white, 1)
}

draw_set_font(fFontBig)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if timeMax > 70
{
draw_text_color(_halfx + 113, _halfy + 175, timeMax, c_lime, c_lime, c_white, c_white, 1);
} else if timeMax > 40
{
	draw_text_color(_halfx + 113, _halfy + 175, timeMax, c_yellow, c_yellow, c_white, c_white, 1);	
} else if timeMax > 20
{
	draw_text_color(_halfx + 113, _halfy + 175, timeMax, c_orange, c_orange, c_white, c_white, 1);		
} else if timeMax > 10
{
	draw_text_color(_halfx + 113, _halfy + 175, timeMax, c_red, c_red, c_white, c_white, 1);			
} else if timeMax >= 0
{
	draw_text_color(_halfx + 113, _halfy + 175, timeMax, c_maroon, c_maroon, c_red, c_red, 1);			
}
draw_set_halign(fa_left)
draw_set_valign(fa_top)