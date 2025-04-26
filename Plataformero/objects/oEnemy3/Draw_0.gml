draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

if global.timeStop == 0 
{
	image_speed *= 0;	
} else if image_speed == 0 {
	image_speed += 1;	
} else {
	image_speed *= 1;	
}


if global.showStats == 0 exit;
//hitbox
draw_set_color(c_red);
draw_set_alpha(0.3);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
draw_set_alpha(1);
//raycast de solidos
if state == STATE_CHASE
{
draw_set_color(c_lime)
draw_arrow(x,y - 100, rayX, rayY, 100);
}
//datos / temporizadores
draw_set_color(c_white)
draw_text(x - 500, y - 700, state)
draw_text(x - 500, y - 900, crushTimer)



//rangos/distancias

draw_set_colour(c_ltgray);
draw_set_alpha(0.5);
draw_circle(x,y, rangeVision, true);
draw_set_color(c_red);
draw_circle(x,y, attackDistance, true);
draw_set_alpha(1);
draw_set_color(c_black);