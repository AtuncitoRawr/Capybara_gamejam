var _dir = point_direction(x, y, other.x, other.y);
var _force = force;
with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

}
if !collision_line(x,y, obj_player.x, obj_player.y, oShield, 0, 0){
scrDamage_entity(other, id, damage, random_range(45, 60), knockback);
} else {
	
	scrDamage_entity(other, id, 0, random_range(45, 60), knockback);
	scrDamage_entity(oShield, id, damage, 0, 0);
	audio_play_sound(snd_shield_hit, 1, false);
}