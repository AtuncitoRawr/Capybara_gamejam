//Obtener el item seleccionado
getControls();

if loopKey
{
	selected_item++
	oSFX.play_sound(sndLoopItem)
}



if array_length(inv) <= 0 {selected_item = -1;}  


if selected_item >= array_length(inv) 
{
	selected_item = 0;
} 

if selected_item != -1
{
	if instance_exists(oPlayer)
	{
		//Usar el item
		if InteractKey
		{
			inv[selected_item].effect();	
		}
		
		//Botar el item
		if ActionKey && inv[selected_item].can_drop == true
		{
			array_delete(inv, selected_item, 1);
			oSFX.play_sound(sndDropItem)
		}
	}
}

