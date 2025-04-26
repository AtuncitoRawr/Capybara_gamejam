function scrPlayerShooting(){
/*
with(obj_player){
	
	weapon.cooldown -= 1;
	if (mouse_check_button_pressed(mb_left) && weapon.cooldown <= 0) {
		audio_play_sound(snd_shoot,0,false,1,0, random_range(0.8, 1.2));
		var _bullet = instance_create_layer(x,y, "Bullets", weapon.bulletobject);
		_bullet.image_angle = point_direction(x,y,mouse_x,mouse_y);
		_bullet.direction = _bullet.image_angle
		
	weapon.cooldown = 30
	}
}
*/
	if weapon.typebullet == TYPE_BULLET {
		if global.shootKey {
			if can_throw_bomb {
				can_throw_bomb = false;
				state = STATE_ATTACK;
				obj_player.alarm[7] = 30;
				obj_player.alarm[5] = weapon.cooldown;
				var _inst = instance_create_layer(x,y, "Instances", weapon.bulletobject);
				_inst.image_angle = obj_player.Aimdir;
				_inst.direction = _inst.image_angle
				audio_play_sound(snd_throw_mine,0,false,1,0, random_range(0.8, 1.2));
					with(_inst){
						hsp = lengthdir_x(other.weapon.hsp, other.Aimdir);
						vsp = lengthdir_y(other.weapon.hsp, other.Aimdir);
					}
				}
			}
		}
	 else if weapon.typebullet == TYPE_LASER {
		
			if global.shootKey and can_throw_bomb == true {
				obj_player.alarm[6] = 90;
				state = STATE_ATTACK
				obj_player.alarm[5] = weapon.cooldown
				obj_player.alarm[7] = 90;
				if !(instance_exists(weapon.bulletobject)){
					if global.controllermode == 0 {
					instance_create_layer(mouse_x,mouse_y, "Instances", weapon.bulletobject);
					}
					if global.controllermode == 1 {
						if global.xaxisRight != 0 || global.yaxisRight != 0 {
						instance_create_layer(global.xaxisRight, global.yaxisRight, "Instances", weapon.bulletobject);
						}
					}
				}
			} else if can_throw_bomb == false {
 
				instance_destroy(weapon.bulletobject);
		}

		
	}
}