function scrUseReparador(){
	
	
	if (ITEM_ID_REPARADOR != 0) 
	{
		if obj_player.hp < obj_player.hpmax - 20 {
			obj_player.hp += 20
				return true;
		} else if obj_player.hp != obj_player. hpmax 
		{
		
			obj_player.hp = obj_player.hpmax
	
			return true
		}
	}
	else {
		return false;
	}
}