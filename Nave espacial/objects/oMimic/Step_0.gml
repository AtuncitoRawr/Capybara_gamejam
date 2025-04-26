direction = point_direction(x,y,tx,ty);
image_angle = direction


switch(state) {
	case STATE_IDLE:
		calc_entity_movement();
		Weighted_circle(object_index);
		Choose_action(self, target_id);
		scrEnemy_animation();
		break;
	case STATE_MOVE:
		calc_entity_movement();
		Weighted_circle(object_index);
		Choose_action(object_index, target_id);
		Check_for_player(target_id);
		check_facing();
		scrEnemy_animation();
		break;
	case STATE_ATTACK:
		calc_entity_movement();
		Perform_attack(target_id);
		check_facing();
		scrEnemy_animation();
		break;
	case STATE_KNOCKBACK:
		calc_knockback_movement();
		scrEnemy_animation();
		break;
	case STATE_DEAD:
		calc_entity_movement();
		scrEnemy_animation();
		break;
		
		
}

if hp <= 0 {
state = STATE_DEAD;	
	
}