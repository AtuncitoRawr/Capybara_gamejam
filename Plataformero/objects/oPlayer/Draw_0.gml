//Dibujarse a si mismo

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, invAlpha);


if global.timeStop == 0 
{
	image_speed *= 0;	
} else if image_speed == 0 {
	image_speed += 1;	
} else {
	image_speed *= 1;	
}

if global.showStats == 0 exit;
draw_set_font(Fcondorito)
draw_set_color(c_black)


draw_set_colour(c_red);
draw_set_alpha(0.5);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);

draw_set_alpha(1);
draw_set_color(c_black)

var _dir = point_direction(x,y, mouse_x, mouse_y)


draw_text(x - 400, y - 500, oItem_manager.selected_item)

draw_text(x - 400, y - 700, xspd)

draw_text(x - 400, y - 900, hp)