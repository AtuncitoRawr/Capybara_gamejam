function calc_movement(){
	
	x += hsp;
	y += vsp;
	switch(state) {
		default: var _drag = 0.15; break;
		case STATE_DEAD: var _drag = 0.08; break
	}
	hsp = lerp(hsp, 0, _drag);
	vsp = lerp(vsp, 0, _drag);
}