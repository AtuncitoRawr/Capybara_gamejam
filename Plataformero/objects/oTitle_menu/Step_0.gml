//obtener el input
getControls()

pos += downKeyPressed - upKeyPressed;
accept_key = InteractKey;

op_lenght = array_length(option[menu_level]);

if pos >= op_lenght {pos = 0;}
if pos < 0 {pos = op_lenght-1;}


//------------- Mover opciones con la palanca del joystyk------------
yaxisvalueLeft = gamepad_axis_value(0,gp_axislv);

if (yaxisvalueLeft < -.8) && yaxisup == false then {
	
	yaxisup = true;
	pos--;
}

if yaxisvalueLeft > -.3 then yaxisup = false;

if (yaxisvalueLeft > .8) && yaxisdown == false then {
	
	yaxisdown = true;
	pos++;
}

if yaxisvalueLeft < .3 then yaxisdown = false;
//------------- Mover opciones con la palanca del joystyk------------


if accept_key {
	
	var _sml = menu_level;
	
	
	switch(menu_level) {
		
		case 0:
		switch(pos){

		case 0: room_goto_next() break;
		case 1: menu_level = 1 break;
		case 2: game_end(); break;
		}
		break;
		
		case 1:
		switch(pos){

		case 0: break;
		case 1: break;
		case 2: break;
		case 3: menu_level = 0; break;
		}
	}
		
		if  _sml != menu_level {pos = 0}
		op_lenght = array_length(option[menu_level]);
}


