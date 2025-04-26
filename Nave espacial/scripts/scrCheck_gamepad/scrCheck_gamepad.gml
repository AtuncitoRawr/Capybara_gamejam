function scrCheck_gamepad(_gamepad){
	check = false;
	
	var _right,_left,_up,_down,_xaxisleft,_yaxisleft,_xaxisright,_yaxisright,_face1,_face2,_face3,
	_face4,_start,_select,_lb,_lt,_rb,_rt	
	
	_right = gamepad_button_check(_gamepad, gp_padr) 
	_left =  gamepad_button_check(_gamepad, gp_padl);
	_up   =  gamepad_button_check(_gamepad, gp_padu);
	_down =  gamepad_button_check(_gamepad, gp_padd);
	
	_xaxisleft = gamepad_axis_value(_gamepad, gp_axislh) + (_right - _left);
	_yaxisleft = gamepad_axis_value(_gamepad, gp_axislv) + (_down - _up);
	
    _xaxisright = gamepad_axis_value(_gamepad, gp_axisrh);
	_yaxisright = gamepad_axis_value(_gamepad, gp_axisrv);

	_face1 = gamepad_button_check_pressed(_gamepad, gp_face1);
	_face2 = gamepad_button_check_pressed(_gamepad, gp_face2);
	_face3 = gamepad_button_check_pressed(_gamepad, gp_face3);
	_face4 = gamepad_button_check_pressed(_gamepad, gp_face4);

	_lb = gamepad_button_check_pressed(_gamepad, gp_shoulderl);
	_lt = gamepad_button_check_pressed(_gamepad, gp_shoulderlb);
	_rb = gamepad_button_check_pressed(_gamepad, gp_shoulderr);
	_rt = gamepad_button_check_pressed(_gamepad,gp_shoulderrb);

	_start = gamepad_button_check_pressed(_gamepad, gp_start)
	_select = gamepad_button_check_pressed(_gamepad, gp_select)
	
	
	if (_right != 0 or _left != 0 or _up != 0 or _down != 0 or _xaxisleft != 0 or _yaxisleft != 0
	or _xaxisright != 0 or _yaxisright != 0 or _face1 != 0 or _face2 != 0 or _face3 != 0 or 
	_face4 != 0 or _lb != 0 or _lt != 0 or _rb != 0 or _rt != 0 or _start != 0 or _select != 0) {
	
	check = true 
	} else {
	check = false;	
	}

}