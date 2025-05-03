// - Spawn timer ready
var current_max = (current_wave == 1) ? max_enemies_easy : max_enemies_hard;
if (current_wave > 0 && 
    enemies_spawned_this_wave < wave_enemy_count &&
    instance_number(oEnemy) < current_max &&
    spawn_timer <= 0 and global.wave1 == "si" and global.semurio != "si")
{
    if (current_wave == 2) {
        global.senial = "activa";
    }
	
	//Random spawn position at edges
    var spawn_x = choose(32, room_width - 32);
    var spawn_y = choose(0, room_height - 32);
    
    // Create enemy
    var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", oEnemy);
    if (global.senial == "activa") {
	enemy.sprite_index = sEnemigo;
	}
    // Set difficulty properties
   
    
    // Update counters
    enemies_spawned_this_wave++;
    
    // Set next spawn delay (1-3 seconds)
    spawn_timer = irandom_range(
        (current_wave == 1 ? easy_spawn_delay/2 : hard_spawn_delay/2),
        (current_wave == 1 ? easy_spawn_delay : hard_spawn_delay)
    );
}
else if (spawn_timer > 0) {
    spawn_timer--;
}

if (!all_waves_complete && total_enemies_killed >= total_enemies_to_kill) {
    all_waves_complete = true;
    alarm[1] = 1; // Trigger victory sequence
    
    // Debug confirmation
    show_debug_message("VICTORY! Total kills: " + string(total_enemies_killed));
}
