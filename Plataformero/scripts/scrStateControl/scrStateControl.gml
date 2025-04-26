function scrStateControl(){

//Cambiar el estado
	
	//Si esta muerto 
	if (hp <= 0) {state = STATE_DEAD;}
	//si se ataca
	if (attackKeyPressed) && onGround && coyoteHangTimer >= coyoteHangFrames {state = STATE_FIRST_ATTACK attacking = true;}
	//si se ataca en el aire
	if (attackKeyPressed) && !onGround && airAttackCount < airAttackMaxCount {state = STATE_AIR_ATTACK attacking = true airAttackCount++;}
	//Si se esta caminando
	if abs(xspd) > 0  && yspd == 0 && runType == 0 && attacking == false {state = STATE_WALK;}
	//Si se esta corriendo
	if abs(xspd) > 0  && yspd == 0 &&  runType == 1 && attacking == false {state = STATE_RUN;}
	//Si se esta quieto
	if abs(xspd) == 0 && yspd == 0 && attacking == false {state = STATE_IDLE;}
	//Si se inicia el salto
	if !onGround && jumpButton > 0 && falling == false && attacking == false  {state = STATE_JUMP;}
	//Si esta cayendo
	if falling == true && !onGround && attacking == false  {state = STATE_FALL;}
	//Si se esta agachado
	if crouching {state = STATE_CROUCHING}
	

		//Ajustar la mascara de colision
		mask_index = maskSpr;
		if crouching {mask_index = crouchSpr;};
	

}