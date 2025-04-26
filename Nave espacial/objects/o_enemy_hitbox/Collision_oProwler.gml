audio_play_sound(snd_mimic, 0, false);




if !collision_line(x,y, other.x, other.y, oShield, 0,0){
scrDamage_entity(other, self, damage, 20, 12)
audio_play_sound(snd_player_damage, 0, false)

} else {
	
	
	scrDamage_entity(oShield, self, damage, 0, 0)
	scrDamage_entity(other, self, 0, 20, 12)
	audio_play_sound(snd_shield_hit, 0 , false);
	
}
