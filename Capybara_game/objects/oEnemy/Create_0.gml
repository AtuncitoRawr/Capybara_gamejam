
//caen enemigos con velocidades randomrandomize();
if (y = room_height - 32) {//enemigos vienen de abajo
	vspeed = choose(-1,-2,-2.5);
}
else if (y = 0) {//enemigos vienen de arriba
    vspeed = choose(1,2,2.5);
}

target = oSpaceship;
rango = 100;
shoot_delay = 30;
shoot_delay_timer = 0;