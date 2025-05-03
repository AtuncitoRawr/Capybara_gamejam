function PlayerMove()
{
	if can_move
	{
	moveDir = xaxisLeft * global.timeStop;
	} else {
		moveDir = 0;	
	}
	
if instance_exists(oCapybaraFighter)
	{
		if moveDir > 0
			{
			moveDir = 1
			} else if moveDir < 0
			{
				moveDir = -1;
			}
		face = sign(oCapybaraFighter.x - x);
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
	
	getAcelleration();

	//Agrega la velocidad de movimiento dependiendo la direccion
	

	xspd = last_dir * moveSpd;
	
	if jumpKeyBuffered && jumpCount < jumpMax {
		
			//Resetear el buffer
			jumpKeyBuffered = false;
			jumpKeyBufferTimer = 0;
			setOnGround(false)
			//Incrementar el numero de saltos contados
			jumpCount++;
		yspd = jspd[0];	
	}

	if onGround
	{
		jumpCount = 0;	
	}
	
	if oCapybaraFighter.attacking == true && moveDir != face && onGround
	{
		guarding = true;	
	} else {
		guarding = false;	
	}
}

