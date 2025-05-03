if instance_exists(playerOwner) {

followuptimer = clamp(followuptimer - 1, 0, followuptimermax);

if(followuptimer == 0)
	healthpointprev = lerp(healthpointprev, playerOwner.hp, 0.2);
	
if playerOwner == oCapybaraFighter {
	
	self.image_xscale = -1;
	
}


}

