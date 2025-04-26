	for (j = 0; j < lenght_laser; j++ )
	{
	 var flicker = random_range(0.09,0.11);
	 var alpha = random_range(0.8, 1);
	draw_sprite_ext(spr_frame_laser, -1, x + lengthdir_x(j, image_angle), y + lengthdir_y(j, image_angle),1,flicker,image_angle,c_white,alpha)
  
	}
