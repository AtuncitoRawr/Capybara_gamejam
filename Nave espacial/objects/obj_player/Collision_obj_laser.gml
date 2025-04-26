if invencible = true { exit }	



if other.image_index >= 26 and other.image_index <= 32
{
hp -= 10
audio_play_sound(snd_player_damage,0,false,1,0, random_range(0.1, 1));
invencible = true
alarm[1] = 1;
alarm[0] = room_speed + 60;



if hp <= 0
{
	instance_destroy(obj_player)
	effect_create_above(ef_explosion, x,y,10,c_aqua)
	audio_play_sound(snd_player_death,0,false)
}
}