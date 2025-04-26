// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function Weighted_circle(_owner_id){
	
	//do we need to check for a new path?
if check_path {	

	//create a ds_list to store the possible targets
	var _list = ds_list_create();
	
	//check in a circle around us and store the number found in a variable
	var _num = collision_circle_list(x, y, range, o_INSTANCE, false, true, _list, false);
	
	
	//did we find any instances?
	if (_num > 0) {
		//create an array to hold the possiblities
		options_arr = array_create(_num);	
		
		//loop through the instances found
	    for (var i = 0; i < _num; ++i;) {
			//get next instance id
	        var _id = _list[| i];
			
			/* init a weight temp value
			The weight is a value we will use to decide what is
			more important to us.  The highest weighted value is
			what we will move towards.  Weights are calculated 
			based on a set of rules you define, but by default
			they can simply be based on the distance we are to the instance	*/
			var _weight = 0;	
			
			//create a struct which holds the id and it's weight value
			options_arr[i] = {id : _id, weight : _weight}	
			

			/* Next we check what to do with the instance we can see.
			We base the weight on the distance to us, and we set a 
			weight value using map_value which maps our max range
			to a set of values, using the distance as the determing value.
			We can change these values to modify the instances
			weights and make objects more or less valuable to the character.
			*/
			
			//get the distance to the object
			var _dis = distance_to_object(_id);			
			
			//set a weight value, based on the object type, and how far away we are, scaling for each object
			switch(_owner_id.object_index) {
				
				case oProwler:
				
				switch(_id.object_index) {

					case obj_player:
					if obj_player.state != STATE_DEAD and obj_player.invisible != true {
						_weight = round(map_value(_dis, range, 5, 40, 90));
					}
					break;
					
					case obj_rock_big:
						_weight = round(map_value(_dis, range, 15, 0, 90));
					break;
				
					case oMimic:
					if _id.object_index.state != STATE_DEAD 
					_weight = round(map_value(_dis, range, 5, 40, 90));
					break;
					
					case obj_queen_mimic:
					if _id.object_index.state != STATE_DEAD 
					_weight = round(map_value(_dis, range, 5, 40, 90));
					break;
	
					case oMine:
						if _id.sprite_index == spr_mine_activation {
					    _weight = round(map_value(_dis, range, 5, 90, 90));
						}
					break;
				}
				break;
				
				case oMimic:
				
				 switch(_id.object_index) {

					case obj_player:
					if obj_player.state != STATE_DEAD and obj_player.invisible != true {
						_weight = round(map_value(_dis, range, 5, 40, 90));
					}
					break;	
					
					case oProwler:
					if _id.object_index.state != STATE_DEAD 
					_weight = round(map_value(_dis, range, 5, 40, 90));
					break;
				 }
				break;
			}
			//add the weight to this instances struct value
			options_arr[i].weight = _weight;
	    }
	} 
	
	//clean up list
	ds_list_destroy(_list);

	//find the object with the highest weight, and set it as the target
	if _num > 0 {
		//init a default highest weight
		var _highest = 0;
		
		//ensure we found some instances
		if array_length(options_arr) > 0 {
			//loop through the found instances and get the highest weight
			for (var i = 0; i < _num; ++i) {
				if options_arr[i].weight > options_arr[_highest].weight _highest = i;
			}
		}
		
		//if we found a weight that was the highest, set as the target if the weight is not 0
		if options_arr[_highest].weight != 0 {
			
			//get the id of the highest weighted instance
			var _id = options_arr[_highest].id;
			var _final_weight = options_arr[_highest].weight;
			
			//set target values to this instance
			tx = _id.x;
			ty = _id.y;
			target_id = _id;
			final_weight = _final_weight;
			return target_id;
		
			
			} 
		} 
	}	
}

function Choose_action(_owner,_id) {
			
	if instance_exists(_id) and distance_to_object(_id) <= range
		{

			
		switch (_owner.object_index) {
			
			case oProwler:
			
			switch (_id.object_index) {
				
				case obj_player:
				if obj_player.state != STATE_DEAD {
					if 	(!collision_line(x,y, target_id.x, target_id.y, o_solid, false, true)) {
					state = STATE_ATTACK;
					}
				}
				break;
				
				case oMimic:
				state = STATE_ATTACK;
				break;
				
				case obj_queen_mimic:
				state = STATE_ATTACK;
				break;
			
				case obj_Reparador:
				mp_grid_path(global.mp_grid, ppath ,x ,y,_id.x,_id.y,true);
				path_start(ppath, move_spd, path_action_stop, false);
				break;
				
				case obj_rock_big:
				Prowler_shoot();
				break;
				
				case oMine:		
				if instance_exists(_id){
					mp_grid_path(global.mp_grid, ppath ,_id.x ,_id.y, x, y,true);
					path_start(ppath, move_spd, path_action_stop, false);
				}
				break;
			}
			break;
			
			case oMimic:
				
				switch(_id.object_index) {
					
				case oProwler:
				state = STATE_MOVE;
				break;
					
				case obj_player:
				state = STATE_MOVE;
				break;
				
				}

			break;
		} 
			
			
	} 
		
	
}
	
