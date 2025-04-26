function scrUseIluminador(){
	
	if oControlador.progreso == 1 
	{
		oControlador.progreso = 2;
	}
	if instance_exists(obj_player) and obj_player.state != STATE_DEAD {
	
		if obj_player.light == false {
			var _inst = instance_create_layer(x,y,"surface",o_ilumination);
			_inst.x = obj_player.x;
			_inst.y = obj_player.y;
			obj_player.light = true;
		} else {
			instance_destroy(o_ilumination);
			obj_player.light = false;
		}
	}
}