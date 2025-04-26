function scrCollision(){
	
	var _tx = x;
	var _ty = y;
	
	x = xprevious;
	y = yprevious;
	
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	if place_meeting(x + _disx * sign(_tx - x), y, o_solid) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), o_solid) y = round(y);
	
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_solid) x += sign(_tx - x);
	}
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_solid) y += sign(_ty - y);
	}

}

function collision_bounce() {
	scrCollision();
	if place_meeting(x + sign(hsp), y, o_solid) hsp = -hsp;
	if place_meeting(x, y + sign(vsp), o_solid) vsp = -vsp;

}