function calc_entity_movement() {
	///@desc mueve al enemigo y aplica arrastre
	
	//aplicar movimiento
	x += hsp;
	y += vsp;
	// desaceleracion
	
	hsp *= global.drag;
	vsp *= global.drag;
	
	check_if_stopped();
}

function calc_knockback_movement() {
	x += hsp;
	y += vsp;
	//slowdown
	hsp *= 0.91
	vsp *= 0.91
	
	check_if_stopped();
	
	if knockback_time <= 0 state = STATE_IDLE;
}

function check_facing(){
	if knockback_time <= 0 {
		
	}
}


function Check_for_player(_id){
	if instance_exists(_id) {
	if _id.state == STATE_DEAD exit;	

	var _dis = distance_to_object(_id);
	
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis { 
		
		alert = true;
	
	
			var _tx = _id.x + lengthdir_x(attack_dis + 40, attack_angle);
			var _ty = _id.y + lengthdir_y(attack_dis + 40, attack_angle);
			if x == xp and y == yp var _type = 0 else var _type = 1;
			var _found_player =	get_path_points(path, _tx,_ty,_type);
			//var _found_player = mp_grid_path(global.mp_grid, path ,x ,y,_tx,_ty,_type);
			//en caso de que encuentre a un jugador
		
			Steering_behavior(object_index, txp, typ, 0)
	} else {
		if _dis <= attack_dis {
			//path_end();
			state = STATE_ATTACK;
		}
	}
}
}

function scrEnemy_animation(){
	
	switch(state) {
	case STATE_IDLE:
		sprite_index = s_idle;
		show_hurt();
	break;
	case STATE_MOVE:
		sprite_index = s_walk;
		show_hurt();
	break;
	case STATE_KNOCKBACK:
		sprite_index = s_hit;
		show_hurt();
	break;
	case STATE_ATTACK:
		sprite_index = s_attack;
		show_hurt()
	break;
	case STATE_DEAD:
		sprite_index = s_dead;
	break;
}

//establecer la profundidad de la instancia
//depth = -bbox_bottom;

	xp = x;
	yp = y;
	
}

function Perform_attack(_id)
{
	if instance_exists(_id) {
	path_end();
	if image_index >= attack_frame  and can_attack {
		can_attack = false;
		alarm[0] = attack_cooldown;
		
		
		var _dir = point_direction(x, y, _id.x, _id.y);
		
		//obtener la posicion de ataque
		var _xx = x + lengthdir_x(attack_dis, _dir);
		var _yy = y + lengthdir_y(attack_dis, _dir);
	
		var _inst = instance_create_layer(_xx, _yy, "Instances", o_enemy_hitbox)
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}
	}
}


function show_hurt() {
	if knockback_time-- > 0 sprite_index = s_hit;
}