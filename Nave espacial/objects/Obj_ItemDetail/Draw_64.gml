if (item == noone) { exit; }

draw_self();

if sprite_index == spr_Detail {
	draw_set_color(c_white)
	draw_set_font(global.TEXTBOX_FONT);

	draw_sprite(itemDef[ITEM_DEF_SPRITE], 0, x + 15, y + 3);

	draw_text(x + 84, y + 15, itemDef[ITEM_DEF_NAME]);

	draw_text_ext(x + 15, y + 63, itemDef[ITEM_DEF_DESCRIPTION], 30, 570);

	draw_set_halign(fa_right);
	draw_text(x + 560, y + 15, "x" + string(item[INVENTORY_QUANTITY]));
	draw_set_halign(fa_left);
}