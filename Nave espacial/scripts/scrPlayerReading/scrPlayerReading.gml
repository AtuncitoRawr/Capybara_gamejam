function scrPlayerReading(object, npc){
		if instance_exists(obj_player) and obj_player.state == STATE_IDLE 
		{
		obj_player.state = STATE_READING;
		obj_Textbox.callback = [scrFinishCharacterReading, [object, npc]];
		}
}