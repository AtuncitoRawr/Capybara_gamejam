// Wait for right-click

			//global.music = audio_resume_sound(Tema_nave, 0, true);
			audio_resume_sound(global.music)
			audio_sound_gain(global.music, 0.3, 0);
		oSpawner.alarm[3] = 1;
	
    // Unpause game
         // Restore player speed
    with (oSpawner) {
        spawn_timer = 1;           // Resume spawning
		global.wave1 = "si";
        alarm[0] = 1;              // Trigger Wave 2
		
    }
    
            // Remove bubble
