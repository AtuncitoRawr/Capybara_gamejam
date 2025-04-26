function scrSaveGame(){
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
		state : state,
		shield : shield,
		image_index : image_index,
		image_blend : image_blend,
		
	}
	
	array_push(_savedata, _saveEntity);
}

with(objSystem)
{
	var _saveEntity =
	{	
		LoadType : "objSystem",
		rm : room_get_name(room),
		inventory : ds_list_write(inventory),
		TEXTBOX_FONT : global.TEXTBOX_FONT,
		TEXTBOX_FONT2 : global.TEXTBOX_FONT2,
		mp_grid : global.mp_grid,
		drag : global.drag
		
	}
	array_push(_savedata, _saveEntity);	
}


if room == Room2 and instance_exists(obj_queen_mimic){
with(obj_queen_mimic)
{
	var _saveEntity =
	{	
		LoadType : "obj_queen_mimic",
		obj : object_get_name(object_index),
		y : y,
		x : x,
		state : state,
		image_index : image_index,
		image_blend : image_blend,
		
	}
	
	array_push(_savedata, _saveEntity);
}

}

//Convertir todos estos datos en un json string y guardarlos por medio de un buffer

var _string = json_stringify(_savedata);
var _buffer = buffer_create(string_byte_length(_string) +1,buffer_fixed,1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("Juego guardado" + _string)
}