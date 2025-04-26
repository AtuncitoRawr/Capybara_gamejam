function vector(_x,_y) constructor {
	
		x = _x;
		y = _y;
		
	static set = function(_x,_y) {	
		x = _x;
		y = _y;		
	}
	
	static add = function(_vector) {
		x += _vector.x;
		y += _vector.y;
	}
	
	static substract = function(_vector) {
		x -= _vector.x;
		y -= _vector.y;
	}
	
	static multiply = function(_scalar) {
		x *= _scalar;
		y *= _scalar;
	}
	
	static divide = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
	}
	static normalize = function() {
	if ((x != 0) || (y != 0)) {
		var _factor = 1/sqrt((x * x ) + (y * y));
		x = _factor * x;
		y = _factor * y;
	
	}
}


static get_magnitue = function() {
	
	return sqrt((x * x) + (y * y))
	
}

}

