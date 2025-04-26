alarm[0] = 1;

if instance_exists(obj_player) and obj_player.state != STATE_DEAD{
instance_create_layer(obj_player.x,obj_player.y, "ui", oLaser_source)
if (!instance_exists(oLaser_final_1))
{
instance_create_layer(xEnd,yEnd, "ui", oLaser_final_1)
}

	x = obj_player.x;
	y = obj_player.y;
	
	scrScreenshake(5,45)
	
	image_flicker = true;

	direction = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y)
	image_angle += angle_difference(direction,image_angle) * 0.02;



	var max_lenght = distancia_laser
	for (i = 0; i < max_lenght; i++ ) {
	
		xEnd = x + lengthdir_x(i, image_angle);
		yEnd = y + lengthdir_y(i, image_angle);
	
		lenght_laser = i;
		//sprite_set_bbox(spr_frame_laser_hitbox, 0, 13, lenght_laser,53)
	
		
		if (collision_point(xEnd,yEnd, oWall, 0, 0) ) {
		//if (place_meeting(x, y, oWall)){
			part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_hit, 1);
			part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_spark, 1);
		
		break;
		}
		else if (collision_point(xEnd,yEnd, oShield, 0, 0) ) and (oShield.shield == true) {
		
			part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_hit, 1);
			part_particles_create(o_particle_setup.particle_system, xEnd, yEnd, o_particle_setup.particleType_spark, 5);
			part_particles_create(o_particle_setup.particle_system, oShield.x, oShield.y, o_particle_setup.particleType_spark, 1);
			oShield.hp -= 0.5
			audio_play_sound(snd_shield_collision,0,false,1,0, random_range(0.9, 1.1));
		break;
		}
	}

	if instance_exists(o_Enemy) and (o_Enemy.shield == false) {
	
		var _list = ds_list_create();
		var hits = collision_line_list(x,y, xEnd, yEnd, o_Enemy, 0, 0, _list, 0);
		
			if (hits > 0 ) {
			
				for (var k = 0; k < hits; ++k) {
		
					_list[| k].hp = _list[| k].hp -5;
				
				}
			}
		ds_list_destroy(_list);
	} 
	
	if instance_exists(obj_queen_mimic)  {
	
		var _list = ds_list_create();
		var hits = collision_line_list(x,y, xEnd, yEnd, obj_queen_mimic, 0, 0, _list, 0);
		
			if (hits > 0 ) {
			
				for (var k = 0; k < hits; ++k) {
		
					_list[| k].hp = _list[| k].hp -0.1;
				
				}
			}
		ds_list_destroy(_list);
	} 
} else {instance_destroy(self) }

	


/*
if image_index >= 27{
	sprite_index = spr_Player_laser
	image_flicker = true;
}

if (image_flicker == true) {
	image_yscale = random_range(0.95,1.05);
}

