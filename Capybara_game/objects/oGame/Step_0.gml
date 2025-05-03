getControls();

if global.endLvl == true && room == Room2
{
	global.endLvl = false;
	global.timeStop = 1;
}
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) /2 - (33 /2);
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) /2 - (62 /2);

var _gamepad = 0;
gamepad_set_axis_deadzone(_gamepad, .2);

/*
if startKeyPressed
{
	room_restart();	
	global.repetitions++
}

if keyboard_check_pressed(ord("I"))
{
	global.spaceWins++;	
}

if keyboard_check_pressed(ord("O"))
{
	global.fightWins++;	
}

if keyboard_check_pressed(ord("P"))
{
	global.platafomerWins++;	
}

if keyboard_check_pressed(ord("M"))
{
	global.timeStop = !global.timeStop;	
}

*/


if instance_exists(oText_box)
	{
		with oText_box
		{
			if text_length[page] > 0 && draw_char == text_length[page] && page >= page_number-1
			&&  finish_text == false
			{
				other.alarm[0] = 60;
				finish_text = true;
			}
		}
	}
	
if !instance_exists(oDoor) && room == Room2
{


var _weight = choose_weighted(doorList[0,0], doorList[1, 0], doorList[0,1], doorList[1,1] , doorList[0,2], doorList[1,2])
var _door = instance_create_layer(_x, _y,"Instances", oDoor)	
var _color = _weight;
var _state = 0;
	switch _color
	{
		case doorList[0,0]:
		
		if doorList[1,0] = COMPLETE {doorList[1,0] = PIECE _state = doorList[1,0]}
		if doorList[1,0] = PIECE && global.repetitions > 2 {doorList[1,0] = NOTHING _state = doorList[1,0]}
		break;
		
		case doorList[0,1]:
		if doorList[1,1] = COMPLETE {doorList[1,1] = PIECE _state = doorList[1,1]}
		if doorList[1,1] = PIECE && global.repetitions > 2 {doorList[1,1] = NOTHING _state = doorList[1,1]}
		break;
		
		case doorList[0,2]:
		if doorList[1,2] = COMPLETE {doorList[1,2] = PIECE _state = doorList[1,2]}
		if doorList[1,2] = PIECE && global.repetitions > 2 {doorList[1,2] = NOTHING _state = doorList[1,2]}
		break;
	}
	
_door.doorColor = _color;
_door.doorState = _state;

}
