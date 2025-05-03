if instance_exists(oSpaceship) {
		
	follow = oSpaceship;
} 

if instance_exists(oFighter) {
		
	follow = oFighter;
} 


//Actualizacion de la camara

if (instance_exists(follow))
{

	xTo = follow.x
	yTo = follow.y 
}


//Actualizar la posicion del objeto

x += (xTo - x) / 20
y += (yTo - y) / 20

x = clamp(x,view_w_half+100,room_width-view_w_half-buff) 
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff) 

//ScreenShake

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Actualizar la vista de la camara

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);


if (layer_exists("sky"))
{
	layer_x("sky",x/20);
	layer_y("sky",y/20);

}

if (layer_exists("castillo"))
{
	layer_x("castillo",x/15);
	layer_y("castillo",y/15);

}

if (layer_exists("estatuas"))
{
	layer_x("estatuas",x/8);
	layer_y("estatuas",y/8);

}

if (layer_exists("piso"))
{
	layer_x("piso",x/8);
	layer_y("piso",y/8);

}
