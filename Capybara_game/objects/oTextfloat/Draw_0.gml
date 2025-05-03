var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(fFontBig);
draw_set_color(color);

draw_text_transformed((_camX + _camW/ 2) + tx, (_camY + _camH/2) + ty, text, size, size, 0)
//draw_text_transformed(tx, ty, text, size, size, 0)

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white)
draw_set_font(fFont);