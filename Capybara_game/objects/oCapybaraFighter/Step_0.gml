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
	EnemystateControl();
	spriteControl();
	enemyMove();
	scrEnemyMove_and_Collide();
	break;
	
	case STATE_WALK:
	enemyMove();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	spriteControl();
	break;
	
	case STATE_GUARD_WALK:
	enemyMove();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	spriteControl();
	break;
	

	case STATE_JUMP:
	scrEnemyMove_and_Collide();
	EnemystateControl();
	spriteControl();
	break;
	
	case STATE_FALL:
	scrEnemyMove_and_Collide();
	EnemystateControl();
	spriteControl();
	break;
	
	case STATE_CROUCH:
	scrEnemyMove_and_Collide();
	EnemystateControl();
	spriteControl();
	break;

	case STATE_ATTACK_LARGE:
	EnemyLargePunch();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	break;
	
	case STATE_AIR_KICK_LARGE:
	EnemyairLargePunch();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	break;
	
	case STATE_CROUCH_ATTACK_LARGE:
	EnemycrouchLargePunch();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	break;
	
	case STATE_KICK_LARGE:
	EnemyLargeKick();
	scrEnemyMove_and_Collide();
	EnemystateControl();
	break;
	
	case STATE_HIT:
	calc_knockback_time();
	scrEnemyMove_and_Collide();
	spriteControl();
	break;
	
	case STATE_DEAD:
	scrEnemyMove_and_Collide();
	spriteControl();
	break;
}

if animation_end(fallSpr) && state == STATE_FALL
{
	state = STATE_IDLE;	
}

moving_collsion(oFighter)

//Ia
attackRange = 60;
var _distant = oFighter.x - x

if abs(_distant) > attackRange
{
	allowToPunch = false;	
	allowToKick = false;
	allowToCrouch = false;	
	if moveTimer <= 0
	{
		
var _weight = choose_weighted(Behavior[0,0], Behavior[1, 0], Behavior[0,1], Behavior[1,1], 
Behavior[0,2], Behavior[1,2]);

var _behav = _weight;
	switch _behav
	{
		case Behavior[0,0]:
		if Behavior[1,0] == PIECE {Behavior[1,0] = NOTHING}
		if Behavior[1,0] == COMPLETE {Behavior[1,0] = PIECE}
		break;
		
		case Behavior[0,1]:
		if Behavior[1,1] = PIECE {Behavior[1,1] = NOTHING}
		if Behavior[1,1] == COMPLETE {Behavior[1,1] = PIECE }
		break;
		
		case Behavior[0,2]:
		if Behavior[1,2] = PIECE {Behavior[1,2] = NOTHING}
		if Behavior[1,2] = COMPLETE {Behavior[1,2] = PIECE}
		break;
	}
	
	switch _behav
	{
		case Behavior[0, 0]:
		
		
		break
		
		
	}
		
		
		moveTimer = moveDelay
		allowToMove = false;
		allowToGuard = false;
		allowToJump = false;
		
		var _tactic = irandom(3)
		
		if _tactic == 1 {allowToMove = true;}
		if _tactic == 2 {allowToGuard = true ;}
		if _tactic == 3  {allowToJump = true;}
		
		
	} else {
		moveTimer--;	
	}
} else
	{
		allowToMove = false;
		allowToGuard = false;
		allowToJump = false;
	
			if attackTimer <= 0
			{
			attackTimer = attackDelay
			allowToPunch = false;	
			allowToKick = false;
			allowToCrouch = false;	
			if oFighter.onGround
			{
			var _attack = irandom(3)
	
			if _attack == 1 {allowToPunch = true;}
			if _attack == 2 {allowToKick = true;}
			if _attack == 3 {allowToCrouch = true;}
			if _attack == 3 && state = STATE_CROUCH {allowToPunch = true;}
		
			}
		} else {
			attackTimer--;
	}

} 





