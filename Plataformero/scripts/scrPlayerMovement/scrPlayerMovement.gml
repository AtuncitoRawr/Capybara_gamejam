function scrPlayerMovement(){
	
getControls()
	// Movimiento de X
	//Direccion
	
if onGround && fallCheck < 60 {
	
	fallCheck = 60;	
}
if can_move == true {
	moveDir = xaxisLeft * global.timeStop;
}	
	
	if !crouching 
	{
	getAcelleration();
	xspd = moveSpd * last_dir
	} else {
		
		moveSpd = 0;
		
		if moveDir > 0
		{
		moveDir = 1
		face = 1;
		} else if moveDir < 0
		{
			moveDir = -1;
			face = -1;	
		}
		
		xspd = crouchMoveSpd * moveDir;
	}
	//Resetear las variables de salto
	
	if onGround
	{
		jumpCount = 0;	
		jumpHoldTimer = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		
		//Si el jugador esta en el aire, asegurarse de que no obtengan un salto extra
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 {jumpCount = 1;}
	}
	
	//Inicializar el salto
	if jumpButton <= jumpButtonMax
	{
	
		if jumpKeyBuffered {
			jumpButton++;	
		}
	} else {
		jumpButton = jumpButtonMax;	
	}
	
	
	var _floorIsSolid = false;
	if instance_exists(myFloorPlat)
	&& (myFloorPlat.object_index == oWall || object_is_ancestor(myFloorPlat.object_index, oWall))
	{
		_floorIsSolid = true;	
	}
	
	if (yaxisLeft <= 0 || _floorIsSolid)
	{
	
		if jumpKeyBuffered && jumpCount < jumpMax && can_move == true {
		
			//Resetear el buffer
			jumpKeyBuffered = false;
			jumpKeyBufferTimer = 0;
		
			//Incrementar el numero de saltos contados
			jumpCount++;
		
			//ajustar el sostener salto
			jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		
			//Decirse a si mismo que ya no esta en el piso
			setOnGround(false);
			//No sale en el tutorial asique puede que tengas que borrarlo
			coyoteJumpTimer = 0;
	
		} 
	} else {
		
		fallCheck = 1;
		jumpKeyBufferTimer = 0;
			
	}
	
	//Saltar basandose en el tiempo/apretar el boton
	if jumpHoldTimer > 0
	{
		//ajustar constantemente la yspd para que sea la velocidad de salto
		yspd = jspd[jumpCount-1];	
		//Ir bajando el tiempo 
		jumpHoldTimer--;
	}

		//Cortarel salto si no se esta presionando el boton
	if !jumpKey
	{
		jumpHoldTimer = 0;	
	}


		
}

