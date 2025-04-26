function scrEnemyHit(_self,_target,_dragx,_dragy,_knockbackTime,_damage)
{
	with (_target)
	{
		if alarm[0] > 0  exit;


		hp -= _damage
		flash = true;
		attacking = false;
	
		var _dir = point_direction(_self.x, _self.y, x, y);
		var _tx = 0;
		
		if _dir >= 260 && _dir <= 360 || _dir >= 0 && _dir <= 100
		{
			_tx = 1;	
		} else {
			_tx = -1;	
		}
		
		moveDir = _self.face;
		moveSpd = _dragx;
		can_move = false;
	
		//xspd = moveSpd * _target.moveDir;
		xspd = _tx * moveSpd;
		yspd = _dragy;
		
		
		setOnGround(false)
		
	
		knockbackSelf = _knockbackTime;
		if _damage != 0 && hurtTime > 0 && hp > 0{
			alarm_set(0, hurtTime);
		}


		if (hp > 0)
		{
			state = STATE_HIT;
		} else {
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
	} else {
		can_move = false;
	}
}

function scrEnemyMovement() {
	
if distance_to_object(oPlayer) <= rangeVision && oPlayer.state != STATE_DEAD
{
	state = STATE_CHASE;
} else {
	scrEnemyRest();
}
	
if moveDir != 0 && can_move
	{
		if last_dir != moveDir
		{
			last_dir = moveDir;
			moveSpd = 0;
		}
		
		if moveSpd <= moveMaxSpd
		{
			runType = 0;
			moveSpd += accel;	
		} else {
			runType = 1;	
		}
	}
	else
	{
		if moveSpd > 0
		{
			moveSpd -= accel;
		}
		
	}
if moveSpd < accel
{
	moveSpd = 0;
	last_dir = 0;
}
	
	
xspd = moveSpd * last_dir * global.timeStop;
	

scrMove_and_colide();
	
}

function scrEnemyPatrol(){
	
	if patrolMoveTimer <= 0 && patrolMove == true {
		moveDir = 0;
		patrolMoveTimer = patrolMoveFrames;
		patrolMove = false;
		state = STATE_IDLE;
		} else if patrolMove == true  {
			patrolMoveTimer--;
		} else {
		   patrolMoveTimer = patrolMoveFrames;
		}
	
	
}

function scrEnemyRest(){
	
		if patrolRestTimer <= 0 && patrolMove == false  {
	
		moveDir = face * -1;
		patrolRestTimer = patrolRestFrames; 
		patrolMove = true;
		state = STATE_WALK;
	} else if patrolMove == false {
		patrolRestTimer--;
	} else {
		patrolRestTimer = patrolRestFrames;	
	}
	
	
}

function scrEnemyChase(){
	
	if distance_to_object(oPlayer) > attackDistance
	{

	moveDir = sign(oPlayer.x - x);

	patrolMove = false;
	patrolMoveTimer = 0;
	patrolRestTimer = 0;
	attackDelayTimer = attackDelayFrames;
	} else {
		
		moveDir = sign(oPlayer.x - x);
		
		
		if attackDelayTimer == 0
		{
		attackDelayTimer = attackDelayFrames;
		state = STATE_FIRST_ATTACK;
		attacking = true;
		} else {
				attackDelayTimer--;
		}
	}
	

	if distance_to_object(oPlayer) <= rangeVision {
	
	
	rayCastWall();



	} else {
		state = STATE_IDLE;	
		target = 0;
		rayX = 0;
		rayY = 0;
	}
}


function rayCastWall() {
	
		if rayDelayTimer <= 0 {
	
		var _rayVision = Raycast(x, y - 100, rangeRay * moveDir + x, y - 100, oWall);

		target = _rayVision[0];
		rayX = _rayVision[1];
		rayY = _rayVision[2];


		if target != noone {
			if target.type == 1 {
	
			target_name = "slope";	
			} 
	
			if target.type == 0 {
	
			target_name = "wall";	
			yspd = jspd;	
			setOnGround(false);
	
			} 
	

		} else {
			target_name = "";		

		}
	
		rayDelayTimer = rayDelayFrames;

	} else {
		rayDelayTimer--;
	}	
}


function rayCastAir() 
{
	
	if rayDelayAirTimer < 0
	{
		var _rayAir = Raycast(x + (moveDir * 500), y - 100, x + (moveDir * 500), y , oWall)
		targetAir = _rayAir[0];
		rayAirX = _rayAir[1];
		rayAirY = _rayAir[2];
		
		if targetAir == noone 
		{
			moveSpd = 0;	
			moveDir = moveDir * -1;
			moveSpd = moveMaxSpd;
		}
		
	}
		
	
}





