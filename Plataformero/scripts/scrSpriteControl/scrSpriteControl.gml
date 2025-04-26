function scrSpriteControl(){


// Cambiar el sprite dependiendo del estado
		
	switch (state)
	{
	case STATE_IDLE: sprite_index = idleSpr break;
	case STATE_WALK: sprite_index = walkSpr break;
	case STATE_RUN: 
	
	if sprite_index != runSpr 
	{
		sprite_index = runSpr
		
		if startRunning == 0 
		{
		startRunning = 1;
		image_index = 0;
		} else {
			image_index = 2;		
		}
		
	} 
	if image_index > 2 
	{
		if animation_end(runSpr)
		{
		image_index = 2;
		}
	}
	break;
	case STATE_JUMP: 
	
		
		if sprite_index != jumpSpr
		{
		sprite_index = jumpSpr
		image_speed = 1.4
		
		if startJumping == 0 
		{
		startJumping = 1;
		image_index = 0;
		} else {
			image_index = 4;
		}
		
	} 
	if image_index > 4
	{
		image_speed = 1;
		if animation_end(jumpSpr)
		{
		image_index = 4;
		}
	}
	
	 if (abs(xspd) >= moveMaxSpd) {
			startRunning = 1;
		}
	break;
	case STATE_FALL: sprite_index = fallSpr break;
	case STATE_HIT: sprite_index = hitSpr break;
	case STATE_DEAD:
	if sprite_index != deadSpr
	{	
	sprite_index = deadSpr 
	image_index = 0;
	}
	break;
	case STATE_CHASE: sprite_index = chaseSpr break;
	case STATE_CROUCHING: sprite_index = crouchSpr break;

}
}
