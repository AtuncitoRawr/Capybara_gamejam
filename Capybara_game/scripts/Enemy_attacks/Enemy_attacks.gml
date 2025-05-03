function EnemyLargePunch() 
{
	xspd = 0;
	yspd = 0;

	scrProcessAttacks(punchLargeSpr, sCapybaraLargePunchHB, punchLarge.knockback_x, punchLarge.knockback_y,
	punchLarge.knockbackOtherTime, punchLarge.attackDamage, punchLarge.frameHitStart, punchLarge.frameHitEnd);
	
	if (animation_end())
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
	
	}
	
}

function EnemyairLargePunch() 
{
	scrProcessAttacks(airPunchLargeSpr, sCapybaraAirPunchHB, AirLarge.knockback_x, AirLarge.knockback_y,
	AirLarge.knockbackOtherTime, AirLarge.attackDamage, AirLarge.frameHitStart, AirLarge.frameHitEnd);
	
	if (animation_end(airPunchLargeSpr)) && yspd > 4|| onGround
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_JUMP;
	
	}
	
}

function EnemycrouchLargePunch()
{
	scrProcessAttacks(crouchPunchLargeSpr, sCapybaraCrounchpunchHB, CrouchLarge.knockback_x, CrouchLarge.knockback_y,
	CrouchLarge.knockbackOtherTime, CrouchLarge.attackDamage, CrouchLarge.frameHitStart, CrouchLarge.frameHitEnd);
	
	if (animation_end(crouchPunchLargeSpr))
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		image_index = 2;
		state = STATE_CROUCH;
		
	
	}
}

function EnemyLargeKick()
{
	
	xspd = 0;
	yspd = 0;
	scrProcessAttacks(kickLargeSpr, sCapybaraKickHB, kickLarge.knockback_x, kickLarge.knockback_y,
	kickLarge.knockbackOtherTime, kickLarge.attackDamage, kickLarge.frameHitStart, kickLarge.frameHitEnd);
	
	if (animation_end(kickLargeSpr))
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
	
	}
}



	
	
