function scrPlayerMovement(){
	with obj_player {
rightKey = global.rightKey;
leftKey = global.leftKey;	
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
swapKeyPressed = global.swapKeyPressed;
startKeyPressed = global.startKeyPressed;	
	

	var hor = global.xaxisLeft;
	var ver = global.yaxisLeft;

	
	
	if (hor == 0 || ver == 0) and !mouse_check_button(mb_left) and obj_player.sprite_index != spr_playerCheckShield{
		sprite_index = spr_player
	}
		

	if (hor != 0 || ver != 0) {
		moveDir = point_direction(0,0,hor,ver);
		
		var _spd = 0;
		var _inputlevel = point_distance(0,0, hor, ver);
		_inputlevel = clamp(_inputlevel, 0, 1);
		_spd = moveSpd * _inputlevel;
		
		xspd = lengthdir_x(_spd, moveDir);
		yspd = lengthdir_y(_spd, moveDir)
		
		
		if place_meeting(x + xspd, y, o_solid)
		{
			xspd = 0;
		}
		if place_meeting(x,y + yspd, o_solid)
		{
			yspd = 0;	
		}
		
		x += xspd;
		y += yspd;
		/*scrCharMoveTo(4, dir);
		
	
		

		*/scrCharLookAt(moveDir);
	} 
}
// Donde esta mirando normalmente
	if global.controllermode == 0 {
	Aimdir = point_direction(x,y,mouse_x,mouse_y)
	image_angle = Aimdir;
	}
	
	if global.controllermode == 1 {
		if global.xaxisRight != 0 || global.yaxisRight != 0 {
		Aimdir = point_direction(0,0, global.xaxisRight, global.yaxisRight);	
		image_angle = Aimdir
		}
	}
}