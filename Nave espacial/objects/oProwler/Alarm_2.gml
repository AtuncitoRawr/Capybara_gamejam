/*if instance_exists(target_id){

var _dir = point_direction(target_id.x, target_id.y, x, y)
var _ndir = point_direction(x, y, target_id.x, target_id.y)

if final_weight < 75 {

	set_angle = _ndir//irandom_range(0, 359)
}
else {	
	set_angle = _dir + choose(5, -5, 10, -10, 15, -15, 20, -20, 25, -25)
}
}

alarm[2] = 60;