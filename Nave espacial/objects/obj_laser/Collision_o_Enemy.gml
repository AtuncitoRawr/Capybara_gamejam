if other.invencible == true {exit;}

var _dir = point_direction(x, y, other.x, other.y);
var _force = force;
	


if other.hp > 0 and image_index >= 26 {
	
	
	if !collision_line(x,y, obj_player.x, obj_player.y, oShield, 0,0){
		
	with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

	}
	scrDamage_entity(other, self, damage, knockback_time, knockback)
	audio_play_sound(snd_player_damage, 0, false)

} else if shieldpush != 1 {
	
	shieldpush += 1
	alarm[0] = 30;
	
	with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

}
	scrDamage_entity(oShield, self, damage, 0, 0)
	scrDamage_entity(other, self, 0, knockback_time, knockback)
	audio_play_sound(snd_shield_hit, 0 , false);
	
}
	spin = true;
}
