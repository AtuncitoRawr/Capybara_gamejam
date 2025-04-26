global.TEXTBOX_FONT = font_add_sprite_ext(spr_FontText, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|", true, 0);
global.TEXTBOX_FONT2 = font_add_sprite_ext(spr_FontText_1, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|", true, 0);
global.mp_grid = 0;
global.drag = 0.93;
scrInitItems();
inventory = ds_list_create();

playerStartPosition = noone;

alarm[0] = 0;

rm = room
