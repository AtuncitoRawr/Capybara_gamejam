function controlSetup() {
	

bufferTime = 22;

jumpKeyBuffered = 0;
jumpKeyBufferTimer = 0;

		
}

function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
		airAttackCount = 0;
	} else {
		onGround = false;
		myFloorPlat = noone;
		coyoteHangTimer = 0;
	}
}


function setOnGroundItem(_val = true)
{
	if _val == true
	{
		onGround = true;

	} else {
		onGround = false;
		myFloorPlat = noone;
	}
}

function getAcelleration()
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
		
	if moveDir != 0
		{
			if last_dir != moveDir
			{
				last_dir = moveDir;
				moveSpd = 0;
			}
		
			if moveSpd < moveMaxSpd
			{
				runType = 0;
				moveSpd += accel;	
			} else {
				runType = 1;	
				moveSpd = moveMaxSpd
			}
		}
		else
		{
			if moveSpd < moveMaxSpd
			{
				runType = 0;	
				startRunning = 0
			}
			
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
}

function checkForSemiSolidPlataform(_x, _y)
{
	//Crear una variable de return
	var _rtrn = noone;
	
	//No deberiamos movernos arriba, y entonces verificar por una colision
	if yspd >= 0 && place_meeting(_x,_y, oSemiSolidWall)
	{
		//Crear una lista DS para guardar todas las colisiones de la instancia oSemiSolidWall
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, oSemiSolidWall, _list, false);
		
		//Hacer un bucle con las coliciones y solo retornar la que este por debajo del jugador
		for(var i = 0;i< _listSize;i++)
		{
			var _listInst = _list[| i]
			if _listInst != myFloorPlat && floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			{
				//Retornar el id de una plataforma semisolida
				_rtrn = _listInst;
				//Salir del bucle antes
				i = _listSize;
			}
		}
		//destruir la lista DS para liberar memoria
		ds_list_destroy(_list);
	}
	
	//Retornar nuestra variable
	return _rtrn;
}

function alarmPause()
{
	if global.timeStop == 0
	{
		if alarm[0] > 0
		{
			alarm[0]++;
		}
	}
}

function getControls()
{

		var _gamepad = 0;
	//Movimiento
	
		rightKey = keyboard_check(ord("D")) + gamepad_button_check(_gamepad, gp_padr) + keyboard_check(vk_right);
		rightKey = clamp(rightKey, 0, 1);
		
		leftKey = keyboard_check(ord("A")) + gamepad_button_check(_gamepad, gp_padl) + keyboard_check(vk_left);
		leftKey = clamp(leftKey, 0, 1);
		
		upKey = keyboard_check(ord("W")) + gamepad_button_check(_gamepad, gp_padu) + keyboard_check(vk_up);
		upKey = clamp(upKey, 0, 1);
		
		downKey = keyboard_check(ord("S")) + gamepad_button_check(_gamepad, gp_padd) + keyboard_check(vk_down);
		downKey = clamp(downKey, 0, 1);
		
		xaxisLeft = gamepad_axis_value(_gamepad, gp_axislh) + (rightKey - leftKey);
		yaxisLeft = gamepad_axis_value(_gamepad, gp_axislv) + (downKey - upKey);
	
		xaxisLeft = clamp(xaxisLeft, -1, 1);
		yaxisLeft = clamp(yaxisLeft, -1, 1);
		
//Menu
		
		rightKeyPressed = keyboard_check_pressed(ord("D")) + gamepad_button_check_pressed(_gamepad, gp_padr) + keyboard_check_pressed(vk_right);
		rightKeyPressed = clamp(rightKeyPressed, 0, 1);
		
		leftKeyPressed = keyboard_check_pressed(ord("A")) + gamepad_button_check_pressed(_gamepad, gp_padl) + keyboard_check_pressed(vk_left);
		leftKeyPressed = clamp(leftKeyPressed, 0, 1);
		
		upKeyPressed = keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(_gamepad, gp_padu) + keyboard_check_pressed(vk_up);
		upKeyPressed = clamp(upKeyPressed, 0, 1);
		
		downKeyPressed = keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(_gamepad, gp_padd) + keyboard_check_pressed(vk_down);
		downKeyPressed = clamp(downKeyPressed, 0, 1);
		
		
//Acciones
		InteractKey = keyboard_check_pressed(ord("X")) + gamepad_button_check_pressed(_gamepad, gp_face3);
		InteractKey = clamp(InteractKey, 0, 1);

		jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(_gamepad, gp_face1);
		jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
		
		jumpKey = keyboard_check(vk_space) + gamepad_button_check(_gamepad, gp_face1);
		jumpKey = clamp(jumpKey, 0, 1);
		
		ActionKey = keyboard_check_pressed(vk_shift) + mouse_check_button_pressed(mb_right) + gamepad_button_check_pressed(_gamepad,gp_face2);
		ActionKey = clamp(ActionKey, 0, 1);
		
		loopKey = keyboard_check_pressed(ord("C")) + gamepad_button_check_pressed(_gamepad,gp_shoulderrb);
		loopKey = clamp(loopKey, 0, 1);
		
		
		startKeyPressed = keyboard_check_pressed(vk_enter) + gamepad_button_check_pressed(_gamepad, gp_start);
		startKeyPressed = clamp(startKeyPressed, 0, 1);
		
		attackKeyPressed = keyboard_check_pressed(ord("Z")) + mouse_check_button_pressed(mb_left) + gamepad_button_check_pressed(_gamepad, gp_shoulderr);
		attackKeyPressed = clamp(attackKeyPressed, 0, 1);

//Buffering con el salto
		
		if jumpKeyPressed
		{
			jumpKeyBufferTimer = bufferTime;	
		}
		
		if jumpKeyBufferTimer > 0
		{
			jumpKeyBuffered = 1;
			jumpKeyBufferTimer--;
		} else {

			jumpKeyBuffered = 0;	
		}

}


function scrCheck_gamepad(_gamepad){
	check = false;
	
	var _right,_left,_up,_down,_xaxisleft,_yaxisleft,_xaxisright,_yaxisright,_face1,_face2,_face3,
	_face4,_start,_select,_lb,_lt,_rb,_rt	
	
	_right = gamepad_button_check(_gamepad, gp_padr) 
	_left =  gamepad_button_check(_gamepad, gp_padl);
	_up   =  gamepad_button_check(_gamepad, gp_padu);
	_down =  gamepad_button_check(_gamepad, gp_padd);
	
	_xaxisleft = gamepad_axis_value(_gamepad, gp_axislh) + (_right - _left);
	_yaxisleft = gamepad_axis_value(_gamepad, gp_axislv) + (_down - _up);
	
    _xaxisright = gamepad_axis_value(_gamepad, gp_axisrh);
	_yaxisright = gamepad_axis_value(_gamepad, gp_axisrv);

	_face1 = gamepad_button_check_pressed(_gamepad, gp_face1);
	_face2 = gamepad_button_check_pressed(_gamepad, gp_face2);
	_face3 = gamepad_button_check_pressed(_gamepad, gp_face3);
	_face4 = gamepad_button_check_pressed(_gamepad, gp_face4);

	_lb = gamepad_button_check_pressed(_gamepad, gp_shoulderl);
	_lt = gamepad_button_check_pressed(_gamepad, gp_shoulderlb);
	_rb = gamepad_button_check_pressed(_gamepad, gp_shoulderr);
	_rt = gamepad_button_check_pressed(_gamepad,gp_shoulderrb);

	_start = gamepad_button_check_pressed(_gamepad, gp_start)
	_select = gamepad_button_check_pressed(_gamepad, gp_select)
	
	
	if (_right != 0 or _left != 0 or _up != 0 or _down != 0 or _xaxisleft != 0 or _yaxisleft != 0
	or _xaxisright != 0 or _yaxisright != 0 or _face1 != 0 or _face2 != 0 or _face3 != 0 or 
	_face4 != 0 or _lb != 0 or _lt != 0 or _rb != 0 or _rt != 0 or _start != 0 or _select != 0) {
	
	check = true 
	} else {
	check = false;	
	}

}