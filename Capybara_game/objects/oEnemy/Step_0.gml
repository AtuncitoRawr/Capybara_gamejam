//enemigos tocan al jugador
if (place_meeting(x,y,oSpaceship)) {
	instance_destroy();
}

move_wrap(true, true, 0);
var distance = distance_to_object(oSpaceship);

if (instance_exists(target)) and distance>rango{
	
	if (global.senial != "activa") {
		var angle_to_player = point_direction(x, y, target.x, target.y);
    
		// Set ship rotation
		image_angle = angle_to_player;
	}
    // Predict player position (adjust 0.3 for aggression)
    var predict_x = target.x + target.hspeed * 0.3;
    var predict_y = target.y + target.vspeed * 0.3;
    
    // Smooth turning (higher = sharper turns)
    var turn_speed = 0.1;
    var desired_dir = point_direction(x, y, predict_x, predict_y);
    direction = lerp(direction, desired_dir, turn_speed);
	
	
	
    
  
}


if (instance_exists(target) && distance <= rango) and global.senial == "activa" and global.flojo == "no"{
    
	// Count down shoot timer every frame
    if (shoot_delay_timer > 0) {
        shoot_delay_timer--;
    }
    
    // When timer reaches 0, shoot and reset
    if (shoot_delay_timer <= 0) {
        // Calculate direction to player
        var shoot_dir = point_direction(x, y, target.x, target.y);
        
        // Create bullet
        var bullet = instance_create_layer(x, y, "Instances", oBullet_E);
        bullet.direction = shoot_dir;
        bullet.speed = 3; // Or your bullet speed
        
        // Reset timer with random variation (1-3 seconds)
        shoot_delay_timer = shoot_delay + irandom(30); 
        // shoot_delay should be defined in Create Event (e.g., shoot_delay = 60;)
        
      
    }
}
