var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

draw_set_alpha(alpha * alphaMax)
draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_maroon, c_maroon, false)


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha)

draw_set_font(fMenu)

//game over
var _gameoveroffset = -32;
draw_text_transformed(_camX + _camW/ 2, _camY + _camH/2 + _gameoveroffset, "Game Over", 4, 4, 0)


//presiona disparar para reiniciar
var _restarOffset = 80;
draw_text_transformed(_camX + _camW/ 2, _camY + _camH/2 + _restarOffset, "- Presiona disparar para reiniciar -", 1, 1, 0 );


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1)
