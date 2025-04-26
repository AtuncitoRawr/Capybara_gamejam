if place_meeting(x, y , oPlayer)
{
	oSFX.play_sound(sndCoin);
	instance_destroy();
	effect_create_above(ef_firework,x + 128, y + 128, 2, c_yellow )
	global.Coins += 1;
}

/* En caso de que haya que reproducir el sonido en un frame en especifico

if floor(image_index) == 2 && playSound == false 
{
	//Tocar el sonido
	audio_play_sound(sndCoin, 8, false, 1, 0, random_range(0.9,1.1))	
	//Ajustar la variable playSound en falso para que no se reprodusca en cada paso
	playSound = true;
	
}

//Resetear la variable cuando no se esta en la variable para reproducir el sonido
if floor(image_index) != 2
{
	playSound = false;	
}