/// @param text_id
function scrGame_text(_text_id){
	
	switch (_text_id) {
		
	case "prueba":	
	scr_text("No lo sabias jugador pero...");
	scr_text("¡¡Yo siempre estuve ahi!!");
		scr_text_shake(0,25);
		scr_text_color(0,25, c_red, c_red, c_red, c_red);
	scr_text("¡¡Ahora te vas a ir a peru!!");
		scr_text_color(22, 26, c_orange, c_orange, c_orange, c_orange);
	scr_text("¿Que vas a hacer al respecto?");
		scrOption("Aceptar mi destino", "juancprueba - si")
		scrOption("Rehusarse", "juancprueba - no")
	break;
	
		case "juancprueba - si":
			scr_text("Ahora eres un pe causa.");
				scr_text_color(14, 22, c_yellow, c_yellow, c_yellow, c_yellow);
				
		break;
		
		case "juancprueba - no":
			oCapybara.sprite_index = sCapyspeakStressed
			scr_text("*Ya veo...");
			scr_text("Entonces no quieres ser un pe causa.");
				scr_text_color(27, 35, c_yellow, c_yellow, c_yellow, c_yellow);
			scr_text("...");
			scr_text("NUNCA TUVISTE OPCION.");
				scr_text_shake(0, 20);
				scr_text_color(0, 20, c_red, c_red, c_red, c_red);
				
	break;
		

		
	}

}