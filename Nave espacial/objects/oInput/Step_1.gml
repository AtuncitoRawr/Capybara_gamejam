var _gamepad = 0;
scrCheck_gamepad(_gamepad);

if global.controllermode == 0
{

	if gamepad_is_connected(_gamepad) and check == true
	{
		global.controllermode = 1;
	} else {
		global.rightKey = keyboard_check(ord("D"));
		global.leftKey = keyboard_check(ord("A"));
		global.upKey = keyboard_check(ord("W"));
		global.downKey = keyboard_check(ord("S"));
	
		global.rightKeyPressed = keyboard_check_pressed(ord("D"));
		global.leftKeyPressed = keyboard_check_pressed(ord("A"));
		global.upKeyPressed = keyboard_check_pressed(ord("W"));
		global.downKeyPressed = keyboard_check_pressed(ord("S"));

		global.xaxisLeft = global.rightKey - global.leftKey;
		global.yaxisLeft = global.downKey - global.upKey;
	
		global.Dash = keyboard_check_pressed(vk_shift);
		global.checkShield = keyboard_check_pressed(vk_control);
		global.rightShield = keyboard_check_pressed(ord("E"));
		global.leftShield = keyboard_check_pressed(ord("Q"));
		global.OpenInventory = keyboard_check_pressed(vk_tab);
		global.Interact = mouse_check_button_pressed(mb_right);

		global.shootKey = mouse_check_button_pressed(mb_left);
		global.swapKeyPressed = keyboard_check_pressed(vk_space);

		global.startKeyPressed = keyboard_check_pressed(vk_enter);
	

	}
}

if global.controllermode == 1
{

	if gamepad_is_connected(_gamepad) and (!keyboard_check(vk_anykey))
	{
		
	gamepad_set_axis_deadzone(_gamepad, .2);

	global.rightKey = gamepad_button_check(_gamepad, gp_padr);
	global.leftKey = gamepad_button_check(_gamepad, gp_padl);
	global.upKey = gamepad_button_check(_gamepad, gp_padu);
	global.downKey = gamepad_button_check(_gamepad, gp_padd);
	
	global.rightKeyPressed =  gamepad_button_check_pressed(_gamepad, gp_padr);
	global.leftKeyPressed = gamepad_button_check_pressed(_gamepad, gp_padl);
	global.upKeyPressed = gamepad_button_check_pressed(_gamepad, gp_padu);
	global.downKeyPressed = gamepad_button_check_pressed(_gamepad, gp_padd);
	
	
	global.xaxisLeft = gamepad_axis_value(_gamepad, gp_axislh) + (global.rightKey - global.leftKey);
	global.yaxisLeft = gamepad_axis_value(_gamepad, gp_axislv) + (global.downKey - global.upKey);
	

	global.xaxisLeft = clamp(global.xaxisLeft, -1, 1);
	global.yaxisLeft = clamp(global.yaxisLeft, -1, 1);
	
	
	global.xaxisRight = gamepad_axis_value(_gamepad, gp_axisrh);
	global.yaxisRight = gamepad_axis_value(_gamepad, gp_axisrv);
	
	global.Dash = gamepad_button_check_pressed(_gamepad, gp_face2);
	global.checkShield = gamepad_button_check_pressed(_gamepad, gp_shoulderlb);
	global.rightShield = gamepad_button_check_pressed(_gamepad, gp_shoulderr);
	global.leftShield = gamepad_button_check_pressed(_gamepad, gp_shoulderl);
	global.OpenInventory = gamepad_button_check_pressed(_gamepad, gp_face4);
	global.Interact = gamepad_button_check_pressed(_gamepad, gp_face1);
	
	global.shootKey = gamepad_button_check_pressed(_gamepad,gp_shoulderrb);
	global.swapKeyPressed = gamepad_button_check_pressed(_gamepad, gp_face3);

	global.startKeyPressed = gamepad_button_check_pressed(_gamepad, gp_start)
	} else {
		global.controllermode = 0;
	}
	
}