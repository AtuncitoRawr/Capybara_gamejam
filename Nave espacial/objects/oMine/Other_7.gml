if sprite_index == spr_mine_activation{

audio_stop_sound(snd_mine_activation);
instance_create_layer(x, y ,"Instances", oExplosion)
instance_destroy();
}

if sprite_index == spr_mine_disabled {
	sprite_index = spr_mine	
	audio_play_sound(snd_mine_idle, 0 , true)
}



