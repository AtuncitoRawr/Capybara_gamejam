//Obtener el volumen
var _sfxVol = global.SFX_VOLUME * global.MASTER_VOLUME;

//Procesar todos los sonidos
for(var i = 0;i < array_length(sound_queue);i++)
{
	var _sound_play = sound_queue[i];
	var _snd =audio_play_sound(_sound_play, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
}

//Limpiar la lista luego de que se reproduzcan los sonidos
sound_queue = [];


/*
if coinSnd == true
{
	audio_play_sound(sndCoin, 8, false);
	
	coinSnd = false;
}
