function scrSplitText(texto){
	
	texto += " "; // se le agrega un espacio al final para que detecte la ultima palabra
	var palabra = ""; // aqui se guardan los caracteres iterados hasta encontrar un espacio
	var lista_palabras; // aqui se almacenan todas las palabras y se retorna la lista
	var numero_palabra = 0; // indice para guardar las palabras en la lista
	/*
		"i" recorre el texto y va guardando cada caracter en "palabra", cuando se encuentra con un espacio
		guarda lo que tenia "palabra" en "lista_palabras"
	*/
	for (var i = 1; i <= string_length(texto); i++){
		
		if (string_char_at(texto,i) == " "){
			lista_palabras[numero_palabra] = palabra;
			palabra = "";
			numero_palabra++;
		}
		else {
			palabra += string_char_at(texto,i);
		}
	}
	return lista_palabras;
}

