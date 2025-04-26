//Cracion de variables/Setup del menu

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

yaxisleft_pressed = false;

menu_x = gui_width - 1600;
menu_y = gui_height - (gui_margin + 64);
menu_x_target = gui_width - gui_margin - 1300;
menu_speed = 20; //Valor menor es mas rapido
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu)
menu_commited = -1; //valor del item seleccionado
menu_control = true; //valor que permite mover entre las opciones

//opciones
menu[2] = "Nuevo Juego";
menu[1] = "Continuar";
menu[0] = "Salir";

menu_items = array_length(menu);
menu_cursor = 2;


audio_play_sound(snd_menu, 1, true)
