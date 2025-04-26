var _gamepad = 0;
scrCheck_gamepad(_gamepad);

if global.controllermode == 0
{

	if gamepad_is_connected(_gamepad) and check == true
	{
		
		global.controllermode = 1;
	}
}

if global.controllermode == 1
{
	
	if keyboard_check(vk_anykey) || mouse_check_button(mb_any)  {
		
		global.controllermode = 0;	
	} 
	
}

gamepad_set_axis_deadzone(_gamepad, .2);

//Movimiento
	
		global.rightKey = keyboard_check(ord("D")) + gamepad_button_check(_gamepad, gp_padr) + keyboard_check(vk_right);
		global.rightKey = clamp(global.rightKey, 0, 1);
		
		global.leftKey = keyboard_check(ord("A")) + gamepad_button_check(_gamepad, gp_padl) + keyboard_check(vk_left);
		global.leftKey = clamp(global.leftKey, 0, 1);
		
		global.upKey = keyboard_check(ord("W")) + gamepad_button_check(_gamepad, gp_padu) + keyboard_check(vk_up);
		global.upKey = clamp(global.upKey, 0, 1);
		
		global.downKey = keyboard_check(ord("S")) + gamepad_button_check(_gamepad, gp_padd) + keyboard_check(vk_down);
		global.downKey = clamp(global.downKey, 0, 1);
		
		global.xaxisLeft = gamepad_axis_value(_gamepad, gp_axislh) + (global.rightKey - global.leftKey);
		global.yaxisLeft = gamepad_axis_value(_gamepad, gp_axislv) + (global.downKey - global.upKey);
	
		global.xaxisLeft = clamp(global.xaxisLeft, -1, 1);
		global.yaxisLeft = clamp(global.yaxisLeft, -1, 1);
		
//Menu
		
		global.rightKeyPressed = keyboard_check_pressed(ord("D")) + gamepad_button_check_pressed(_gamepad, gp_padr) + keyboard_check_pressed(vk_right);
		global.rightKeyPressed = clamp(global.rightKeyPressed, 0, 1);
		
		global.leftKeyPressed = keyboard_check_pressed(ord("A")) + gamepad_button_check_pressed(_gamepad, gp_padl) + keyboard_check_pressed(vk_left);
		global.leftKeyPressed = clamp(global.leftKeyPressed, 0, 1);
		
		global.upKeyPressed = keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(_gamepad, gp_padu) + keyboard_check_pressed(vk_up);
		
		global.downKeyPressed = keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(_gamepad, gp_padd) + keyboard_check_pressed(vk_down);
		global.downKeyPressed = clamp(global.downKeyPressed, 0, 1);
		
		
//Acciones
		global.Interact = mouse_check_button_pressed(mb_right) + gamepad_button_check_pressed(_gamepad, gp_face1);
		global.Interact = clamp(global.Interact, 0, 1);

		global.jumpPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(_gamepad, gp_face1);
		global.jumpPressed = clamp(global.jumpPressed, 0, 1);
		
		global.jump = keyboard_check(vk_space) + gamepad_button_check(_gamepad, gp_face1);
		global.jump = clamp(global.jump, 0, 1);
		
		global.shootKey = mouse_check_button_pressed(mb_left) + gamepad_button_check_pressed(_gamepad,gp_face3);
		global.shootKey = clamp(global.shootKey, 0, 1);
		
		global.startKeyPressed = keyboard_check_pressed(vk_enter);

		global.xaxisRight = gamepad_axis_value(_gamepad, gp_axisrh);
		global.yaxisRight = gamepad_axis_value(_gamepad, gp_axisrv);
		global.Dash = gamepad_button_check_pressed(_gamepad, gp_face2);
		global.startKeyPressed = gamepad_button_check_pressed(_gamepad, gp_start)
		
//Buffering con el salto
		
	

	
	
