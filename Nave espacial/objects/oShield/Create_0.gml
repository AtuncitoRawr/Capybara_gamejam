instance_create_layer(x,y, "ui", obj_shieldbar);
event_inherited();

hp = 100;
hpmax = 100;
hpprev = hpmax;
followuptimermax = 60;
followuptimer = 0;
state = STATE_IDLE;
shield = true;

mydirection = obj_player.image_angle
loop = false
audio_play_sound(snd_shield_idle, 0, true)