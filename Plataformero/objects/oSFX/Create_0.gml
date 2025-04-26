global.SFX_VOLUME = 1;
global.MASTER_VOLUME = 1;

coinSnd = false;
sound_queue = [];

function play_sound(_snd)
{
	if (!array_contains(sound_queue, _snd))
	{
		array_push(sound_queue, _snd)	
	}
}