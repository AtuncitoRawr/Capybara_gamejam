function scrUseItem(itemId){
	var item = scrGetItem(itemId);
	
	if (item != noone) {
		var itemDef = global.ITEMS[itemId];
		var action = itemDef[ITEM_DEF_ACTION];

		if (action != noone) {
			if (!action()) {
				exit;
			}
		}
		
		item[@ INVENTORY_QUANTITY] -= 1;
		
		if (item[INVENTORY_QUANTITY] <= 0) {
			scrRemoveItem(itemId);
		}
	}
}