
if instance_exists(oShield)
{
	if other.image_index >= 28
	{
	instance_destroy(self)
	effect_create_above(ef_firework,x,y,5,c_green)
	audio_play_sound(snd_shield_destroy, 0, false)
	}
}
	     