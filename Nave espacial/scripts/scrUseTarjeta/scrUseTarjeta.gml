function scrUseTarjeta(){
	var door = scrGetFacingObject();
	
	if (door != noone && variable_instance_exists(door, "lock")) {
		obj_player.state = STATE_READING;
		obj_Textbox.callback = [scrFinishCharacterReading, [obj_player, noone]];
		
		if (door.lock == ITEM_ID_TARJETA) {
			scrOpenTexbox("Has desbloqueado la puerta");
			door.lock = noone;
			return true;
		} else if (door.lock != noone) {
			scrOpenTexbox("La llave no encaja");
		} else {
			scrOpenTexbox("No pasa nada");
		}
	}
	
	return false;
}