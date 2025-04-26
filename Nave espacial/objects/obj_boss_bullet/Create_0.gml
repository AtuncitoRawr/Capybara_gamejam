speed= 10;
damage = 5;
range = 1600;
knockback = 4
knockback_time = 15;
owner_id = noone
image_angle = obj_queen_mimic.direction
function bullet_destroy() {
	
	speed = 0;
	instance_change(o_bullet_explosion, false);
}