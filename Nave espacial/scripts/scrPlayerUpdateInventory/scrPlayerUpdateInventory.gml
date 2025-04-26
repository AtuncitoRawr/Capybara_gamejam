function scrPlayerUpdateInventory(){
	if global.OpenInventory {

		scrCloseInventory();
	}
	
	
	if (Obj_ItemDetail.item == noone) {
		var ver = global.swapKeyPressed
		if (ver != 0) {
			if (ver) {
				obj_InventoryBox.cursor++
				if obj_InventoryBox.cursor >= ds_list_size(objSystem.inventory) {obj_InventoryBox.cursor = 0;  }
				
			}
			//obj_InventoryBox.cursor = clamp(obj_InventoryBox.cursor + ver, 0, ds_list_size(objSystem.inventory) - 1);
		}
		
		
		if (global.shootKey) and ds_list_size(objSystem.inventory) != 0 and Obj_ItemDetail.item == noone {
			var itemId = obj_InventoryBox.item[INVENTORY_ITEM];
			Obj_ItemDetail.item = objSystem.inventory[| obj_InventoryBox.cursor];
			scrCloseInventory();
			scrUseItem(itemId);
		}
	
		else if global.Interact and ds_list_size(objSystem.inventory) != 0 {
			Obj_ItemDetail.sprite_index = spr_DetailItem
			Obj_ItemDetail.item = objSystem.inventory[| obj_InventoryBox.cursor];
			Obj_ItemDetail.itemDef = global.ITEMS[Obj_ItemDetail.item[INVENTORY_ITEM]];
		}
	} else {
		if (global.shootKey) and ds_list_size(objSystem.inventory) != 0 {
			var itemId = Obj_ItemDetail.item[INVENTORY_ITEM];
			scrCloseInventory();
			scrUseItem(itemId);
		}
		
		if global.Interact and Obj_ItemDetail != noone {
			Obj_ItemDetail.item = noone;
			Obj_ItemDetail.itemDef = noone;
		}
	}
}