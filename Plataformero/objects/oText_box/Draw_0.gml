getControls()

accept_key = ActionKey;

if owner_id == 0 || txtb_dir == 0 {
	textbox_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) /2 - textbox_width /2;
	textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) /1.2 - textbox_height /2;
} else{
	
	
	if txtb_dir == 1 {
	textbox_x = owner_id.x + 150;
	textbox_y = owner_id.y - 950;
	}
	
	
	if txtb_dir == -1
	{
		textbox_x = owner_id.x - 1000;
		textbox_y = owner_id.y - 950;
	}
	
}
//setup

//if setup == false 
//{
	
	setup = true;
	
	draw_set_font(Fcondorito);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	
	//Recorrer a travez de las pagonas
	for (var p = 0;p < page_number; p++){
	//encontrar cuantos caracteres hay en cada pagina y guardar ese numero en el "text_lenght" array
		text_length[p] = string_length(text[p]);
	//obtener la posicion x de la caja de texto
		
		//Personaje a la izquierda
		text_x_offset[p] = 88;
		portrait_x_offset[p] = -80;
		//Personaje a la derecha
		if speaker_side[p] == -1 {
			text_x_offset[p] = 0;
			portrait_x_offset[p] = 393;
		}
		//sin personaje (centrar la caja de texto)
		if speaker_sprite[p] == noone {
		text_x_offset[p] = 44;
		}
		
		
		//Configurar cada caracter individual y encontrar en que linea se deberia romper
		for(var c = 0;c < text_length[p]; c++) {
			
			var _char_pos = c+1;
			
			//Almacenar los caracteres individuales en el "char" array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//Obtener el ancho de la linea
			
			var _txt_up_to_char = string_copy( text[p], 1, _char_pos );
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			
			//Obtener el ultimo espacio en blanco
			
			if char[c, p] == " " {last_free_space = _char_pos+1 };
			
			//Obtener el rompimiento de la linea
			if _current_txt_w - line_break_offset[p] > line_width
			{
				line_break_pos[ line_break_num[p], p ] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(	text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
			
		}
		
		//Obtener las coordenadas de cada caracter
		for (var c = 0;c < text_length[p];c++){
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			//Obtener el actual ancho de la linea
			var _txt_up_to_char = string_copy( text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			//Compensar el rompimiento de cadenas
			for(var lb = 0;lb <  line_break_num[p];lb++)
			{
				//Si el recorrido actual del caracter es despues de un rompimiento de linea
				if _char_pos >= line_break_pos[lb, p]
				{
					var _str_copy = string_copy( text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p] );
					_current_txt_w = string_width(_str_copy)
					//Registrar la "linea" este caracter debe estar encima
					_txt_line = lb+1; // +1 significa que lb empieza en 0
				}
			}
			
			//Agregar a las coordenadas x,y la nueva informacion
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line* line_sep;
			
		}
		
	}
	
//}


//Escribiendo el texto

if text_pause_timer <= 0 {

	if draw_char < text_length[page] {
	
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		
		if _check_char == "." || _check_char == "," || _check_char == "?"
		{
			text_pause_timer =  text_pause_time;
			if !audio_is_playing(snd[page]) {
				audio_play_sound(snd[page], 8, false);
			}
			
		} else {
			//Sonido de escribir
			if snd_count < snd_delay {
				snd_count++;
			} else {
				snd_count = 0;
				audio_play_sound(snd[page], 8, false);
			}
			
		}
	}
} else {
	text_pause_timer--;	
}
//Cambiar las paginas

if accept_key
{
	//Si ya se dibujo todo el texto
	if draw_char == text_length[page]
	{
		//Pasa a la siguiente pagina
		if page < page_number-1
		{
			page++;
			draw_char = 0;
		} else {
			
			//Enlazar el texto con las opciones si es que hay
			if option_number > 0 {
				scrCreateTextbox(option_link_id[option_pos])	
			}
			instance_destroy();	
		}
	} 
	//Si no se termino de dibujar todo el texto, se llena el cuadro con todo el texto
	else {
		draw_char = text_length[page];	
	}
}

//Dibujar la caja de texto

var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);


//Dibujar al hablante

if speaker_sprite[page] != noone
{
		sprite_index = speaker_sprite[page];
		if draw_char == text_length[page] {image_index = 0; }
		var _speaker_x = textbox_x + portrait_x_offset[page];
		if speaker_side[page] == -1 {_speaker_x += sprite_width };
		
		draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, 145/txtb_spr_w, 145/ txtb_spr_h, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page],1,0,c_white,1); 
}


//dibujar el fondo de la caja de texto

draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

if txtb_dir == 1 {
	draw_sprite_ext(spr_text_box_direction, 0, _txtb_x - 10, _txtb_y + 400, txtb_dir, 1, 0, c_white, 1);
	}
if txtb_dir == -1 {
	draw_sprite_ext(spr_text_box_direction, 0, _txtb_x + 778, _txtb_y + 400, txtb_dir, 1, 0, c_white, 1);	
}

// Opciones

if draw_char == text_length[page] && page  == page_number - 1
{
	
	//Seleccion de opciones
	option_pos += downKeyPressed - upKeyPressed;
	option_pos = clamp(option_pos, 0 , option_number-1);
	
		//------------- Mover opciones con la palanca del joystyk------------
	yaxisvalueLeft = gamepad_axis_value(0,gp_axislv);

	if (yaxisvalueLeft < -.8) && yaxisup == false then {
	
		yaxisup = true;
		option_pos--;
	}

	if yaxisvalueLeft > -.3 then yaxisup = false;

	if (yaxisvalueLeft > .8) && yaxisdown == false then {
	
		yaxisdown = true;
		option_pos++;
	}

	if yaxisvalueLeft < .3 then yaxisdown = false;
	//------------- Mover opciones con la palanca del joystyk------------

	
	
	//Dibujar opciones
	var _op_space = 126;
	var _op_board = 160;
	for (var op = 0;op < option_number; op++)
	{
		//Las opciones en la caja
		var _o_w = string_width(option[op]) + _op_board*2;
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x , _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-8)/txtb_spr_h, 0, c_white, 1);
		
		//la flecha de opciones
		if option_pos == op
		{
			draw_sprite(sprOption_Arrow, 0, _txtb_x - 60,  _txtb_y - _op_space*option_number + _op_space*op);	
		}
		//Dibujar el texto de las opciones
		draw_text_color(_txtb_x + _op_board,  _txtb_y - _op_space*option_number + _op_space*op + 8, option[op], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
		
	}
	
	
}

//Dibujar el texto

for(var c = 0;c < draw_char;c++)
{
	
	//----------Efectos epeciales----------
	//Efecto de ondulacion
	var _float_y = 0;
	if float_text[c, page] == true
	{
		float_dir[c, page] += -8;
		_float_y = dsin(float_dir[c, page])*4;
	}
	
	//Efecto de temblor
	var _shake_x = 0;
	var _shake_y = 0;
	if shake_text[c, page] == true 
	{
		shake_timer[c, page]--;
		if shake_timer[c, page] <= 0
		{
			shake_timer[c, page] = irandom_range(1,2);
			shake_dir[c, page] = irandom(360);
		}
		
		if shake_timer[c, page] <= 2
		{
		_shake_x = lengthdir_x(1, shake_dir[c, page]);
		_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	
	//El texto
	draw_text_color( char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
}
