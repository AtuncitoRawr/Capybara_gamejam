function scrSet_default_for_text() {
	
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	for(var c = 0;c < 500;c++)
	{
		col_1[c, page_number] = c_black;	
		col_2[c, page_number] = c_black;	
		col_3[c, page_number] = c_black;	
		col_4[c, page_number] = c_black;	
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*30;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	txtb_spr[page_number] = spr_text_box_big;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_voice; 
	
}

///@param 1er caracter
///@param ultimo caracter
///@param col1
///@param col2
///@param col3
///@param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) 
{
	for(var c = _start ;c < _end;c++)
	{
		col_1[c, page_number-1] = _col1;	
		col_2[c, page_number-1] = _col2;	
		col_3[c, page_number-1] = _col3;	
		col_4[c, page_number-1] = _col4;	
	}
}

///@param start
///@param end

function scr_text_float(_start, _end)
{
	for(var c = _start ;c < _end;c++)
	{
		float_text[c, page_number-1] = true;	
	}
}

///@param start
///@param end

function scr_text_shake(_start, _end)
{
	for(var c = _start ;c < _end;c++)
	{
		shake_text[c, page_number-1] = true;	
	}
}

/// @param text
/// @param [Personaje]
/// @param [Posicion]
function scr_text(_text){


scrSet_default_for_text();
text[page_number] = _text;

//Obtener la informacion del personaje
	if argument_count > 1
	{
		switch(argument[1])
		{
			case "oId":
			
			owner_id = oPlayer.id;
			txtb_dir = 1;
			break;
			
			//Juan carlos
			case "juan carlos":
			speaker_sprite[page_number] = spr_Juanc_porttrait_talk;
			txtb_spr[page_number] = spr_text_box;
			break;
			
			case "juan carlos feliz":
			speaker_sprite[page_number] = spr_Juanc_porttrait_happy;
			txtb_spr[page_number] = spr_text_box;

			break;
			
			case "juan carlos enojado":
			speaker_sprite[page_number] = spr_Juanc_porttrait_angry;
			txtb_spr[page_number] = spr_text_box;
			break;
			
			//Chancupa
			case "chancupa":
			speaker_sprite[page_number] = spr_chanc_porttrait_talk;
			txtb_spr[page_number] = spr_text_box_blue;
			snd[page_number] = snd_voice_down;
			break;
			
		}
	}
	
//Obtener la posicion del personaje
	if argument_count > 2
	{
		speaker_side[page_number] = argument[2];
		
	}


page_number++;

}

/// @param option
/// @param link_id
function scrOption(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;

	option_number++;
	
}

///@param Text id
///@param [direction]
///@param [Owner id]
function scrCreateTextbox(_text_id) {
	
	with (instance_create_depth(0, 0, -9999, oText_box))	
	{
		scrGame_text(_text_id);
		
		if argument_count > 1
		{
			txtb_dir = argument[1];	
		}
		
		if argument_count > 2
			{
				owner_id = argument[2];
		
			}
	}
	
	
}	