//hacer un array de guardado

var _savedata = array_create(0);

//por cada instancia, crear una estructura y agregarla al array

with(O_entity)
{
	var _saveEntity =
	{	
		LoadType : "O_entity",
		obj : object_get_name(object_index),
		yp : y,
		xp : x,
		hp : hp,
		target_id : target_id,
		state : state,
		shield : shield,
		image_index : image_index,
		image_blend : image_blend,
	
	}
	
	array_push(_savedata, _saveEntity);
}

with(obj_player) 
{
	var _savePlayer =
	{	
		LoadType : "obj_player",
		hpprev : hpprev,
		followuptimer : followuptimer,
		followuptimermax : followuptimermax
		
	}
	
	array_push(_savedata, _savePlayer);
}


with(objSystem)
{
	var _saveSystem =
	{	
		LoadType : "objSystem",
		rm : room_get_name(room),
		inventory : ds_list_write(inventory),
		TEXTBOX_FONT : global.TEXTBOX_FONT,
		TEXTBOX_FONT2 : global.TEXTBOX_FONT2,
		mp_grid : global.mp_grid,
		drag : global.drag
	}
	array_push(_savedata, _saveSystem);	
}

if room == Room2 {
	with(obj_queen_mimic)
	{
		var _saveBoss =
		{	
			LoadType : "obj_queen_mimic",
			obj : object_get_name(object_index),
			y : y,
			x : x,
			state : state,
			sprite_index : sprite_index,
			image_index : image_index,
			image_blend : image_blend,
			image_xscale : 1.5,
			image_yscale : 1.5,
			hp : hp ,
			animation : animation,
			ataque : ataque,
			musica : musica,
			fondo_1 : fondo_1,
			scream : scream
			
		
		}
	
		array_push(_savedata, _saveBoss);
	}
}

with(oCamera)
{
	var _saveCamera =
	{	
		LoadType : "oCamera",
		obj : object_get_name(object_index),
		cam : cam,
		follow : follow,
		xTo : xTo,
		yTo : yTo,
		shake_length : shake_length,
		shake_magnitude : shake_magnitude,
		shake_remain : shake_remain
	}
	array_push(_savedata, _saveCamera);	
}






//Convertir todos estos datos en un json string y guardarlos por medio de un buffer

var _string = json_stringify(_savedata);
var _buffer = buffer_create(string_byte_length(_string) +1,buffer_fixed,1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("Juego guardado" + _string)