global.font_main_big = font_add_sprite_ext(spr_font_text_big_black,  " !¡\"#$%&'()*+,-./0123456789:;<=>¿?@ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ[]_^`´abcdefghijklmnñopqrstuvwxyzáéíóú{|}~",true,2);
global.font_main = font_add_sprite_ext(spr_font_text,  " !¡\"#$%&'()*+,-./0123456789:;<=>¿?@ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ[]_^`´abcdefghijklmnñopqrstuvwxyzáéíóú{|}~",true,1);



global.timeStop = 1;
global.target_delta = 1/60;
global.actual_delta = delta_time/1000000
global.delta_multiplier = global.actual_delta/global.target_delta
global.pause = 0;
global.controllermode = 0;
global.showStats = 0;
check = false;

frameHitDelay = 0;

global.Coins = 0;