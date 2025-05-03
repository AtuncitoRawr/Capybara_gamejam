
//Obtiene los controles y los usa para obtener la direccion
getControls();
xDir = xaxisLeft;
yDir = yaxisLeft;


//Crea una velocidad fija para normalizar la velocidad
var _actualSpd = 4;
moveSpd = _actualSpd;

//Normaliza la velocidad, se movera la misma distancia en las 8 direcciones
if xDir != 0 && yDir != 0 
{
	moveSpd *= 0.707
//En caso de gamepad ajusta automaticamente la direccion independiente de la sensibilidad del control
	if xDir > 0
	{
		xDir = 1;
	} else if xDir < 0 {
		
		xDir = -1;
	}
	
	if yDir > 0
	{
		yDir = 1;
	} else if yDir < 0 {
		
		yDir = -1;
	}
	
}


//Agrega la velocidad de movimiento dependiendo la direccion

xspd = xDir * moveSpd;
yspd = yDir * moveSpd;


//Colisiones en horizontal
var _subPixel = 0.5;
if place_meeting(x + xspd, y, oWall)
{
	var _pixelCheck = _subPixel * sign(xspd)
	while !place_meeting(x + _pixelCheck, y, oWall)
	{
		x += _pixelCheck;	
	}
	xspd = 0;
}

x += xspd

//Colisiones en vertical
if place_meeting(x, y + yspd, oWall)
{
	var _pixelCheck = _subPixel * sign(yspd)
	while !place_meeting(x, y + _pixelCheck, oWall)
	{
		y += _pixelCheck;	
	}
	yspd = 0;
}

y += yspd;

//Obtener angulo de imagen

//Mouse
var _dir = point_direction(x, y, mouse_x, mouse_y);
var _diff = angle_difference(_dir, image_angle);
image_angle += _diff * 0.2;

//Disparo
if attackKeyPressed
{
	oSFX.play_sound(sndBullet)

	var _bullet = instance_create_layer(x ,y, "Instances", oBullet)
	_bullet.moveSpd = 10;
	_bullet.dir = image_angle
}

//para no desaparecer en los lados de la pantalla
move_wrap(true, false, 0)

var limite_inferior = room_height - 32
//si la coordenada y se pasa del limite, se resetea pa ser igual al limite
if (y > limite_inferior) {
    y = limite_inferior;
    //si se mueve pa abajo, velocidad 0
	//si se mueve pa arriba si se deja
    if (yspd > 0) {
        yspd = 0;
    }
}


