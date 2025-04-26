alarm[0] = 1;

var _prowler = instance_nearest(x,y, oProwler)
var _inst = instance_nearest(x,y, oEnergy_rock)

if (!instance_exists(_inst)) or distance_to_object(_inst) > _prowler.cure_dis {
	
	_prowler.state = STATE_ATTACK;	
	
}

if instance_exists(_prowler) and instance_exists(_inst) and distance_to_object(_inst) <= _prowler.cure_dis  and _prowler.state == STATE_CURE {


	x = _prowler.x;
	y = _prowler.y;
	

	
		
	image_flicker = true;

	
	direction = point_direction(_prowler.x, _prowler.y, _inst.x, _inst.y)
	image_angle = direction



	var max_lenght = distancia_laser
	for (var i = 0; i < max_lenght; i++ ) {
	
		xEnd = x + lengthdir_x(i, image_angle);
		yEnd = y + lengthdir_y(i, image_angle);
	
		lenght_laser = i;
		//sprite_set_bbox(spr_frame_laser_hitbox, 0, 13, lenght_laser,53)
	
		
		if (collision_point(xEnd,yEnd, _inst, 0, 0) ) {
		//if (place_meeting(x, y, oWall)){
			//part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_hit, 1);
			//part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_spark, 1);

			_prowler.hp += 0.01;
			_inst.speed = 0;
		break;
		}
	}
	
}  else {
		instance_destroy(self)
	
		}

	


/*
if image_index >= 27{
	sprite_index = spr_Player_laser
	image_flicker = true;
}

if (image_flicker == true) {
	image_yscale = random_range(0.95,1.05);
}

