if instance_exists(oFighter) && !playerBar
{
	playerBar = true;
	var _bar = instance_create_layer(x, y, "Instances", ohpBar)	
	_bar.playerOwner = oFighter;
	
	var _shadow = instance_create_layer(oFighter.x, oFighter.y, "sombra", oShadow )
	_shadow.owner_id = 1;
}

if instance_exists(oCapybaraFighter) && !enemyBar
{
	enemyBar = true;
	var _bar = instance_create_layer(x, y, "Instances", ohpBar)	
	_bar.playerOwner = oCapybaraFighter;
	
	 var _shadow = instance_create_layer(oCapybaraFighter.x, oCapybaraFighter.y, "sombra", oShadow )
	_shadow.owner_id = 2;
}

if !starting
{
	if instance_exists(oFighter) && instance_exists(oCapybaraFighter)
	{
		starting = true
		oFighter.can_move = false
		oCapybaraFighter.can_move = false;
		if global.fightWins == 0 {difficulty = 1;}
		if global.fightWins > 0 {difficulty = 2;}
		alarm[1] = 120;
		
	}

}


if firstMessage
{
	firstMessage = false;
	alarm[2] = 180
}

if secondMessage
{
	secondMessage = false
	alarm[3] = 30	
}

if readyToGo
{
	timeRun = true;
	alarm[0] = 60;
	readyToGo = false;
	oFighter.can_move = true;
	oCapybaraFighter.can_move = true;	
}



if (timeMax == 0 || oFighter.state == STATE_DEAD || oCapybaraFighter.state == STATE_DEAD) && global.endLvl == false
{
	
	oFighter.can_move = false
	oCapybaraFighter.can_move = false;
	
	if oCapybaraFighter.hp > 0
	{
	oCapybaraFighter.state = STATE_IDLE;
	}
	if oFighter.hp > 0 {oFighter.state = STATE_IDLE;}
	oFighter.state = STATE_IDLE;
	global.endLvl = true;
	timeMax = 0;
	if oFighter.hp > oCapybaraFighter.hp 
	{
		global.fightWins++
		result = 1;
		oFighter.state = STATE_GRAB
		oFighter.sprite_index = sFighterWalk;
		oCapybaraFighter.state = STATE_GRAB
		oCapybaraFighter.sprite_index = sFighterHit;
	} 
	else if oFighter.hp <= oCapybaraFighter.hp 
	{
		global.fightLosses++
		result = 2;
		oCapybaraFighter.state = STATE_GRAB
		oCapybaraFighter.sprite_index = sFighterWalk;
		oFighter.state = STATE_GRAB
		oFighter.sprite_index = sFighterHit;
	}
	alarm[4] = 120;

	
}
	if thirdMessage 
	{
	room_goto(Room2);
	}

