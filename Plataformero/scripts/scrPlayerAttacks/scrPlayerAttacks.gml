function create_attack(_damage = 0, _dragx = 0, _dragy = 0, _knockbackTime = 0, _framestart = 0, _frameend = 0) constructor
{
	attackDamage = _damage;
	knockback_x = _dragx;
	knockback_y = _dragy;
	knockbackOtherTime = _knockbackTime;
	frameHitStart = _framestart;
	frameHitEnd = _frameend;
}

global.attackList = {
	
	//MerluzoBoy
	fishfirstSlap : new create_attack(30, 15, 0, 30, 5, 8),
	fishSecondSlap : new create_attack(30, 15, 0, 30, 2, 5),
	fishThirdBoink : new create_attack(60, 40, -100, 1, 4, 8),
	airKick : new create_attack(50, 40, -90, 1, 2, 6),
	diagonalairkick : new create_attack(50, 50, -60, 1, 2, 6),
	smashdownpunch : new create_attack(50, 1, 200, 1, 3, 8),
	//Cubito
	assault : new create_attack(50,30, 0, 1, 2, 7),
	ambush : new create_attack(100, 1, -100, 1, 11,18)
	
}


function hitStop(_time)
{
	if global.timeStop == 1
	{
		global.timeStop = 0
		oController.alarm[0] = _time;
	}
}

function hitStopValues(_damage)
{
	var _value = 0;
	if _damage <= 10 {_value = 1;}	
	if _damage > 10 && _damage < 30 {_value = 5;}
	if _damage >= 30 && _damage < 80 {_value = 10;}
	if _damage >= 80 {_value = 30;}
	
	return _value;
	
	
	
}
	
	



function scrPlayerFirstAttack() 
{
	xspd = 0;
	yspd = 0;
	moveSpd = 0;
	
	
	scrProcessAttacks(firstPunchSpr, sMerluzoboy_fPunchHB, firstAttack.knockback_x, firstAttack.knockback_y,
	firstAttack.knockbackOtherTime, firstAttack.attackDamage, firstAttack.frameHitStart, firstAttack.frameHitEnd);
	
	getAcelleration();
	
	if (attackKeyPressed) && (image_index >= 3 && image_index <= 8) && ds_list_size(hitByAttack) > 0
	{
		state = STATE_SECOND_ATTACK;	
	}

	if (animation_end())
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
		image_xscale = 1;

	}
	
}


function scrPlayerSecondAttack() 
{
	xspd = 0;
	yspd = 0;
	moveSpd = 0;
	
	scrProcessAttacks(secondPunchSpr, sMerluzoboy_sPunchHB,secondAttack.knockback_x, secondAttack.knockback_y, 
	secondAttack.knockbackOtherTime, secondAttack.attackDamage, secondAttack.frameHitStart, secondAttack.frameHitEnd);

	
	
	if (attackKeyPressed) && image_index >= 2 && image_index <= 5 && ds_list_size(hitByAttack) > 0 
	{
		state = STATE_THIRD_ATTACK;	
	}

	if (animation_end())
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
		image_xscale = 1;

	}
	
}


function scrPlayerThirdAttack() 
{
	xspd = 0;
	yspd = 0;
	moveSpd = 0;

	
	scrProcessAttacks(thirdPunchSpr, sMerluzoboy_tPunchHB,thirdAttack.knockback_x, thirdAttack.knockback_y, 
	thirdAttack.knockbackOtherTime, thirdAttack.attackDamage, thirdAttack.frameHitStart, thirdAttack.frameHitEnd);
	

	if (animation_end())
	{
		actualStartFrame = 0;
		actualEndFrame = 0;
		attacking = false;
		state = STATE_IDLE;
		image_xscale = 1;

	}
	
}

function scrPlayerAirAttack() 
{
	normalAirKick();
	
}

function normalAirKick()
{
	
	scrProcessAttacks(airSpr, sMerluzoboy_airattack_HB,airAttack.knockback_x, airAttack.knockback_y, 
	airAttack.knockbackOtherTime, airAttack.attackDamage, airAttack.frameHitStart, airAttack.frameHitEnd);
	
	if image_index > 2 && image_index <= 6
	{
		

		// Movimiento de X
		//Direccion

			getAcelleration();
			xspd = moveSpd * last_dir
			jumpHoldTimer = 0;
			yspd = -5;	
			fallCheck = 1;
		} 
	
	
	if (animation_end(airSpr) || onGround)
	{
		
	actualStartFrame = 0;
	actualEndFrame = 0;
		attacking = false;
		state = STATE_FALL;
		fallCheck = 1;
		image_xscale = 1;
	} 	
}


function diagonalDownKick() {
	
	scrProcessAttacks(airSpr, sMerluzoboy_airattack_HB, diagonalAirkick.knockback_x, diagonalAirkick.knockback_y, 
	diagonalAirkick.knockbackOtherTime, diagonalAirkick.attackDamage, diagonalAirkick.frameHitStart, diagonalAirkick.frameHitEnd);
	if image_index > 4 && image_index < 8
	{
		
	getControls()
		// Movimiento de X
		//Direccion
	if can_move == true {
		moveDir = xaxisLeft;
	}	
		getAcelleration();
		var _xto = 0
		
		if face == 1
		{
			_xto = 3;	
		} else if face == -1 {
			_xto = -3;	
		}
		
		
		xspd = 30 * _xto
		jumpHoldTimer = 0;

		yspd += 40;	
	} else {
	if yspd > termVel {yspd = termVel;};
	
	if yspd >= fallCheck && !jumpKeyBuffered {falling = true;}
	
	if yspd < fallCheck {
		
		falling = false;	
	}
	}
	
	if (animation_end(airSpr) || onGround)
	{
		
			actualStartFrame = 0;
	actualEndFrame = 0;
		attacking = false;
		state = STATE_FALL;
		image_xscale = 1;
	} 	
}

function smashDownAirPunch(){
		scrProcessAttacks(thirdPunchSpr, sMerluzoboy_tPunchHB,smashDownPunch.knockback_x, smashDownPunch.knockback_y, 
		smashDownPunch.knockbackOtherTime, smashDownPunch.attackDamage, smashDownPunch.frameHitStart, smashDownPunch.frameHitEnd);
	if image_index > 4 && image_index <= 8
	{
		
		getControls()
		// Movimiento de X
		//Direccion
	if can_move == true {
		moveDir = xaxisLeft;
	}	
		getAcelleration();
	
		
		xspd = 1 * last_dir
		jumpHoldTimer = 0;

		yspd += 60;	
	} else {
	if yspd > termVel {yspd = termVel;};
	
	if yspd >= fallCheck && !jumpKeyBuffered {falling = true;}
	
	if yspd < fallCheck {
		
		falling = false;	
	}
	}
	
	if (animation_end(airSpr) || onGround)
	{
		
			actualStartFrame = 0;
	actualEndFrame = 0;
		attacking = false;
		state = STATE_FALL;
		image_xscale = 1;
	} 		
}