var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) /2 - (33 /2);
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) /2 - (62 /2);


if keyboard_check_pressed(vk_enter)
{
	room_restart();	
	global.repetitions++
}

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
	instance_create_layer(_x, _y,"Instances", oDoor)	
}