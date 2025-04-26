if invencible = true { exit }

invencible = true
alarm[1]= 1;
alarm[0] = room_speed + 60;
hp -= 5;

if hp <= 0 {
	instance_destroy(self);
	effect_create_above(ef_firework,x,y,10,c_red)
	audio_play_sound(snd_player_death,0,false)
}

instance_destroy(other)
effect_create_above(ef_firework,x,y,100,c_gray)
audio_play_sound(snd_rock, 0 ,false)