controlSetup();


depth = -9999;
finish_text = false;
// parametros de la caja de texto
textbox_width = 240;
textbox_height = 80;
txtb_dir = 0;
border = 4;
line_sep = 12;
line_width = textbox_width - border*2;
owner_id = 0;

txtb_op_spr = sText_box;
txtb_spr[0] = sText_box;
txtb_img = 0;
txtb_img_spd = 6/60;

//Redaccion del texto

page = 0;
page_number = 0;
text[0] = "";


text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
chay_y[0, 0] = 0;

draw_char = 0;
text_speed = 0.4;

//opciones
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;


//Movimiento de opciones con el joystik
yaxisvalueLeft = 0;
yaxisup = false;
yaxisdown = false;

setup = false;


//Sonido

snd_delay = 4;
snd_count = snd_delay;

//Efectos

scrSet_default_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;