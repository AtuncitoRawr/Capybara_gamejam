if (surface_exists(surface)) {
	
var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

	surface_set_target(surface);
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(0,0,_cw,_ch,0);
	
gpu_set_blendmode(bm_subtract);

	with (o_linterna) {
	
	draw_sprite_ext(sLuz, 0, x - _cx, y - _cy, 1.2 + random(0.1), 1.2 + random(0.1), 0,c_white,1);
	}
	
	with (o_ilumination) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLuz, 0, x - _cx, y - _cy, 1.2 + random(0.1), 1.2 + random(0.1), 0,c_white,1);
	gpu_set_blendmode(bm_normal)
	}
	
	with (obj_player) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLuz, 0, x - _cx, y - _cy, 0.2 + random(0.05), 0.2 + random(0.05), 0,c_white,1);
	gpu_set_blendmode(bm_normal)
	}
	
	with (o_bottle) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLuz, 0, x - _cx, y - _cy, 0.4 + random(0.05), 0.4 + random(0.05), 0,c_white,1);
	gpu_set_blendmode(bm_normal)
	}
	
	with (o_tutorial) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sLuz, 0, x - _cx, y - _cy, 1.5 + random(0.05), 1.5 + random(0.05), 0,c_white,1);
	gpu_set_blendmode(bm_normal)
	}
	
	gpu_set_blendmode(bm_normal)
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surface,_cx,_cy);
	draw_set_color(c_white);
	}
	
if (!surface_exists(surface)) {
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	
	surface = surface_create(_cw,_ch);
	
	surface_set_target(surface);
	draw_set_color(c_white);
	draw_set_alpha(0.8);
	draw_rectangle(0,0,_cw,_ch,0);
	
	surface_reset_target();
	
	
}