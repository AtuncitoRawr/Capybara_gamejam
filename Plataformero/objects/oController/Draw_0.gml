var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _halfx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) /2 
var _halfy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) /2


if global.showStats == 0 exit;
draw_set_color(c_dkgray)
draw_rectangle(_x + 40, _y + 40, _x + 1140, _y + 740, false)
draw_set_color(c_ltgrey)
draw_rectangle(_x + 40, _y + 40, _x + 1140, _y + 730, true)

draw_set_color(c_white)
if gamepad_is_connected(0) &&  global.controllermode == 1
{
	draw_text(_x + 140 , _y + 100, gamepad_get_description(0));
} else {
	draw_text(_x + 140 , _y + 100, "NINGUNO");
}
draw_text(_x + 140 , _y + 500, camera_get_view_width(view_camera[0]));
draw_text(_x + 140 , _y + 400, fps);
draw_text(_x + 140 , _y + 300, global.timeStop);
draw_text(_x + 140 , _y + 200, global.delta_multiplier);

draw_line_width(_halfx, _halfy + 1800, _halfx, _halfy - 1800, 20)
