function enemyMove()
{

	
	if can_move == true 
	{
		if allowToMove
		{

			moveDir = sign(oFighter.x - x) * global.timeStop;
		}
		
		if allowToGuard
		{
			moveDir = (sign(oFighter.x - x)* -1) * global.timeStop;
		}
	} else {
		moveDir = 0;	
	}
	
	if instance_exists(oFighter)
	{
		if moveDir > 0
			{
			moveDir = 1
			} else if moveDir < 0
			{
				moveDir = -1;
			}
		face = sign(oFighter.x - x);
	} else
	{
		if moveDir > 0
			{
			moveDir = 1
			face = 1;
			} else if moveDir < 0
			{
				moveDir = -1;
				face = -1;	
			}
	}
	
	if can_move == false
	{
		xspd = 0;
		moveDir = 0;
		yspd = 0;
	}
	
	getAcelleration();
	

	//Agrega la velocidad de movimiento dependiendo la direccion

	xspd = last_dir * moveSpd;
	
	if allowToJump && jumpCount < jumpMax{
		
			//Resetear el buffer
			allowToJump = false;
			setOnGround(false)
			//Incrementar el numero de saltos contados
			jumpCount++;
		yspd = jspd[0];	
	}

	if onGround
	{
		jumpCount = 0;	
	}		
	
	if (oFighter.attacking == true || allowToGuard) && moveDir != face && onGround
	{
		guarding = true;	
	} else {
		guarding = false;	
	}
}

function iaRandomFirstVersion()
{
	//Ia
attackRange = 50;
var _distant = oFighter.x - x

if abs(_distant) > attackRange
{
	allowToPunch = false;	
	allowToKick = false;
	allowToCrouch = false;	

	
	if moveTimer <= 0
	{
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
	
}