// Wave Control
current_wave = 0;   
max_waves = 2;// 0=waiting, 1=easy, 2=hard
all_waves_complete = false;
total_enemies_to_kill = 20;     // 10 per wave × 2 waves
total_enemies_killed = 0; 



max_enemies_easy = 4;        // Max 4 alive for easy wave
max_enemies_hard = 6;      // Only 4 enemies at once
enemies_spawned_this_wave = 0;
enemies_killed_this_wave = 0;
total_waves = 2;
global.senial = "no"; //activa los enemigos que disparan
global.wave1 = "si";
wave_enemy_count = 10;       // 10 enemies per wave
easy_spawn_delay = 90;       // 1.5-3s between spawns (easy)
hard_spawn_delay = 45;       // 0.75-1.5s between spawns (hard)
spawn_timer = 0;
alarm[0] = 1;
// Add these new variables
game_won = false;
victory_message_shown = false;
global.semurio = "no";
global.flojo = "no";
global.music = audio_play_sound(sndTemaEspacial, 0, true);
audio_sound_gain(global.music, 0.4, 0);
