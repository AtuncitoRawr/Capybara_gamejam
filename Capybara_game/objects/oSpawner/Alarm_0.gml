// Start next wave if conditions met

if (current_wave == 1 and enemies_killed_this_wave == wave_enemy_count) {
	var bubble = instance_create_layer(room_width/2, room_height/2, "Instances", oBurbuja);
	bubble.texto = "Se viene el siguiente desafio..."
	global.wave1 = "no";
	with (oEnemy) {
    instance_destroy();
}
	audio_pause_sound(global.music);
	audio_play_sound(sndVictoriaNave, 1, false);
	audio_sound_gain(sndVictoriaNave, 0.3, 0);
}

if (current_wave == 0 || 
    (current_wave < total_waves && enemies_killed_this_wave >= wave_enemy_count))
{
    current_wave++;
    enemies_spawned_this_wave = 0;
    enemies_killed_this_wave = 0;
    spawn_timer = 1; // Start spawning immediately
    
    // Show wave message
    //show_message("Wave " + string(current_wave) + " Started!");
	
	//bubble.message = "Wave " + string(current_wave) + " Complete!";
	//alarm[0] = 1
}
