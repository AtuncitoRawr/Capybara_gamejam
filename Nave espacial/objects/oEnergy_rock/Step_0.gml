move_wrap(true, true, 100);

image_angle += 1;

if hp <= 0 {
	instance_destroy(self)
	effect_create_above(ef_firework,x,y,5,c_red)
}