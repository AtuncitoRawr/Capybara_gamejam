if instance_exists(oShield) and oShield.state != STATE_DEAD {

draw_sprite_ext(spr_shield_bar_frame, 0, 15, 670, (oShield.hpmax - 69.5) / 7, (2 + 6) / 7, 0, c_white, 1);

draw_sprite_part(spr_shield_bar, 2, 0, 0, oShield.hpmax, 8, 26, 682)

draw_sprite_part(spr_shield_bar, 1, 0, 0, oShield.hpprev, 8, 26, 682)

draw_sprite_part(spr_shield_bar, 0, 0, 0, oShield.hp ,8, 26, 682);

}