audio_stop_all()

with(O_entity) instance_destroy();
with(obj_queen_mimic) instance_destroy();
with(oCamera) instance_destroy();

if (file_exists("savedgame.save"))
{
	var _buffer = buffer_load( "savedgame.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _LoadData = json_parse(_string);
	
	for (var i=0; i < array_length(_LoadData); i++) { 

			var _loadEntity = array_get(_LoadData,i); 		
			if (_loadEntity.LoadType == "O_entity") {
				with(instance_create_layer(0,0,"Instances", asset_get_index(_loadEntity.obj)))
				{
					x = _loadEntity.xp;
					y = _loadEntity.yp;
					image_blend = _loadEntity.image_blend;
					image_index = _loadEntity.image_index;
					hp = _loadEntity.hp;
					state = _loadEntity.state;
					target_id = _loadEntity.target_id;
					shield = _loadEntity.shield; 
				}
			}
			
			if (_loadEntity.LoadType == "obj_player") {
				with(obj_player)
				{
					hpprev = _loadEntity.hpprev;
					followuptimermax = _loadEntity.followuptimermax;
					followuptimer = _loadEntity.followuptimer;
				}
			}
			
			if (_loadEntity.LoadType == "obj_queen_mimic") {
				with(instance_create_layer(0,0,"boss", asset_get_index(_loadEntity.obj)))
				{
					x = _loadEntity.x;
					y = _loadEntity.y;
					image_blend = _loadEntity.image_blend;
					sprite_index = _loadEntity.sprite_index;
					image_index = _loadEntity.image_index;
					image_xscale = _loadEntity.image_xscale;
					image_yscale = _loadEntity.image_yscale;
					hp = _loadEntity.hp;
					state = _loadEntity.state;
					animation = _loadEntity.animation;
					ataque = _loadEntity.ataque;
					musica = _loadEntity.musica;
					fondo_1 = _loadEntity.fondo_1;
					scream = _loadEntity.scream;
					
					
				}
			}
			if (_loadEntity.LoadType == "oCamera") {
				with(instance_create_layer(0,0,layer, asset_get_index(_loadEntity.obj)))
				{
					x = _loadEntity.xTo;
					y = _loadEntity.yTo;
					cam = _loadEntity.cam;
					follow = _loadEntity.follow;
					shake_length = _loadEntity.shake_length;
					shake_magnitude = _loadEntity.shake_magnitude;
					shake_remain = _loadEntity.shake_remain;
					
				}
			}
	}
}
			
			//room = _loadEntity.rm;
		
		show_debug_message("Juego Cargado!" + _string);
	