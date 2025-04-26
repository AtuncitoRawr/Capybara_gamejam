if (!active) { exit; }

draw_self();

if sprite_index == spr_Inventory_Box {
	var inventorySize = ds_list_size(objSystem.inventory);
	var i1 = max(cursor - 3, 0);
	if (i1 + 8 >= inventorySize) { i1 = max(inventorySize - 8, 0); }

	var i2 = min(i1 + 8, inventorySize);

	var posy = 0;

	for (var i=i1;i<i2;i++) {
		item = objSystem.inventory[| i];
		itemDef = global.ITEMS[item[INVENTORY_ITEM]];
	
		draw_sprite(itemDef[ITEM_DEF_SPRITE], 0, x + 25, y + 3 + posy);
		draw_set_color(c_white)
		draw_set_font(global.TEXTBOX_FONT2);
		draw_text(x + 89, y + 20 + posy, itemDef[ITEM_DEF_NAME]);

		draw_set_halign(fa_right);
		draw_text(x + 303, y + 20 + posy, "x" + string(item[INVENTORY_QUANTITY]));
		draw_set_halign(fa_left);
	
		if (i == cursor) {
			draw_sprite(spr_Cursor, 0, x + 10, y + 20 + posy);
		}
	
		posy += 48;
	}
}