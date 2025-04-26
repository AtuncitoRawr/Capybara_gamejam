function controlSetup() {
	

bufferTime = 22;

jumpKeyBuffered = 0;
jumpKeyBufferTimer = 0;

		
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
		InteractKey = keyboard_check_pressed(ord("X")) + mouse_check_button(mb_left) + gamepad_button_check_pressed(_gamepad, gp_face3);
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
		
		attackKeyPressed = keyboard_check_pressed(ord("Z")) + gamepad_button_check_pressed(_gamepad, gp_shoulderr);
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