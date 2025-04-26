if instance_exists(obj_player) and obj_player.state != STATE_DEAD{

	if obj_player.shield == true {
		x = obj_player.x
		y = obj_player.y
		//image_angle = rotationprev
		image_angle = mydirection


		if global.leftShield and loop == false
		{
			loop = true
			alarm[0] = 1
			alarm[1] = 20.5
			audio_play_sound(snd_shield_move,0,false,1,0, random_range(0.9, 1.1));
			
	
		}

		if global.rightShield and loop == false
		{	
			loop = true
			alarm[2] = 1
			alarm[1] = 21
			audio_play_sound(snd_shield_move,0,false,1,0, random_range(0.9, 1.1));
		}
	}
	else {
		instance_destroy()
		audio_play_sound(snd_shield_destroy, 0, false)
		effect_create_above(ef_explosion,x,y,3,c_green)
		audio_stop_sound(snd_shield_idle)
	}

} else { 	
	instance_destroy()
	audio_play_sound(snd_shield_destroy, 0, false)
	effect_create_above(ef_explosion,x,y,3,c_green)
	audio_stop_sound(snd_shield_idle)
}

if hp <= 0 {
	instance_destroy()
	audio_play_sound(snd_shield_destroy, 0, false)
	effect_create_above(ef_explosion,x,y,3,c_green)
	audio_stop_sound(snd_shield_idle)
}




	
