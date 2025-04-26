if instance_exists(obj_player) and obj_player.state != STATE_DEAD{

	obj_player.followuptimer = clamp(obj_player.followuptimer - 1, 0, obj_player.followuptimermax);

	if(obj_player.followuptimer == 0){
	obj_player.hpprev = lerp(obj_player.hpprev, obj_player.hp, 0.03);
	}
} else {
	
	instance_destroy();	
}
