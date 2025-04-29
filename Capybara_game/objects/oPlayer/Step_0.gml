getControls()
alarmPause();

if alarm[0] > 0 && global.timeStop == 1
{
	if invTimer == 0 && invAlpha == 1
	{	
		invAlpha = 0.2;
		invTimer = invFrames;
	} else if invTimer == 0 && invAlpha == 0.2 {
		
		invAlpha = 1;
		invTimer = invFrames;
	
	} else {
		invTimer--;
	}
} else {
	invAlpha = 1;	
}

image_xscale = face;

switch (state) 
{
	case STATE_IDLE: 
		scrStateControl();
		scrPlayerMovement();
		scrMove_and_colide();
		scrSpriteControl();
	break;
	
	case STATE_WALK:
		scrStateControl();
		scrPlayerMovement();
		scrMove_and_colide();
		scrSpriteControl();
	break;

	case STATE_RUN:
		scrStateControl();
		scrPlayerMovement();
		scrMove_and_colide();
		scrSpriteControl();
	break;
	
	case STATE_JUMP:
		scrStateControl();
		scrPlayerMovement();
		scrMove_and_colide();
		scrSpriteControl();
	break;
	
	case STATE_CROUCHING:
		scrStateControl();
		scrPlayerMovement();
		scrSpriteControl();
		scrMove_and_colide();

	break;
	
	case STATE_FALL:
		scrStateControl();
		scrPlayerMovement();
		scrMove_and_colide();
		scrSpriteControl();
	break;
	
	case STATE_FIRST_ATTACK:
		scrMove_and_colide();
		scrPlayerFirstAttack();
		scrSpriteControl();
	break;
	
	case STATE_SECOND_ATTACK:
		scrMove_and_colide();
		scrPlayerSecondAttack();
		scrSpriteControl();
	break;
	
	case STATE_THIRD_ATTACK:
		scrMove_and_colide();
		scrPlayerThirdAttack();
		scrSpriteControl();
	break;
	
	case STATE_AIR_ATTACK:
		scrStateControl();
		scrMove_and_colide();
		scrPlayerAirAttack();
		scrSpriteControl();
	break;
	
	case STATE_HIT:
		calc_knockback_time();
		scrMove_and_colide();
		scrSpriteControl();
	break;
	
	case STATE_DEAD:
		hp = 0; 
		xspd = 0;
		scrSpriteControl();
		if animation_end(){image_index = -1;}
	break;
	
}
	

