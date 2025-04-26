cam = view_camera[0];

view_width = 1920/6;
view_height = 1080/6;

window_scale = 6;

window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0]=1;

surface_resize(application_surface,view_width*window_scale,view_height*window_scale);


follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart
yTo = ystart

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;