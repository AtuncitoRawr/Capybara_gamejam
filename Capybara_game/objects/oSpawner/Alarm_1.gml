if (!victory_message_shown) {
    // Stop all enemies (optional)
    with (oEnemy) instance_destroy();
    
    // Show victory message
    //show_message("CONGRATULATIONS!\nYou defeated all waves!");
	/*
	var bubble = instance_create_layer(room_width/2, room_height/2, "Instances", oBurbuja);
	bubble.texto = "Estas un paso mas cerca de la libertad..."
	*/
	
	floatText(0, 0, 4, 0.01, "Estas un paso mas cerca de la libertad...", 0.5, c_red)
    global.spaceWins++
	alarm[4] = 180;

    victory_message_shown = true;
	

    // Optional: Stop spawner
    instance_deactivate_object(id);
}