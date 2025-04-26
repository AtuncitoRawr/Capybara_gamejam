if instance_exists(obj_queen_mimic) {

followuptimer = clamp(followuptimer - 1, 0, followuptimermax);

if(followuptimer == 0)
	healthpointprev = lerp(healthpointprev, obj_queen_mimic.hp, 0.2);
	

}

if instance_exists(obj_player) {
	if obj_player.state == STATE_DEAD {
	
	instance_destroy();	
	
	}
}