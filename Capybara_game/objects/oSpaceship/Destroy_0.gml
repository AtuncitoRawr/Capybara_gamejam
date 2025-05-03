// Stop all game objects
with (oEnemy) speed = 0;
with (oBullet_E) speed = 0;
global.semurio = "si";

/*
var bubble = instance_create_layer(room_width/2, room_height/2, "Instances", oBurbuja);
//bubble.texto = "La libertad se aleja..."
bubble.sprite_index = Sprite27;
*/
floatText(0, 0, 4, 0.01, "La libertad se aleja...", 0.5, c_red)
oSpawner.alarm[2] = 180;
//audio_stop_sound(global.music);
//global.music = audio_play_sound(Estatica, 0, true);
//audio_sound_gain(global.music, 0.3, 0);

layer_vspeed("Backgrounds_1", 0);
layer_vspeed("Backgrounds_2", 0);
layer_vspeed("Backgrounds_3", 0);

