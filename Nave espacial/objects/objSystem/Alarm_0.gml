if obj_player.state == STATE_DEAD {
	
	scrSlideTransition(TRANS_MODE.RESTART);
	audio_stop_all();
}

alarm[0] = 180;

