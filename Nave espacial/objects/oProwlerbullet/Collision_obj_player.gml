//if other.invencible == true exit;

if other.hp > 0 {
	
	
	if (!collision_line(x, y, obj_player.x, obj_player.y, oShield, 0, 0))
	{
	scrDamage_entity(obj_player, self, damage, knockback_time, knockback);
	
	bullet_destroy()
	//alarm[0] = 0;
	effect_create_above(ef_cloud,x,y,10,c_red)
	} else {
	scrDamage_entity(obj_player, self, 0, knockback_time, knockback);
	scrDamage_entity(oShield, self, damage, knockback_time, knockback);
	audio_play_sound(snd_shield_hit, 0, false);
	bullet_destroy()
	//alarm[0] = 0;
	effect_create_above(ef_cloud,x,y,10,c_blue)
		
	}
	
}