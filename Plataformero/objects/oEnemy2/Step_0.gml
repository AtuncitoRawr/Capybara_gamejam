if moveDir == 1 {
	face = 1;	
} else if moveDir == -1 {
	face = -1	
}

switch (state)
{
	case STATE_IDLE:
	scrEnemyMovement();
	scrSpriteControl();
	break;
	
	case STATE_WALK:
	scrEnemyMovement();
	scrSpriteControl();
	break;
	
	case STATE_CHASE:
	scrEnemyMovement();
	scrEnemyChase();
	scrSpriteControl();
	break;
	
	case STATE_HIT:
	calc_knockback_time();
	scrMove_and_colide();
	scrSpriteControl();
	break;
	
	case STATE_FIRST_ATTACK:
	scrMove_and_colide();
	scrEnemyFirstAttack();
	scrSpriteControl();
	break;
	
	case STATE_DEAD:
	calc_knockback_time();
	scrMove_and_colide();
	if animation_end() {instance_destroy()}
	scrSpriteControl();
	break;
	
}