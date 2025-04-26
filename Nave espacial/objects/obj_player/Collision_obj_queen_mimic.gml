if invencible = true { exit }

invencible = true
alarm[1] = 1;
alarm[0] = room_speed + 60;
audio_play_sound(snd_player_damage,0,false,1,0, random_range(0.5, 1));
hp -= 5 

if hp <= 0 {
	instance_destroy(self);
	effect_create_above(ef_firework,x,y,10,c_red)
	audio_play_sound(snd_player_death,0,false)
}