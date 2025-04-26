if state == BOSS_IDLE && fondo_1 == 0{
	
	audio_play_sound(snd_queen_mimic_sleep,2,true)
	fondo_1 = 1;
}

if state == BOSS_IDLE && animation == 0 && distance_to_object(obj_player) < 200 {
	state = BOSS_FIRST_VIEW
	animation = 1;
	sprite_index = spr_boss_mimic_open_eye_1;
	oCamera.follow = obj_queen_mimic
	audio_stop_sound(snd_queen_mimic_sleep)
	obj_player.state = STATE_CINEMATIC;
	
}
if state == BOSS_ATTACK {
	//camera_set_view_target(view_camera[0],obj_player)
	//camera_set_view_speed(view_camera[0],30,30)
	oCamera.follow = obj_player
	
}

if state != BOSS_ATTACK || ataque == BOSS_ATTACK_ASAULT || ataque == BOSS_ATTACK_GATLING || ataque == BOSS_ATTACK_CHILDREN{ exit;}

speed = 2
if instance_exists(obj_player) and obj_player.state != STATE_DEAD{
	move_towards_point(obj_player.x,obj_player.y,2)

} else {
	speed = 0;	
}

if instance_exists(obj_player) and obj_player.state != STATE_DEAD && distance_to_object(obj_player) >= 600 {
	
	speed = lerp(speed, speed + 8, 0.05)
} else if instance_exists(obj_player) and obj_player.state != STATE_DEAD {
	speed = 2;
} else {
	speed = 0;	
}


if hp <= 0 {
	hp = 0;
	instance_destroy();
	
	
}
	
