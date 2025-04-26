function Raycast(_xfrom, _yfrom, _xto, _yto, _obj){
	
// Distancia de sondeo

var _dx = 0;
var _dy = 0;


//Obtener la primera colision


var _first_instance = collision_line(_xfrom, _yfrom, _xto, _yto, _obj, true, true);

//Si el golpe, encuentra el punto exacto

if (_first_instance != noone)
{
	// Iniciar la distancia de sondeo
	
	_dx = _xto - _xfrom;
	_dy = _yto - _yfrom;
	//empezar el algoritmo para poder buscar a nivel de pixel
	
	while ((abs(_dx) >= 1) || (abs(_dy) >= 1))
	{
		//dividir la distancia de sondeo
		_dx /= 2;
		_dy /= 2;
		//Verificar alrededor de la nueva colision
		var _instance = collision_line(_xfrom, _yfrom, _xto - _dx, _yto - _dy, _obj, true, true);
		//Si golpea algo, seguir colisionando pero reducir la distancia total hasta donde se inicia
		if (_instance != noone)
		{
			_first_instance = _instance;
			_xto -= _dx;
			_yto -= _dy;
		}
	}
}

//Retornar un array
var _return_array = array_create(3, -1)
_return_array[0] = _first_instance;
_return_array[1] = _xto - _dx;
_return_array[2] = _yto - _dy;
	
return _return_array;
}