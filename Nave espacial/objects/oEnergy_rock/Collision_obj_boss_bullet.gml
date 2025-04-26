instance_destroy(other)
effect_create_above(ef_explosion, x, y, 10,c_white)

if sprite_index == sEnergy_rock
{
	sprite_index = spr_rock_small;
	instance_copy(true)
		audio_play_sound(snd_rock, 0 ,false)
	effect_create_above(ef_firework, x, y, 10,c_orange)
} else
{
	
instance_destroy()
audio_play_sound(snd_rock, 0 ,false)
effect_create_above(ef_firework, x, y, 10,c_orange)
}

if instance_number(obj_rock_big) <= 20
{
	instance_create_layer(random(-x),random(-y),"instances",obj_rock_big)
}

