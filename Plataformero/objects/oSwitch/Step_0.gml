if place_meeting(x,y, oPlayer) && image_index == 0
{
	image_index = 1;
	oSFX.play_sound(sndSwitchIn);
}

if !place_meeting(x,y, oPlayer) && image_index == 1
{
	image_index = 0;
	oSFX.play_sound(sndSwitchOut);
}