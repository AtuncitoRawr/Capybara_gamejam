alpha += alphaSpd;
alpha = clamp(alpha, 0, 1);


if global.shootKey && alpha >= 1
{
	room_restart();
	instance_destroy();
	audio_stop_all();
	
	
}