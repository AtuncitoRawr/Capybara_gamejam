if invencible = true { exit }

invencible = true
alarm[1] = 1
alarm[0] = room_speed + 120;
hp -= 5;
audio_play_sound(snd_player_damage,0,false,1,0, random_range(0.8, 1.2));
if hp <= 0 {
	instance_destroy(self);
	effect_create_above(ef_firework,x,y,10,c_red)
	audio_play_sound(snd_player_death,0,false)
}

instance_destroy(other)
effect_create_above(ef_firework,x,y,10,c_orange)
audio_play_sound(snd_rock, 0 ,false)
