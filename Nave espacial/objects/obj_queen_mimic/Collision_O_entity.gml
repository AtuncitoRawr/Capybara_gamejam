if other.invencible == true {exit;}

var _dir = point_direction(x, y, other.x, other.y);
if ataque != BOSS_ATTACK_ASAULT {
var _force = force;
} else {
var _force = force + 10;	
}


if !collision_line(x,y, other.x, other.y, oShield, 0, 0){
with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

}
scrDamage_entity(other, id, damage, random_range(45, 60), knockback);
} else {
	with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

}
	scrDamage_entity(other, id, 0, random_range(45, 60), knockback);
	scrDamage_entity(oShield, id, damage, 0, 0);
	audio_play_sound(snd_shield_hit, 1, false);
}