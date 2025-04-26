if keyboard_check(vk_alt) {
	mp_grid_draw(global.mp_grid)
	draw_set_color(c_white)
	draw_text(20, 20, ds_list_size(inventory))
}