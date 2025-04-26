if sprite_index == spr_mine_disabled {exit;}

sprite_index = spr_mine_activation


if sprite_index == spr_mine_activation && activation == 0
{
	activation = 1;
	audio_stop_sound(snd_mine_idle);
	audio_play_sound(snd_mine_activation, 1, false);
	
}