function scrMove_and_colide(){

#region Colisiones con plataformas en movimiento
//Salirse de una platafroma solida en movimiento que este posicionada con el jugador en el inicio del paso
	var _rightWall = noone;
	var _leftWall = noone;
	var _topWall = noone;
	var _bottomWall = noone;
	var _list = ds_list_create();
	var _listSize = instance_place_list(x, y, oMovePlat, _list, false)

	//Hacer un bucle por todas las colisiones con plataformas moviles
	for (var i = 0;i < _listSize; i++)
	{
		var _listInst = _list[| i];
		
		//Encontrar las paredes mas cercanas en cada direccion
		
		//Paredes derechas
		
		//Si hay paredes a mi derecha, obtener la mas cercana
		if _listInst.bbox_left - _listInst.xspd >= bbox_right-1
		{
			if !instance_exists(_rightWall) || _listInst.bbox_left	< _rightWall.bbox_left
			{
				_rightWall = _listInst;	
			}
		}
		
		//Paredes izquierdas
		if _listInst.bbox_right - _listInst.xspd <= bbox_left+1
		{
			if !instance_exists(_leftWall) || _listInst.bbox_right > _listInst.bbox_right
			{
				_leftWall = _listInst;	
			}
		}
		
		//Pisos
		if _listInst.bbox_top - _listInst.yspd >= bbox_bottom-1
		{
			if !_bottomWall || _listInst.bbox_top < _bottomWall.bbox_top
			{
				_bottomWall = _listInst;	
			}
		}
		//techos
		if _listInst.bbox_bottom - _listInst.yspd <= bbox_top+1
		{
			if !_topWall || _listInst.bbox_bottom > _topWall.bbox_bottom
			{
				_topWall = _listInst;	
			}
		}
	}
	//Destruir la lista DS
	ds_list_destroy(_list);
	
	//Salirse de las paredes
	
	//Pared derecha
	if instance_exists(_rightWall)
	{
		var _rightDist = bbox_right - x;
		x = _rightWall.bbox_left - _rightDist;
	}
	//Pared izquierda
	if instance_exists(_leftWall)
	{
		var _leftDist = x - bbox_left
		x = _leftWall.bbox_right + _leftDist;
	}
	//Piso
	if instance_exists(_bottomWall)
	{
		var _bottonDist = bbox_bottom - y;
		y = _bottomWall.bbox_top - _bottonDist;
	}
	//Techo (Incluye, collisiones para agacharse)
	if instance_exists(	_topWall)
	{
		var _upDist = y - bbox_top;
		var _targetY = _topWall.bbox_bottom + _upDist;
		//Verificar que no haya ni una colision de muro
		if !place_meeting(x,_targetY, oWall)
		{
			y = _targetY;	
		} 
	}
#endregion

//No quedarse atras de la plataforma en movimiento
earlyMoveplatXspd = false;
if instance_exists(myFloorPlat) && myFloorPlat.xspd != 0 && !place_meeting(x, y + movePlatXspd+1, myFloorPlat)
{
	//Ir adelante y moverse hacia la plataforma devuelta si no hay un muro en el camino
	if !place_meeting(x + myFloorPlat.xspd, y, oWall)
	{
		x += myFloorPlat.xspd;
		earlyMoveplatXspd = true;
	}
}

//Agachamiento 
	//Transicionar al agache

		//Automatico / forzado
		if onGround && (yaxisLeft > 0 || place_meeting(x, y, oWall))
		{
			crouching = true;	
		}
		//Cambiar las mascaras de colision
		if crouching {mask_index = crouchSpr;};
		
	//Transicionar para dejar de agacharse
		//Manualmente
		if crouching && (yaxisLeft <= 0 || !onGround)
		{
			//Verificar si se puede levantar
			mask_index = idleSpr;
			
			//Verificar si no hay solidos en el camino
			if !place_meeting(x, y, oWall)
			{
				crouching = false;	
			} 
			//Volver agacharse si hay una pared de por medio
			else {
				mask_index = crouchSpr;	
			}
		}

		
		
		//Colision con X
	var _subpixel = 16;
	if place_meeting(x + xspd, y, oWall)
	{
		//Verificar si hay pendientes para subir
		if !place_meeting(x + xspd, y - abs(xspd)-1, oWall)
		{
			while place_meeting(x + xspd, y, oWall) {y -= 1;};	
		}
		//Si no hay una pendiente, hacer la colision normal
		else
		{
			
		//Pendientesen el techo
		if !place_meeting(x + xspd, y + abs(xspd)+1,oWall)
		{
			while place_meeting(x + xspd, y, oWall) { y += _subpixel;};
			
		} 
			//Colisiones normales
		else {
		
			//Deslizarce por la pared con precision
			var _pixelcheck = _subpixel * sign(xspd);
			while !place_meeting(x + _pixelcheck, y, oWall)
			{
				x += _pixelcheck;	
			}
		
			//Establecer el xspd a 0 si colisiona
			xspd = 0;
		}
	}
}

	//Bajar por una pendiente
	downSlopeSemiSolid = noone;
	if yspd >= 0 && !place_meeting(x + xspd, y + 1, oWall) && place_meeting(x + xspd, y + abs(xspd)+1, oWall)
	{
		//Verificar por un camino semisolido
		downSlopeSemiSolid = checkForSemiSolidPlataform(x + xspd, y + abs(xspd)+1);
		//Bajar si no hay una plataforma semisolida
		
		if !instance_exists(downSlopeSemiSolid)
		{
			while !place_meeting(x + xspd, y + _subpixel, oWall) {y += _subpixel;};	
		}
	}
	
	//Moverse
	
	x += xspd * global.timeStop;
	
//Movimiento Y
	
	//Gravedad
	
	if coyoteHangTimer > 0
	{
		//bajar el contador del coyote time
		coyoteHangTimer--;	
	} else {
		//Aplicar gravedad al jugador
		yspd += grav * global.timeStop;
		//Ya no se esta en el piso
		setOnGround(false);
	}
	//limitar la velocidad de caida
	if yspd > termVel {yspd = termVel;};
	
	if (yspd >= fallCheck && !jumpKeyBuffered) || state == STATE_FALL
	{
		falling = true;
	
	} else {
		falling = false;	
	}
	
		
	//Colision con Y
	var _subpixel = 16;
	
	//Colision Y hacia arriba (con pendientes de techo)
	if yspd < 0 && place_meeting(x, y + yspd, oWall)
	{
		
		var _slopeSlide = false;
		
		//Saltar a las pendientes de techo
		//Deslizarce a la izquierda
		if moveDir == 0 && !place_meeting(x - abs(yspd)-1, y + yspd, oWall)
		{
			while place_meeting(x, y + yspd, oWall ) {x -= 10;};
			_slopeSlide = true;
		}
		
		//Deslizarce a la derecha
		if moveDir == 0 && !place_meeting(x + abs(yspd)+1, y + yspd, oWall)
		{
			while place_meeting(x, y + yspd, oWall ) {x += 10;};
			_slopeSlide = true;
		}
		
		
		//Colision normal de Y
		
		if !_slopeSlide
		{
			//Deslizarse por la pared con precision	
			var _pixelcheck = _subpixel * sign(yspd);
			while !place_meeting(x, y + _pixelcheck, oWall)
			{
				y += _pixelcheck;
			
			}
		
			//Establecer el yspd a 0 cuando colisione
			yspd = 0;
		}
	}
	
	//Piso Y hacia abajo
	
	//Verificar por solidos y semisolidos debajo mio
	var _clampYspd = max(0, yspd);
	var _list = ds_list_create(); //Crea una lista DS para almacenar todos los objetos 
	var _array = array_create(0);
	array_push(_array, oWall, oSemiSolidWall);
	
	//Hacer la verificacion y agregar objetos a la lista
	var _listSize = instance_place_list(x, y + 1 + _clampYspd + movePlatMaxYspd, _array, _list, false);
	
	//Arregla la plataforma hacia abajo en altas resoluciones y velocidades
	var _yCheck = y+1 + _clampYspd;
	if instance_exists(myFloorPlat) {_yCheck += max(0, myFloorPlat.yspd);};
	var _semiSolid = checkForSemiSolidPlataform(x, _yCheck);
	
	
	//Filtrar a travez de las colisiones y solo devolver la que en su cima este debajo del jugador
	for (var i = 0; i < _listSize; i++)
	{
		//Obtener la instancia de oWall o oSemiSolidWall de la lista
		var _listInst = _list[| i];
		
		//Evitar el magnetismo
		if (_listInst != forgetSemiSolid
		&& (_listInst.yspd <= yspd || instance_exists(myFloorPlat))
		&& (_listInst.yspd > 0 || place_meeting(x, y + 1 + _clampYspd, _listInst)))
		|| (_listInst == _semiSolid) 
		{
			//Retornar el oWall o el oSemiSolidWall que este por debajo del jugador
			if _listInst.object_index == oWall
			|| object_is_ancestor(_listInst.object_index, oWall)
			|| floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd)
			
			
			{
				//Retornar el objeto muro "mas grande"
				if !instance_exists(myFloorPlat)
				|| _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd
				|| _listInst.bbox_top + _listInst.yspd <= bbox_bottom
				{
					myFloorPlat = _listInst;	
				}
		}
	}
}
	//Destruir la lista DS para evitar fugas de memoria
	ds_list_destroy(_list);
	
	//Semisólido de pendiente descendente para asegurarnos de que no nos perdamos el semisólido al descender pendientes	
	if instance_exists(downSlopeSemiSolid) {myFloorPlat = downSlopeSemiSolid;}
	//Un ultimo chequeo	para asegurarse de que el piso de la platafroma esta debajo de nosotros
	if instance_exists(myFloorPlat) && !place_meeting(x,y + movePlatMaxYspd, myFloorPlat)
	{
		myFloorPlat = noone;	
	}
	
	//Aterrizar en el suelo de la plataforma si hay una
	if instance_exists(myFloorPlat)
	{
		//Acércate a nuestra pared precisamente	
		var _subpixel = 1;
		while !place_meeting(x, y + _subpixel, myFloorPlat) && !place_meeting(x, y, oWall) {y += _subpixel}
		//Asegúrese de que no terminemos debajo de la parte superior de un semisólido
		if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
		{
			while place_meeting(x, y, myFloorPlat) {y -= _subpixel;};	
		}
		//Redondear abajo la variable y
		y = floor(y);
		
		//Colisionar con el suelo
		yspd = 0;
		setOnGround(true);
		startJumping = 0 
		jumpButton = 0;
	}
	
	//Caer manualmente a traves de una plataforma semisolida
	if yaxisLeft > 0 && jumpKeyPressed
	{
		//Asegurarse de que hay un piso que sea una plataforma semisolida
		if instance_exists(myFloorPlat)
		&& (myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index,oSemiSolidWall))
		{
			//Ver si podemos ir debajo del semisolido
			var _yCheck = max(1, myFloorPlat.yspd+1);
			if !place_meeting(x, y + _yCheck, oWall)
			{
				//Moverse debajo de la platafroma
				y += 5
				
				//Heredamos cualquer velocidad decendente para  mi piso plataformero entonces no me pilla
				yspd = _yCheck-1;
				//Olvidarse de la plataforma por un momento para que no nos agarre denuevo
				forgetSemiSolid = myFloorPlat;
				
				//Mini arreglo para el salto
				jumpKeyBuffered = false;
				
				//No mas semiplataformas
				setOnGround(false);	
			}
		}
	}
	
	if !place_meeting(x, y + yspd, oWall) {y += yspd * global.timeStop;}
	
	//Resetear la variable forgetSemiSolid
	if instance_exists(forgetSemiSolid) && !place_meeting(x, y, forgetSemiSolid)
	{
		forgetSemiSolid = noone;	
	}


//Movimiento final de plataformas y movimientos
	//X - movePlatXspd y colisiones
	movePlatXspd = 0;
	if instance_exists(myFloorPlat) {movePlatXspd = myFloorPlat.xspd;};
	
	//Moverse con movePlatXspd
	if !earlyMoveplatXspd
	{
		if place_meeting(x + movePlatXspd, y, oWall)
		{
		
			//Acércarse a nuestra pared precisamente	
			var _subpixel = 1;
			var _pixelcheck = _subpixel * sign(movePlatXspd);
			while !place_meeting(x + _pixelcheck, y, oWall)
			{
				x += _pixelcheck;	
			}
		
			movePlatXspd = 0;
		
		}
	
		//Moverse
		x += movePlatXspd * global.timeStop;
	}
	
	//Y - cambiar a mi mismo por myFloorPlat si se mueve vertical
	if instance_exists(myFloorPlat) 
	&& (myFloorPlat.yspd != 0
	|| myFloorPlat.object_index == oMovePlat
	|| object_is_ancestor(myFloorPlat.object_index, oMovePlat)
	|| myFloorPlat.object_index == oSemiSolidMovePlat
	|| object_is_ancestor(myFloorPlat.object_index, oSemiSolidMovePlat) )
	{
		//Cambiar a la cima del piso de la plataforma
		if !place_meeting(x, myFloorPlat.bbox_top, oWall)
		&& myFloorPlat.bbox_top >= bbox_bottom-movePlatMaxYspd
		{
			y = myFloorPlat.bbox_top;	
		}
		
		//Codigo antiguo
					/*
					//Subir a un muro solido mientras estemos en una plataforma semisolida
		
					if myFloorPlat.yspd < 0 && place_meeting(x, y + myFloorPlat.yspd, oWall)
					{
						//Ser empujado fuera de la plataforma semisolida hacia abajo 
						if myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index, oSemiSolidWall)
						{
							var _subpixel = 1;
							while place_meeting(x, y + myFloorPlat.yspd, oWall) {y += _subpixel;};
				
							//Si somos empujados a un muro solido mientras vamos abajo, empujarse devuelta
							while place_meeting(x, y, oWall) {y -= _subpixel;};
							y = round(y);
				
						}
			
						//Cancelar MyfloorPlat
						setOnGround(false);
					}
					*/
				}
	
	
	//Ser empujado hacia abajo ddesde una semisolido cuando haya una plataforma solida movil
	if instance_exists(myFloorPlat)
	&& (myFloorPlat.object_index == oSemiSolidWall || object_is_ancestor(myFloorPlat.object_index,oSemiSolidWall))
	&& place_meeting(x, y, oWall)
	{
		//Si estoy atascado en una pared en este punto, tratar de mover hacia abajo para estar debajo del semisolido
		//Si sigo atrapado despues de eso, eso solo significa que estoy "aplastado"
		
		//Tambien no verificar mucho, no queremos undirnos debajo del muro
		
		var _maxPushDist = 10;
		var _pushedDist = 0;
		var _startY = y;
		while place_meeting(x,y,oWall) && _pushedDist <= _maxPushDist
		{
			y++;
			_pushedDist++;
		}
		//Olvidar myFloorPLat
		myFloorPlat = noone;
		
		//Si aun estoy en una pared en este punto, me han aplastado de todos modos, devolver al jugador al 
		//start y para evadir el salto de distancia
		if _pushedDist > _maxPushDist {y = _startY;};
	}
	
	
//Verificar si se esta aplastado
	image_blend = c_white
	if place_meeting(x, y, oWall)
	{
		image_blend = c_blue;	
	}
	
	//Codigo de aplastamiento
	if place_meeting(x, y, oWall) && state != STATE_DEAD
	{
		crushTimer++;
		if crushTimer > crushDeathTime
		{
			state = STATE_DEAD;
		} 
	} else if state != STATE_DEAD {
		crushTimer = 0;	
	} else {
		state = STATE_DEAD;
	}
}
