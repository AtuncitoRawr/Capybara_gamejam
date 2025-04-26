event_inherited();
switch(state) {
	case STATE_DEAD:
		image_index = image_number -1
		image_speed = 0;
	break;
	
	case STATE_ATTACK:
		image_index = 0;
		state = STATE_IDLE;
	break;
}