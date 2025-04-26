


//Actualizacion de la camara

if (instance_exists(follow))
{
	if abs(follow.xspd) < 30
	
	{
		xTo = follow.x
		yTo = follow.y 
	}
	
	var _camxspd = abs(follow.xspd) * 42;
	var _camyspd = abs(follow.yspd)

	

	//if follow.moveDir > 0 && follow.moveSpd[follow.runType] > 14
	if follow.moveDir > 0 && abs(follow.xspd) >= 30
	
	{
		xTo = follow.x + _camxspd;
		yTo = follow.y + _camyspd;
	}
	
	//if follow.moveDir < 0 && follow.moveSpd[follow.runType] > 14
	if follow.moveDir < 0 && abs(follow.xspd) >= 30
	{
		xTo = follow.x - _camxspd;
		yTo = follow.y - _camyspd
	}

}

//Actualizar la posicion del objeto

x += (xTo - x) / 30 * global.timeStop;
y += (yTo - y) / 10 * global.timeStop;

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff) 
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff) 

//ScreenShake

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Actualizar la vista de la camara

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
