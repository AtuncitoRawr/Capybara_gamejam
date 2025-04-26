
var _gamepad = 0;
scrCheck_gamepad(_gamepad);

global.actual_delta = delta_time/1000000;
global.delta_multiplier = global.actual_delta/global.target_delta;


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


if keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(_gamepad, gp_start) {
	
	room_goto(prueba1);
	array_delete(oItem_manager.inv, 0, 4)
	global.Coins = 0;
	
}


if keyboard_check(vk_control)
{
game_set_speed(30, gamespeed_fps)

} else {
game_set_speed(60, gamespeed_fps)
}

if keyboard_check_pressed(vk_shift)
{
	global.showStats = !global.showStats;	
}

if keyboard_check_pressed(ord("M"))
{
	global.timeStop = !global.timeStop;	
}


if keyboard_check(ord("P"))
{
oPlayer.state = STATE_IDLE;
}