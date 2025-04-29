x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) /2 - (33 /2);
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) /2 - (62 /2);


if doorHasCreate == false 
{
	if global.repetitions > 6 
	{
		doorColor = 3;
	}

	switch doorColor
	{
		case BLUE_DOOR:
		sprite_index = sDoorBlue;
		image_index = 0;
		break;
	
		case RED_DOOR:
		sprite_index = sDoorRed;
		image_index = 0;
		break;
	
		case YELLOW_DOOR:
		sprite_index = sDoorYellow;
		image_index = 0;
		break;
		
		case FINAL_DOOR:
		sprite_index = sDoorFinal;
		image_index = 0;
		break;
	}
	
		doorHasCreate = true;
}


if instance_exists(self)
{
	if mouse_x > x && mouse_x < x + oDoor.sprite_width
	&& mouse_y > y && mouse_y < y + oDoor.sprite_height
	{
		isSelected = true;
	} else {
		isSelected = false;	
	}
}

if mouse_check_button_pressed(mb_left) && isSelected
{
	
	switch doorColor
	{
		case 0:
		room_goto(Room3)
		break;
	
		case 1:
		effect_create_above(ef_firework, x, y, 1, c_red)
		break;
	
		case 2:
		effect_create_above(ef_firework, x, y, 1, c_yellow)
		break;
	}

}