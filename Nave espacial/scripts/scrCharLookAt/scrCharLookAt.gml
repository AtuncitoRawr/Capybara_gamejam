function scrCharLookAt(dir){
	if obj_player.state == STATE_CHECK_SHIELD { exit; }
	
	if (dir == 0) || obj_player.image_angle <= 45 || obj_player.image_angle > 315  {
		if keyboard_check(ord("W")) {
			sprite_index = spr_playerL
		} else if keyboard_check(ord("S")) {
			sprite_index = spr_playerR
		}
	} else if (dir == 90)  || obj_player.image_angle >= 45 && obj_player.image_angle <= 135  {
		if keyboard_check(ord("A")) {
			sprite_index = spr_playerL
		} else if keyboard_check(ord("D")) {
			sprite_index = spr_playerR
		}		
	} else if (dir == 180)  || obj_player.image_angle >= 135 && obj_player.image_angle <= 225  {
		if keyboard_check(ord("W")) {
			sprite_index = spr_playerR
		} else if keyboard_check(ord("S")) {
			sprite_index = spr_playerL
		} 
	} else if (dir == 270)  || obj_player.image_angle >= 225 && obj_player.image_angle <= 315  {
		if keyboard_check(ord("A")) {
			sprite_index = spr_playerR
		} else if keyboard_check(ord("D")) {
			sprite_index = spr_playerL
		}		
	} 
}
