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
	
	//Player
	playerLargePunch : new create_attack(15, 6, 0, 10, 0, 10),
	playerAirLargePunch : new create_attack(30, 8, 0, 20, 0, 10),
	playerCrouchLargePunch : new create_attack(20, 6, 0, 20, 0, 10),
	playerKick : new create_attack(20, 8, 0, 10, 0, 10),
	//Capybara
	CapybaraLargePunch : new create_attack(30, 8, 0, 30, 0, 10)

}

function hitStop(_time)
{
	if global.timeStop == 1
	{
		global.timeStop = 0
		oGame.alarm[1] = _time;
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

function scrEnemyHit(_self,_target,_dragx,_dragy,_knockbackTime,_damage)
{
	with (_target)
	{
		if alarm[0] > 0  exit;
		
		hp -= _damage
		ohpBar.followuptimer = ohpBar.followuptimermax
		flash = true;
		attacking = false;
	
		var _dir = point_direction(_self.x, _self.y, x, y);
		var _tx = 0;
		
		if _dir >= 270 && _dir <= 360 || _dir >= 0 && _dir <= 90
		{
			_tx = 1;	
		} else {
			_tx = -1;	
		}
		
		moveSpd = _dragx;
		can_move = false;
	
		//xspd = moveSpd * _target.moveDir;
		xspd = _tx * moveSpd;
		yspd = _dragy;
		
		
		setOnGround(false)
		
		knockbackSelf = _knockbackTime;


		if (hp > 0)
		{
			state = STATE_HIT;
		} else {
			oSFX.play_sound(sndLastHit)
			state = STATE_DEAD;
		}
		}
	}

function calc_knockback_time()
{
	if global.timeStop == 0 exit;
	if knockbackSelf > 0
	{
		if moveSpd > 0
		{
		moveSpd -= accel
		} else {
			moveSpd = 0;	
		}

		if moveSpd == 0 && yspd == 0
		{
		xspd = moveSpd;
		knockbackSelf--;

	}
	} else if hp > 0 {

		can_move = true;
		state = STATE_IDLE;	
		blocking = false;
	} else {

		can_move = false;
		blocking = false;
	}
}

function moving_collsion(_other)
{
	
var _push = instance_place(x + xspd, y, _other) 


	if _push != noone 
	{
		if _push.face = -1 
		{
			var _rightDist = bbox_right - x;
			var _targetX = _other.bbox_left - _rightDist;
		
			if !place_meeting(_targetX, y, oWall) && onGround
			{
				   x = lerp(x,_targetX + sign(xspd),0.2);		
			}
			
			
		}
		
		if _push.face = 1 
		{
			var _leftDist = x - bbox_left
			var _targetX = _other.bbox_right + _leftDist;
		
			if !place_meeting(_targetX, y, oWall) && onGround 
			{
		
				   x = lerp(x,_targetX + sign(xspd),0.2);			
		
			}
		}
	} 
	
}


function stateControl()
{
	
//Controlador de estados
if hp <= 0 {state = STATE_DEAD; hp = 0};
if guarding && onGround && attacking == false && oCapybaraFighter.attacking == true  {state = STATE_GUARD_WALK};
if (InteractKey) && onGround && state != STATE_FALL && !crouching {state = STATE_KICK_LARGE attacking = true;}
if (attackKeyPressed) && onGround && state != STATE_FALL && crouching {state = STATE_CROUCH_ATTACK_LARGE attacking = true ;};
if (attackKeyPressed) && !onGround && state != STATE_FALL {state = STATE_AIR_KICK_LARGE  attacking = true;};
if (attackKeyPressed) && onGround && state != STATE_FALL && !crouching {state = STATE_ATTACK_LARGE  attacking = true;};
if onGround && abs(xspd) > 0 && yspd = 0 && state != STATE_FALL && attacking == false && !guarding {state = STATE_WALK;}
if state == STATE_JUMP && onGround {state = STATE_FALL xspd = 0;}
if !onGround && yspd < 0 && attacking == false {state = STATE_JUMP;}
if abs(xspd) == 0 && yspd == 0 && state != STATE_FALL&& attacking == false && hp > 0 {state = STATE_IDLE;}
//Si se esta agachado
if crouching && attacking == false {state = STATE_CROUCH}

	if crouching != true
	{
	mask_index = maskSpr;
	}
}


function EnemystateControl()
{
	
//Controlador de estados
if hp <= 0 {state = STATE_DEAD; hp = 0};
if guarding && onGround && attacking == false && oCapybaraFighter.attacking == true  {state = STATE_GUARD_WALK};
if (allowToKick) && onGround && state != STATE_FALL && !crouching {state = STATE_KICK_LARGE attacking = true;}
if (allowToPunch) && onGround && state != STATE_FALL && crouching {state = STATE_CROUCH_ATTACK_LARGE attacking = true ;};
if (allowToPunch) && !onGround && state != STATE_FALL {state = STATE_AIR_KICK_LARGE  attacking = true;};
if (allowToPunch) && onGround && state != STATE_FALL && !crouching {state = STATE_ATTACK_LARGE  attacking = true;};
if onGround && abs(xspd) > 0 && yspd = 0 && state != STATE_FALL && attacking == false && !guarding {state = STATE_WALK;}
if state == STATE_JUMP && onGround {state = STATE_FALL xspd = 0;}
if !onGround && yspd < 0 && attacking == false {state = STATE_JUMP;}
if abs(xspd) == 0 && yspd == 0 && state != STATE_FALL&& attacking == false && hp > 0 && !crouching {state = STATE_IDLE;}
//Si se esta agachado
if crouching && attacking == false {state = STATE_CROUCH}

	if crouching != true
	{
	mask_index = maskSpr;
	}
}


function spriteControl()
{
	//Controladores de animaciones
	switch state 
	{
		case STATE_IDLE:
		if sprite_index != idleSpr
		{
			sprite_index = idleSpr
			image_index = 0;
		}
		break;
	
		case STATE_WALK:
		if sprite_index != walkSpr
		{
			sprite_index = walkSpr
			image_index = 0;
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
				image_index = 3;
			}
		}
	
		if image_index > 3
		{
			image_speed = 1;
			if animation_end(jumpSpr)
			{
			image_index = 3;
			}
		}
		break;
	
		case STATE_FALL:
		if sprite_index != fallSpr
		{
			sprite_index = fallSpr
			image_index = 0;
		}
		break;
		
		case STATE_CROUCH:
		if sprite_index != crouchSpr
		{
			sprite_index = crouchSpr
			if image_index <= 2
			{
			image_index = 0;
			}
			
		}
		
		if animation_end(crouchSpr)
		{
			image_index = -1;	
		}
		break;
		
		case STATE_GUARD_WALK:
		if sprite_index != guardSpr
		{
			sprite_index = guardSpr
			image_index = 0;
		}
		break;
		
		case STATE_HIT:
		if sprite_index != hitSpr
		{
			if !blocking
			{
			sprite_index = hitSpr
			image_index = 0;
			}
		}
		if image_index > 0
		{
			image_index = 0;	
		}
		break;
	}	
}