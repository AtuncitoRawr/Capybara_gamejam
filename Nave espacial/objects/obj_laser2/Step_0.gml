if instance_exists(obj_queen_mimic) and instance_exists(obj_player) {
	x = obj_queen_mimic.x
	y = obj_queen_mimic.y
	image_angle = point_direction(obj_queen_mimic.x, obj_queen_mimic.y, obj_player.x, obj_player.y)
	if image_index >= 25
	 {
		instance_change(oLaser, true)
		scrScreenshake(15,45)
		audio_play_sound(snd_boss_laser, 0, true)
	}
} else { instance_destroy(self); }