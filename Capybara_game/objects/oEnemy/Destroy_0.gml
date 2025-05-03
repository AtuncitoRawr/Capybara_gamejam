// Notify spawner when killed
with (oSpawner) {
    enemies_killed_this_wave++;
	total_enemies_killed++; 
    
    // Check if wave complete
    if (enemies_killed_this_wave >= wave_enemy_count && 
        current_wave < total_waves)
    {
        alarm[0] = 60; // 1 second delay before next wave
    }
}