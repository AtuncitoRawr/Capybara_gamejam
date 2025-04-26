if state == BOSS_FIRST_VIEW && scream == 0{

	
	if obj_queen_mimic.image_index > 44 {
	audio_play_sound(snd_queen_attack,1,false);
	scream = 1;
	scrScreenshake(24,120)
	}
}


if state == BOSS_FIRST_VIEW && musica == 0{

if  obj_queen_mimic.image_index > 0 {
	audio_play_sound(snd_boss_music,0,true);
	musica = 1;
	}
}

alarm_set(5,1)