//Actualizacion de la camara


if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;

}

//Actualizar la posicion del objeto

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff)
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff)

//ScreenShake

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Actualizar la vista de la camara

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

if (layer_exists("stars1"))
{
	layer_x("stars1",x/25);
	layer_y("stars1",y/25);
}

if (layer_exists("stars2"))
{
	layer_x("stars2",x/15);
	layer_y("stars2",y/15);
}

if (layer_exists("stars3"))
{
	layer_x("stars3",x/5);
	layer_y("stars3",y/5);
}

if (layer_exists("starfog"))
{
	layer_x("starfog",x/15);
	layer_y("starfog",y/15);
}

if (layer_exists("earth"))
{
	layer_x("earth",x/15);
	layer_y("earth",y/15);
	
	//layer_x("earth",lerp(0,x/1,0.7));
	//layer_y("earth",lerp(0,y - (layer_get_y("earth")- 8000)/2,0.7));
}

