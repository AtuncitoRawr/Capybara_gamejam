if other.hp > 0 {
	
	
	if (!collision_line(x, y, other.x, other.y, oShield, 0, 0))
	{
	scrDamage_entity(other, self, damage, knockback_time, knockback);
	bullet_destroy();
	}else {
		
	scrDamage_entity(other, self, 0, knockback_time, knockback);
	scrDamage_entity(oShield, self, damage, knockback_time, knockback);
	audio_play_sound(snd_shield_hit, 0, false);
	bullet_destroy();
		
	}
	
}