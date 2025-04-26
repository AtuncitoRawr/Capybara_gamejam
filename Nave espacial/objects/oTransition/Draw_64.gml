if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_set_alpha(percent)
	draw_rectangle(0,0,w,h,false);

	//draw_rectangle(0,0,w,percent*h_half,false); //ESTO SI QUISIERAMOS DOS LINEAS CORTANDO ESCENA
	//draw_rectangle(0,h,w,h-(percent*h_half),false);
	draw_set_alpha(1);
	
}

