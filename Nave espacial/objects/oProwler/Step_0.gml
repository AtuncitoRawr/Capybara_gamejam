
if instance_exists(target_id) and state != STATE_FLEE and state != STATE_DEAD {
var _dir = point_direction(x,y,target_id.x,target_id.y);
}

path_set_kind(ppath, 1);
path_set_precision(ppath, 8);


switch(state) {
	
	case STATE_IDLE:
	Weighted_circle(object_index);
	Choose_action(object_index,target_id);
	scrEnemy_animation();
	check_life(target_id);
	Wandering_movement(object_index);
	break;
	
	case STATE_ATTACK:
	Weighted_circle(object_index);
	Choose_action(object_index,target_id);
	Prowler_attack();
	Prowler_shoot();
	scrEnemy_animation();
	check_life(target_id);
	break;
	
	case STATE_FLEE:
	Prowler_flee(target_id);
	scrEnemy_animation();
	check_life(target_id);
	break;
	
	case STATE_KNOCKBACK:
	calc_knockback_movement();
	scrEnemy_animation();
	break;
	
	case STATE_DEAD:
	calc_knockback_movement();
	scrEnemy_animation();
	break;
	
	case STATE_CURE:
	
	Prowler_regeneration(target_id);
	check_life(target_id);
	break;
}

if hp <= 0 {
state = STATE_DEAD;	
	
}