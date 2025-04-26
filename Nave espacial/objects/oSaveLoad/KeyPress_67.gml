//borrar el state actual del juego

with(O_entity) instance_destroy();

if (file_exists("savedgame.save"))
{
	var _buffer = buffer_load( "savedgame.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _LoadData = json_parse(_string);
	
	for (var i=0; i < array_length(_LoadData); i++) { 

			var _loadEntity = array_get(_LoadData,i); 
			
			if (_loadEntity.LoadType == "objSystem") {
				with(objSystem){
					
					room_goto((asset_get_index(_loadEntity.rm)))
					
					ds_list_read(inventory, _loadEntity.inventory)


				}
			}	oSaveLoad.alarm[0] = 1
		}
	}
			/*
			if (_loadEntity.LoadType == "O_entity") {
				with(instance_create_layer(0,0,layer, asset_get_index(_loadEntity.obj)))
				{
					x = _loadEntity.xp;
					y = _loadEntity.yp;
					image_blend = _loadEntity.image_blend;
					image_index = _loadEntity.image_index;
					hp = _loadEntity.hp;
					shield = _loadEntity.shield; 
				}
			}
			
			//room = _loadEntity.rm;
		}
		show_debug_message("Juego Cargado!" + _string);
	}
	
	
	
	
	
	/*
	while (array_length(_LoadData) > 0)
	{
		var _LoadEntity = array_pop(_LoadData);
		with (instance_create_layer(0,0,layer, asset_get_index(_LoadEntity.obj)))
		{
			x = _LoadEntity.xp;
			y = _LoadEntity.yp;
			image_blend = _LoadEntity.image_blend;
			image_index = _LoadEntity.image_index;
			hp = _LoadEntity.hp;
			shiled = _LoadEntity.shield;  
		}
	}
	*/

