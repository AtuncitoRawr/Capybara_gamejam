function scrPlayercheckDash(){
	
	dash -=1
	if global.Dash && dash <= 0 {
		state = STATE_DASH
		sprite_index = spr_player_dash
		rolldirection = image_angle
		audio_play_sound(snd_dash_player,0,false)
		
		dash = 60
	}

}