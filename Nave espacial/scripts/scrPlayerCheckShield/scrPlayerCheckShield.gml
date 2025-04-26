function scrPlayerCheckShield(){
	
	with obj_player{
			if global.checkShield and shield == false {
		state = STATE_CHECK_SHIELD;
		sprite_index = spr_playerCheckShield
		audio_play_sound(snd_activate_shield, 0, false)
		shield = true
	} else
	{
			if global.checkShield and shield == true {
		state = STATE_CHECK_SHIELD;
		shield = false
	}



	
		
		}
	}
}