if instance_exists(oShield) and oShield.state != STATE_DEAD{

	oShield.followuptimer = clamp(oShield.followuptimer - 1, 0, oShield.followuptimermax);

	if(oShield.followuptimer == 0){
	oShield.hpprev = lerp(oShield.hpprev, oShield.hp, 0.03);
	}
} else {
	
	instance_destroy();	
}
