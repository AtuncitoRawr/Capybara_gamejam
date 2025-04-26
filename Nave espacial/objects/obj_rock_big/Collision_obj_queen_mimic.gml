instance_destroy()
audio_play_sound(snd_rock, 0 ,false)
effect_create_above(ef_firework, x, y, 10,c_orange)


if instance_number(obj_rock_big) <= 20
{
	instance_create_layer(random(-x),random(-y),"instances",obj_rock_big)
}

