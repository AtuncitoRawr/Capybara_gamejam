//draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
draw_self();
draw_set_color(c_white)
if keyboard_check(ord("P"))
{
	draw_path(path, x, y, 0);
}
show_healthbar();