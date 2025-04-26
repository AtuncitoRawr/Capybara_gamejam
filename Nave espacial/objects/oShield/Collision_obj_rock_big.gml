if instance_exists(oShield)
{

	hp -= 20;
	effect_create_above(ef_firework,x,y,5,c_lime)
	instance_destroy(other)
	 audio_play_sound(snd_shield_hit, 0, false,1,0, random_range(0.9, 1.1));

	if hp <= 0
	{
		instance_destroy(self)
		effect_create_above(ef_firework,x,y,5,c_green)
		audio_play_sound(snd_shield_destroy, 0, false)
	}
}     