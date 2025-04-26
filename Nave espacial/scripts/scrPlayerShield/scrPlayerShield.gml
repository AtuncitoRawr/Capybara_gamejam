function scrPlayerShield()
{
	with obj_player {
	
		if state == STATE_IDLE and instance_number(oShield) == 0 and shield == true
		{
			var _shield = instance_create_layer(obj_player.x,obj_player.y, "Instances", oShield);
			_shield.image_angle = obj_player.image_angle
		

		}
	}
}