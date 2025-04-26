if instance_exists(obj_player) and obj_player.state != STATE_DEAD {

draw_sprite_ext(spr_bar_frame, 0, 15, 700, (obj_player.hpmax - 69.5) / 7, (2 + 6) / 7, 0, c_white, 1);

draw_sprite_part(spr_bar, 2, 0, 0, obj_player.hpmax, 8, 26, 712)

draw_sprite_part(spr_bar, 1, 0, 0, obj_player.hpprev, 8, 26, 712)

draw_sprite_part(spr_bar, 0, 0, 0, obj_player.hp ,8, 26, 712);

}