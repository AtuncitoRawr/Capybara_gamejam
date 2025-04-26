/// @param text_id
function scrGame_text(_text_id){
	
	switch (_text_id) {
		
	case "juanc - saludo":
	
	scr_text("Holaa, me llamo Juan carlos y me gustan los completos.", "juan carlos");
		scr_text_color(16, 27, c_yellow, c_yellow, c_yellow, c_yellow);
	scr_text("Wena po, Juan carlos.", "chancupa", -1);
		scr_text_color(9, 20, c_yellow, c_yellow,  c_yellow,  c_yellow);
	scr_text("Es mas, no solo me gustan los completos...", "juan carlos");
	scr_text("¡¡ME ENCANTAN!!", "juan carlos feliz");
		scr_text_float(0,15);
		scr_text_color(0,15, c_green, c_green, c_green, c_green);
	scr_text("Pero si me como uno con mostaza...", "juan carlos");
	scr_text("¡¡ME MUERO!!", "juan carlos enojado");
		scr_text_shake(0, 12);
		scr_text_color(0, 12, c_red, c_red, c_red, c_red);
	scr_text("¿A ti te gustan los completos?", "juan carlos");
		scrOption("Si", "juancSaludo - si")
		scrOption("No", "juancSaludo - no")
	break;
	
		case "juancSaludo - si":
			scr_text("Son lo mas rico que hay.", "chancupa", -1);
			scr_text("Ahora me caes bien :).", "juan carlos feliz");
				scr_text_color(19, 21, c_green, c_green, c_green, c_green);
		break;
		
		case "juancSaludo - no":
			scr_text("Son malas tus weas >:(", "chancupa", -1);
				scr_text_color(19, 22, c_red, c_red, c_red, c_red);
			scr_text("*le pega* ", "juan carlos enojado");
				scr_text_shake(1, 9);
			scr_text("Nunca mas insultes a los completos, guaton culiao. ", "juan carlos enojado");
				scr_text_shake(1, 49)
				scr_text_color(36, 49, c_red, c_red, c_red, c_red);
		break;
		
	case "prueba":	
	scr_text("Holaa, me llamo Juan carlos y me gustan los completos.");
		scr_text_color(16, 27, c_blue, c_blue, c_blue, c_blue);
	scr_text("Es mas, no solo me gustan los completos...");
	scr_text("¡¡ME ENCANTAN!!");
		scr_text_float(0,15);
		scr_text_color(0,15, c_green, c_green, c_green, c_green);
	scr_text("Pero si me como uno con mostaza...");
	scr_text("¡¡ME MUERO!!");
		scr_text_shake(0, 12);
		scr_text_color(0, 12, c_red, c_red, c_red, c_red);
	scr_text("¿A ti te gustan los completos?");
		scrOption("Si", "juancprueba - si")
		scrOption("No", "juancprueba - no")
	break;
	
		case "juancprueba - si":
			scr_text("Ahora me caes bien :).", "oId");
				scr_text_color(19, 21, c_green, c_green, c_green, c_green);
		break;
		
		case "juancprueba - no":
			scr_text("*le pega*", "oId");
				scr_text_shake(1, 9);
			scr_text("Nunca mas insultes a los completos, guaton culiao. ", "oId");
				scr_text_shake(1, 49)
				scr_text_color(36, 49, c_red, c_red, c_red, c_red);
	break;
		
	case "npc1":
		scr_text("Todo es culpa de los venekosss AAHHH.");
		scr_text("Que salgan los milicos a las calles >:)");
	break;
	
	case "npc2":
		scr_text("¿Call of duty?");
		scr_text("¡¡ME ENCANTA CALL OF DUTY!!");
		scr_text("¿A ti te gusta Call of Duty?");
			scrOption("Sipo obvio", "npc2 - si");
			scrOption("No, que asco", "npc2 - no");
	break;
	
		case "npc2 - si":
			scr_text("¡¡OMG SOY GAY!!")
		break;
		case "npc2 - no":
			scr_text("eso no fue lo que me dijo tu mama anoche >:)");
		break;
		
	
	case "npc3":
		scr_text("Bloodborne, lanzado en 2015 por FROM SOFTWARE, es el mejor souls.");
		scr_text("*baila*");
	break;
	
	case "npc4":
		scr_text("¡¡SEXOOOO!!");
	break;
		
		
	}

}