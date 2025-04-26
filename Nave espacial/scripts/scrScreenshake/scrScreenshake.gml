function scrScreenshake(magnitud, duracion)
{

	with (oCamera)
	{
		if (magnitud > shake_remain)
		{
			shake_magnitude = magnitud;
			shake_remain = magnitud;
			shake_length = duracion;
		}
	}
}