draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, invAlpha);

if global.timeStop == 0 
{
	image_speed *= 0;	
} else if image_speed == 0 {
	image_speed += 1;	
} else {
	image_speed *= 1;	
}

/*
draw_text(x + 40, y, $"DistanceEnemy: {oFighter.x - x}" +
$"\nRangeAttack: {yspd}"+
$"\nState: {state}" +
$"\nattackTimer: {attackTimer}" +
$"\ncrouch : {allowToCrouch}"+
$"\nCan_move: {can_move}" +
$"\nKnockback {attacking}")


draw_set_color(c_red)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
draw_set_color(c_white);