function scrRemoveItem(itemId){
	var item = scrGetItem(itemId);
	
	if (item != noone) {
		var pos = ds_list_find_index(objSystem.inventory, item);
		ds_list_delete(objSystem.inventory, pos);
	}
}