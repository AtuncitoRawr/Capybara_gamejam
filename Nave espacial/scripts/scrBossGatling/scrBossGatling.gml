var gatling = function()

{
	if instance_exists(obj_queen_mimic) and instance_exists(obj_player) && obj_queen_mimic.ataque == BOSS_ATTACK_GATLING && obj_queen_mimic.state == BOSS_ATTACK  { 
		var _rock = instance_create_layer(obj_queen_mimic.x,obj_queen_mimic.y, "laser", obj_boss_bullet);
			_rock.image_angle = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,obj_player.x,obj_player.y);
			_rock.direction = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,random_range(obj_player.x + 720, obj_player.x - 720),
			random_range(obj_player.y + 720, obj_player. y - 720));
			audio_play_sound(snd_boss_gatling,0,false)
			obj_queen_mimic.speed = 0;
	}
}

mytimer = time_source_create(time_source_game, 0.08, time_source_units_seconds,gatling, [], -1);

time_source_start(mytimer);


var laser = function()

{

	if instance_exists(obj_queen_mimic) and instance_exists(obj_player) && obj_queen_mimic.ataque == BOSS_ATTACK_LASER && obj_queen_mimic.state == BOSS_ATTACK  { 
		var _laser = instance_create_layer(obj_queen_mimic.x,obj_queen_mimic.y, "laser", obj_laser);
			_laser.image_angle = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,obj_player.x,obj_player.y);
			_laser.direction = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,obj_player.x,obj_player.y);
			audio_play_sound(snd_laser_blast, 0, false)
			
	}
}

mytimer2 = time_source_create(time_source_game, 3, time_source_units_seconds,laser, [], -1);

time_source_start(mytimer2);


var mimic = function()

{

	
}

mytimer3 = time_source_create(time_source_game, 2, time_source_units_seconds,mimic, [], -1);

time_source_start(mytimer3);


var laser2 = function()

{

	if instance_exists(obj_queen_mimic) and instance_exists(obj_player) && obj_queen_mimic.ataque == BOSS_ATTACK_LASER2 && obj_queen_mimic.state == BOSS_ATTACK  { 
		var _laser2 = instance_create_layer(obj_queen_mimic.x,obj_queen_mimic.y, "Bullets", obj_laser2);
			audio_play_sound(snd_laser_blast, 0, false)
			obj_queen_mimic.alarm[6] = 240
			
	}
}

mytimer4 = time_source_create(time_source_game, 5, time_source_units_seconds,laser2, [], -1);

time_source_start(mytimer4);

/*
		var _mimic = instance_create_layer(obj_queen_mimic.x + 600,obj_queen_mimic.y, "instances", obj_mimic);
		_mimic = instance_create_layer(obj_queen_mimic.x - 600,obj_queen_mimic.y, "instances", obj_mimic);
		_mimic = instance_create_layer(obj_queen_mimic.x,obj_queen_mimic.y + 600, "instances", obj_mimic);
		_mimic = instance_create_layer(obj_queen_mimic.x,obj_queen_mimic.y - 600, "instances", obj_mimic);
		_mimic.image_angle = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,obj_player.x,obj_player.y);
		_mimic.direction = point_direction(obj_queen_mimic.x,obj_queen_mimic.y,obj_player.x,obj_player.y);

