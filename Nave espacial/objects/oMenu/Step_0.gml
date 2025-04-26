//efecto de entrada

menu_x += (menu_x_target - menu_x) / menu_speed;

//controles

if (menu_control)
{
	if (global.upKeyPressed) 
	{
		menu_cursor++;
		audio_play_sound(snd_cursor,0,false);
		if (menu_cursor >= menu_items) menu_cursor = 0;
		
		
	}
	
	if (global.downKeyPressed) 
	{
		menu_cursor--;
		audio_play_sound(snd_cursor,0,false);
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	
	if (menu_x > gui_width-1400)
	{
		if global.shootKey
		{
			menu_x_target = gui_width -1500;
			menu_commited = menu_cursor;
			menu_control = false;
			audio_play_sound(snd_use_item,0,false);
		}
	
	}
		
}

if (menu_x > gui_width-1400) &&  (menu_commited != -1)
{
	switch (menu_commited)
	{
		case 2:
		{	
			file_delete("savedgame.save")
			scrSlideTransition(TRANS_MODE.NEXT);
			audio_stop_sound(snd_menu);
			
		}
		
		break;
		case 1: 
		{
			if (!file_exists("savedgame.save"))
			{
				scrSlideTransition(TRANS_MODE.NEXT)
			}
			else
			{
				scrLoadGame();
				//scrSlideTransition(TRANS_MODE.NEXT);	
			}
		}
		audio_stop_sound(snd_menu);
		break;
		case 0: game_end(); break;
	}
}

