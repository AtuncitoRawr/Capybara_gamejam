if animation == 0 {
	animation = 1
	state = BOSS_FIRST_VIEW
	sprite_index = spr_boss_mimic_open_eye_1

	oCamera.follow = obj_queen_mimic
	
	obj_player.state = STATE_CINEMATIC;
	
	audio_stop_sound(snd_queen_mimic_sleep)

}

//obj_bossbar.healthpoints -= 1
obj_bossbar.followuptimer = obj_bossbar.followuptimermax

