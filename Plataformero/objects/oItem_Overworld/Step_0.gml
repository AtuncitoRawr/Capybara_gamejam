sprite_index = item.sprite;

if place_meeting(x,y, oPlayer)
//if distance_to_point(oPlayer.x, y) < 300 && oPlayer.InteractKey
{
	if scrItem_add(item) == true
	{
	instance_destroy();
	oSFX.play_sound(sndPickItem)
	}
}