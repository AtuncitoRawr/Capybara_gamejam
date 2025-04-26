speed= 10;
damage = 5;
range = 600;
knockback = 6
knockback_time = 30;
owner_id = noone

function bullet_destroy() {
	
	speed = 0;
	instance_change(o_bullet_explosion, false);
}