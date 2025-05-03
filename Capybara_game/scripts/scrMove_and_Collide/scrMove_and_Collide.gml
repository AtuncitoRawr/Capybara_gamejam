function scrMove_and_Collide(){
	//Colisiones en horizontal
var _subPixel = 1;
if place_meeting(x + xspd, y, oWall)
{
	var _pixelCheck = _subPixel * sign(xspd)
	while !place_meeting(x + _pixelCheck, y, oWall)
	{
		x += _pixelCheck;	
	}
	xspd = 0;
}

x += xspd * global.timeStop;

yspd += grav * global.timeStop;
if yspd > termVel {yspd = termVel}

//Colisiones en vertical
if place_meeting(x, y + yspd, oWall)
{
	var _pixelCheck = _subPixel * sign(yspd)
	while !place_meeting(x, y + _pixelCheck, oWall)
	{
		y += _pixelCheck;	
	}
	yspd = 0;
	setOnGround(true)
	startJumping = 0;

}
y += yspd * global.timeStop;

//Automatico / forzado
if onGround && (yaxisLeft > 0 || allowToCrouch) 
{
	crouching = true;
	xspd = 0;
	
}
//Cambiar las mascaras de colision
if crouching {mask_index = crouchMaskSpr;};
		
//Transicionar para dejar de agacharse
//Manualmente
if crouching && (yaxisLeft <= 0 || jumpKeyBuffered) 
{
	//Verificar si se puede levantar
	mask_index = idleSpr;
			
	//Verificar si no hay solidos en el camino
	if !place_meeting(x, y, oWall)
	{
		crouching = false;	
	} 
	//Volver agacharse si hay una pared de por medio
	else {
		mask_index = crouchMaskSpr;	
	}
}

	

}