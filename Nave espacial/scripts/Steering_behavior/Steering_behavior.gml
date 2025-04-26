function get_path_points(_path,_tx, _ty, _type)
{

	if calc_path_timer-- == 0 {
	
		calc_path_timer = calc_path_delay;
		var _found_entity = mp_grid_path(global.mp_grid, _path ,x ,y,_tx, _ty,_type);

	
	var _cuarto_x = path_get_x(_path, 0.25)
	var _cuarto_y = path_get_y(_path, 0.25)

	var _medio_x = path_get_x(_path, 0.5);
	var _medio_y = path_get_y(_path, 0.5);

	var _tres_cuarto_x = path_get_x(_path, 0.75)
	var _tres_cuarto_y = path_get_y(_path, 0.75)

	var _final_x = path_get_x(_path, 1)
	var _final_y = path_get_y(_path, 1)
	
	txp = _final_x;
	typ = _final_y;
	}
/*
	switch(path_position) {
		case 0:
		txp = _cuarto_x;
		typ = _cuarto_y;
		break;
	
		case 0.25:
		txp = _medio_x;
		typ = _medio_y;
		break;
	
		case 0.5:
		txp = _tres_cuarto_x;
		typ = _tres_cuarto_y;
		break;
	
		case 0.75:
		txp = _final_x;
		typ = _final_y;
		break;
	}*/
}


function Steering_behavior(_sid, _tx,_ty, _run){



		var _angle;
		if _run == 1{
			_angle = 180;
		} else {
			_angle = 0;	
		}
		//----- Increase or Decrease Sensor Count -----\\
		//----- Set Interest Sensors -----\\
		var i,angle,goal_direction,difference;
		goal_direction = point_direction(x,y,_tx,_ty) + _angle//find target direction
		for (i=0;i<oa_sensor_count;i++) //loop through all interest sensors
			{
			angle = (360 / oa_sensor_count) * i //direction of current sensor
			difference = abs(angle_difference(angle,goal_direction)) //find angle difference of sensor from goal direction
			oa_interest_sensor[i] = (180 - difference) / 180 //set sensor to normalized difference
			}

		//----- Set Danger Sensors -----\\
		var j,n,col,distance,list,weight;
		for (i=0;i<oa_sensor_count;i++)
			{
			oa_danger_sensor[i] = 0 //reset danger sensor to 0
			angle = (360 / oa_sensor_count) * i //direction of current sensor
			list = ds_list_create() //create list for collision line detection
			//fill list with collidable targets (par_detectable)
			n = collision_line_list(x,y,x+lengthdir_x(oa_sensor_length,angle),
			y+lengthdir_y(oa_sensor_length,angle),o_INSTANCE,1,1,list,0)
			//loop through list of collidable instances to affect danger sensors
			for (j=0;j<n;j++)
				{
				col = ds_list_find_value(list,j) //get collidable instance
				distance = point_distance(x,y,col.x,col.y) //get distance to collidable instance origin
				
				switch _sid {
				
				case oProwler:
					switch col.object_index //set danger weight based on object type
						{			
						case oProwler: 
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case obj_queen_mimic:
						if instance_exists(col.object_index) {
						weight = 1.5; break; //full weight if wall
						}
						case oMimic:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case obj_player:
						if instance_exists(col.object_index) {
						weight = 1.5; break; //full weight if wall
						}
						case oWall:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall				
						}
						case oWalldest:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall				
						}
						case oShield:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case oEnergy_rock:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case obj_rock_big:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
			
						case oMine:
						if instance_exists(col.object_index) {
						weight = 0; break; //full weight if wall
						}
						case o_bottle:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
						case oPortalmimic:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
						case OmimicportalSpawn:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
					}break;
					
					case oMimic:
					switch col.object_index //set danger weight based on object type
						{			
						case oProwler: 
						if instance_exists(col.object_index) {
						weight = 0; break; //full weight if wall
						}
						case oMimic:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case obj_queen_mimic:
						if instance_exists(col.object_index) {
						weight = 1.5; break; //full weight if wall
						}
						case obj_player:
						if instance_exists(col.object_index) {
						weight = 0; break; //full weight if wall
						}
						case oWall:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall				
						}
						case oWalldest:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall				
						}
						case oShield:
						if instance_exists(col.object_index) {
						weight = 0; break; //full weight if wall
						}
						case oEnergy_rock:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
						case obj_rock_big:
						if instance_exists(col.object_index) {
						weight = 1.0; break; //full weight if wall
						}
				
						case oMine:
						if instance_exists(col.object_index) {
						weight = 0; break; //full weight if wall
						}
						case o_bottle:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
						case oPortalmimic:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
						case OmimicportalSpawn:
						if instance_exists(col.object_index) {
						weight = 1; break; //full weight if wall
						}
					}break;
				}
				//set danger sensor based on distance from collidable instance and weight
		
				oa_danger_sensor[i] = max(oa_danger_sensor[i],(oa_sensor_length - distance) / oa_sensor_length * weight);
				}
			ds_list_destroy(list) //free up collision list
			}

		//----- Calculate Resulting Direction -----\\
		var i,result_x,result_y,potential_list,dir;

		//populate potential direction list with danger directions below a fixed amount
		potential_list = ds_list_create()
		for (i=0;i<oa_sensor_count;i++)
			{
			//if danger result is < .4 add to "OK" directions list
			if oa_danger_sensor[i] < .4
				{
				ds_list_add(potential_list,i)
				}
			}

		//average interest directions from potential list weighted based on interest direction value
		var potential_direction,interest,diff;
		result_x = 0
		result_y = 0
		for (i=0;i<ds_list_size(potential_list);i++)
			{
			potential_direction = ds_list_find_value(potential_list,i)
			interest = oa_interest_sensor[potential_direction]
			dir = (360 / oa_sensor_count) * potential_direction
			//further weight based on how close direction is to current direction to favor current direction
			diff = abs(angle_difference(dir,oa_result))
			result_x += lengthdir_x(interest,dir) * sqr((180 - diff) / 180)
			result_y += lengthdir_y(interest,dir) * sqr((180 - diff) / 180)
			}
	
		ds_list_destroy(potential_list)
		oa_result = point_direction(0,0,result_x,result_y)

		//----- Movement and image_angle Update -----\\
		
		switch(state)
		{
		case STATE_ATTACK:
		x += lengthdir_x(move_spd + 2, oa_result)
		y += lengthdir_y(move_spd + 2, oa_result)
		break;
		
		case STATE_MOVE:
		x += lengthdir_x(move_spd, oa_result)
		y += lengthdir_y(move_spd, oa_result)
		break;
		
		case STATE_IDLE:
		x += lengthdir_x(move_spd - 2, oa_result)
		y += lengthdir_y(move_spd - 2, oa_result)
		break;
		

		case STATE_FLEE:
		x += lengthdir_x(move_spd, oa_result)
		y += lengthdir_y(move_spd, oa_result)
		break;
		}
		image_angle -= angle_difference(image_angle,oa_result)/8
		}

