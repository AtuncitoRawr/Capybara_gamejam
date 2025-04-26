with (obj_player)
{
	if (hascontrol)
	{
		hascontrol = false;
		//scrSaveGame()
		
		scrSlideTransition(TRANS_MODE.GOTO,other.target);
		audio_stop_all();
		
	}
}

//objSystem.playerStartPosition = targetplayerposition
//room_goto(targetroom);