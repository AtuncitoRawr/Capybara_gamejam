switch (state) {
	
	case STATE_DASH:
		state = STATE_IDLE
		sprite_index = spr_player
	break;
		
	case STATE_CHECK_SHIELD:
		state = STATE_IDLE
		sprite_index = spr_player
		scrPlayerShield();
	break;
		
	case STATE_DEAD:
		image_index = image_number - 1
		image_speed = 0;
		ready_to_restart = true;
	break;
		

}

