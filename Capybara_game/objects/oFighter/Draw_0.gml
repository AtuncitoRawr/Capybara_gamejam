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
var _leftDist = x - bbox_left
var _targetX = oCapybaraFighter.bbox_right + _leftDist;

draw_text(x + 40, y, $"onGround: {onGround}" +
$"\nJumpBuffer: {jumpKeyBufferTimer}"+
$"\nState: {state}" + 
$"\nHp: {hp}"+
$"\nBlocking : {blocking}"+
$"\nguarding: {guarding}")

draw_set_color(c_red)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
draw_set_color(c_white);