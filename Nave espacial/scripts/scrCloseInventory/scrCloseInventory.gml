function scrCloseInventory(){
	audio_play_sound(snd_close_inventory,0,false)
	obj_InventoryBox.active = false;
	Obj_ItemDetail.item = noone;
	Obj_ItemDetail.itemDef = noone;
	state = STATE_IDLE;
}