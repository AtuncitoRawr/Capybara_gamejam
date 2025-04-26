

switch (hp) {
	
	case 3:
	image_index = 0;
	break;
	
	case 2:
	image_index = 1;
	break;
	
	case 1:
	image_index = 2;
	break;
}



if hp <= 0 {
instance_destroy();
if oControlador.progreso == 4 {
oControlador.progreso = 5;
}
effect_create_above(ef_explosion,x,y,2,c_gray);
}