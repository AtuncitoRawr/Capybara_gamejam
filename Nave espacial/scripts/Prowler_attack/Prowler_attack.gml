function Wandering_movement(_sid) {
	
	var _area = point_in_circle(x,y,xstart,ystart,200);

		if can_path == true {
		can_path = false;
		_sid.alarm[3] = 120
	
	
		_tx = xstart + lengthdir_x(200, irandom(360));
		_ty = ystart + lengthdir_y(200, irandom(360));
	
		}
		if state == STATE_IDLE {
		
		get_path_points(ppath, _tx, _ty, 1)
		if distance_to_point(txp,typ) >= 5 {
			Steering_behavior(_sid,txp ,typ,0);
		}
	}
}


function Prowler_attack(){
	
		if instance_exists(target_id) and target_id.state != STATE_DEAD  {
		
		var _far = distance_to_object(target_id);
		
		
		if _far <= range {
			if follow_object == true {
			follow_object = false;
			var _circle = instance_create_layer(x,y,"Instances",oPath);
			fo = _circle.object_index;
			}
			if instance_exists(fo) {
			var _circle = fo;
			_circle.target_x = target_id.x
			_circle.target_y = target_id.y
			_circle.owner = id;
			
			
		get_path_points(ppath, _circle.x, _circle.y,true);
			
		Steering_behavior(object_index, txp, typ, 0);
			}
		} else {
			if instance_exists(fo) {	
			instance_destroy(fo);
			}
			follow_object = true;
			path_end();
			state = STATE_IDLE;	
				
		}
		

	} else {
		if instance_exists(fo) {
			instance_destroy(fo);
		}
			follow_object = true;
			path_end();
			state = STATE_IDLE;	
		}
	}

function Prowler_shoot() {
	
	if instance_exists(target_id){
		var _ndir = point_direction(x, y, target_id.x, target_id.y)

	
		if image_index >= attack_frame  and can_attack {
			can_attack = false;
			alarm[0] = attack_cooldown;
	
		var _bullet = instance_create_layer(x, y, "bullets",oProwlerbullet)
		audio_play_sound(snd_throw_mine,0,false,1,0, random_range(0.6, 1));
		_bullet.direction = _ndir
		_bullet.image_angle = _bullet.direction

		}
	}
}

function Prowler_flee(_id) {
	
		if instance_exists(_id)  {
			
		path_end();
		
		var _dir = point_distance(_id.x, _id.y, x, y);

	
		var _inst = instance_nearest(x,y,oEnergy_rock);
		if instance_exists(_inst) {
			
		var _rockp = point_distance(x,y,_inst.x, _inst.y)
		}
		
			if _inst != noone and distance_to_point(_inst.x,_inst.y) <= 1000 and (!collision_line(x,y,_inst.x,_inst.y, o_solid, 1, 1))
				{
					
				if _rockp > cure_dis {
					var _xx = _inst.x + lengthdir_x(cure_dis, attack_angle);
					var _yy = _inst.y + lengthdir_y(cure_dis, attack_angle);
					
					
					//Steering_behavior(object_index, _xx, _yy, 0)
					
					var _start_flee = mp_grid_path(global.mp_grid, ppath, x, y, _xx, _yy, true)
	
					if _start_flee {
		
						path_start(ppath, move_spd, path_action_stop, false)	
					}
				}
			
				else {
					if _rockp <= cure_dis  {
				
					path_end();
					state = STATE_CURE;
					}
				} 
		} else {
			path_end();

			Steering_behavior(object_index, _id.x, _id.y, 1)
			/*
			var _start_flee = mp_grid_path(global.mp_grid, ppath, _id.x, _id.y, x, y, true)
			if _start_flee {
						path_start(ppath, move_spd, path_action_stop, false)
						
			}*/
		}
	} else {
	path_end();
	state = STATE_IDLE;
		
	}
			
	
}

function Prowler_regeneration(_dis){
	
	
	path_end();
	
	if instance_exists(oEnergy_rock) {
	var _inst = instance_nearest(x,y, oEnergy_rock)
	
	var _dir = point_direction(x,y, _inst.x, _inst.y)
	var _xx = x + lengthdir_x(cure_dis, _dir);
	var _yy = y + lengthdir_y(cure_dis, _dir);
	instance_create_layer(x,y,"Instances", oMine_laser);
	
	if hp >= hp_max {
	if instance_exists(_dis) {
	 state = STATE_ATTACK;
	} else {
	 state = STATE_IDLE;	
	}
	 hp = hp_max
	_inst.speed = 0.5;
	
}
	}
	
	
}

function check_life(_id) {
	
	if hp <= 0 {
		state = STATE_DEAD;	
	} else if hp <= 30 and state != STATE_CURE and instance_exists(_id) {
		state = STATE_FLEE;		
	}
}