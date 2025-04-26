function scrPlayerCheckMenus(){
	if global.OpenInventory and obj_player.state == STATE_IDLE {
		audio_play_sound(snd_open_inventory,0,false)
		obj_InventoryBox.sprite_index = spr_textboxanimation
		obj_InventoryBox.active = true;
		obj_InventoryBox.cursor = 0;
		state = STATE_INVENTORY;
	}
}