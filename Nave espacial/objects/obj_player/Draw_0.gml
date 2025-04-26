if alarm[HURT] > 0 and flicker-- < flicker_initial/2 {
	
	image_alpha = 0.5
	draw_self();
	image_alpha = 1
	
	if flicker <= 0 flicker = flicker_initial;
	
} else {
	draw_self()
}

draw_set_color(c_white);
/*
draw_text(x + 40, y + 40, state)
draw_text(x - 40, y - 40, selectedweapon)