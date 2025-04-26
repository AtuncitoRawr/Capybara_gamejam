if other.invencible == true exit;

if other.hp > 0 {
	
	if !collision_line(x,y, obj_player.x, obj_player.y, oShield, 0,0){
	scrDamage_entity(other, self, damage, knockback_time, knockback)
	audio_play_sound(snd_player_damage, 0, false)

} else if shieldpush != 1{
	
	shieldpush += 1;
	alarm[7] = 30;
	
	scrDamage_entity(oShield, self, damage, 0, 0)
	scrDamage_entity(other, self, 0, knockback_time, knockback)
	audio_play_sound(snd_shield_hit, 0 , false);
	
}

	
	//spin = true;
		//other.image_angle += angle_difference((other.image_angle + 360) * spin ,other.image_angle) * 0.3
}