getControls()

if face != 0
{
image_xscale = face * 2;
} else {
	image_xscale = 2;	
}

image_yscale = 2;

if attacking == false {
	actualAttackdmg = 0;	
}

alarmPause();

switch state 
{
	case STATE_IDLE:
	stateControl();
	spriteControl();
	PlayerMove();
	scrMove_and_Collide();
	break;
	
	case STATE_WALK:
	PlayerMove();
	scrMove_and_Collide();
	stateControl();
	spriteControl();
	break;
	
	case STATE_GUARD_WALK:
	PlayerMove();
	scrMove_and_Collide();
	stateControl();
	spriteControl();
	break;
	

	case STATE_JUMP:
	scrMove_and_Collide();
	stateControl();
	spriteControl();
	break;
	
	case STATE_FALL:
	scrMove_and_Collide();
	stateControl();
	spriteControl();
	break;
	
	case STATE_CROUCH:
	scrMove_and_Collide();
	stateControl();
	spriteControl();
	break;

	case STATE_ATTACK_LARGE:
	LargePunch();
	scrMove_and_Collide();
	stateControl();
	break;
	
	case STATE_AIR_KICK_LARGE:
	airLargePunch();
	scrMove_and_Collide();
	stateControl();
	break;
	
	case STATE_CROUCH_ATTACK_LARGE:
	crouchLargePunch();
	scrMove_and_Collide();
	stateControl();
	break;
	
	case STATE_KICK_LARGE:
	LargeKick();
	scrMove_and_Collide();
	stateControl();
	break;
	
	case STATE_HIT:
	calc_knockback_time();
	scrMove_and_Collide();
	spriteControl();
	break;
	
	case STATE_DEAD:
	scrMove_and_Collide();
	spriteControl();
	break;
	
	
}


if animation_end(fallSpr) && state == STATE_FALL
{
	if abs(xspd) == 0 {state = STATE_IDLE;}
	if abs(xspd) > 0 {state = STATE_WALK;}
}



moving_collsion(oCapybaraFighter)