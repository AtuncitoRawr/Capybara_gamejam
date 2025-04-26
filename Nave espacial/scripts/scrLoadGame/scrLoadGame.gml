function scrLoadGame(){
	
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

}