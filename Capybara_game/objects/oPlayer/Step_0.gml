
if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
{
	scrCreateTextbox(text_id);
}


moveDir = keyboard_check(ord("D")) - keyboard_check(ord("A"));

xspd = moveSpd * moveDir;


//La direccion del mouse
var _dir = point_direction(x,y,mouse_x, mouse_y)

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

yspd += grav;

if keyboard_check_pressed(vk_space) && place_meeting(x, y+1, oWall)
{
	yspd = jspd;	
}


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
