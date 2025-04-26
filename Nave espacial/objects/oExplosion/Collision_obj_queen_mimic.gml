if other.hp < 0 { exit;}

var _dir = point_direction(x, y, other.x, other.y);
var _force = force;
with(other) {
	hsp = lengthdir_x(_force, _dir);	
	vsp = lengthdir_y(_force, _dir);	

}
	other.hp -= 5

