function scrEnemyFirstAttack(){
	
	
	ambushattack();
	
}


function normalattack() {
	
	xspd = 0;
	yspd = 0;
	moveSpd = 0;
	
	scrProcessAttacks(firstPunchSpr, sEnemy_attackHB,firstAttack.knockback_x, firstAttack.knockback_y, 
	firstAttack.knockbackOtherTime, firstAttack.attackDamage, firstAttack.frameHitStart, firstAttack.frameHitEnd);
	

	if (animation_end())
	{
			actualStartFrame = 0;
	actualEndFrame = 0;
		state = STATE_IDLE;
		image_xscale = 1;

	}
	
}

function ambushattack() {
	
	
	scrProcessAttacks(firstPunchSpr, sEnemy2_attack_HB,firstAttack.knockback_x * (xspd/1.5) * face, firstAttack.knockback_y,
	firstAttack.knockbackOtherTime, firstAttack.attackDamage, firstAttack.frameHitStart, firstAttack.frameHitEnd);
	
	if image_index < 8 {
		moveDir = sign(oPlayer.x - x)		
	}
	
	
	
	if image_index > 10 && image_index < 19
	{
		
		getAcelleration();
		
		xspd = 100 * face

	} else {
		
		xspd = 0;	
	}
	
	if (animation_end(firstPunchSpr))
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
		image_xscale = 1;
	} 	
	
}