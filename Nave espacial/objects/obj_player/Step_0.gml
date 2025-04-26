
move_wrap(true,true,100)
if hascontrol == false { exit;}

else {


swapkeypressed = global.swapKeyPressed;


	switch (state) {
		case STATE_IDLE:
			scrPlayerMovement();
			scrPlayerCheckInteraction();
			scrPlayerCheckMenus();
			scrPlayerShooting();
			scrPlayercheckDash();
			scrPlayerCheckShield();
			WeaponSwap();
			break;
		
		case STATE_READING:
			scrPlayerCheckReading();
			break;
			
		case STATE_ATTACK:
			scrPlayerMovement();
			scrPlayercheckDash();
			break;
		
		case STATE_INVENTORY:
			scrPlayerUpdateInventory();
			scrPlayerMovement();
			break;
		
		case STATE_DASH:
			scrCharMoveTo(12,rolldirection)
			break;
			
		case STATE_CINEMATIC:
			if instance_exists(obj_queen_mimic) and obj_queen_mimic.state == BOSS_FIRST_VIEW {
		
		obj_player.image_angle = point_direction(x,y,obj_queen_mimic.x,obj_queen_mimic.y)
	}
			break;
			
		case STATE_CHECK_SHIELD:
			scrPlayerMovement();
			scrPlayerCheckMenus();
			scrPlayerShooting();
			break;
		
		case STATE_KNOCKBACK:
			calc_movement();
			check_facing();
			if knockback_time-- <= 0 state = STATE_IDLE;
			break;
		case STATE_DEAD:
			calc_movement();
			sprite_index = spr_player_dead;
			if (!instance_exists(oGameOverScreen)) instance_create_depth(0,0, -10000, oGameOverScreen);
			break;
	}
}




if hp <= 0  {
	
	state = STATE_DEAD;
}


if image_angle <= 45 || image_angle > 315 {
	face = "R"
}

else if image_angle >= 45 && image_angle <= 135 {
	face = "U"
}
else if image_angle >=135 && image_angle <= 225 {
	face = "L"
}

else if image_angle >= 225 && image_angle < 315 {
	face = "D"
}

