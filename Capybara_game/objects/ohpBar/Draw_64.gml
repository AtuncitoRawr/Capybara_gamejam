display_set_gui_size(view_wport[0], view_hport[0]);
if instance_exists(playerOwner) && playerOwner == oFighter {
var spr = sHpBar;
var spritewidth = sprite_get_width(spr);
var spriteheidth = sprite_get_height(spr);

var xoffset = display_get_gui_width() - 1050; 
var yoffset = display_get_gui_height() - 1000;



draw_sprite_ext(spr, 0, xoffset, yoffset, -3, 3, 0,c_white,1);
draw_sprite_ext(spr, 1, xoffset, yoffset, (healthpointprev/playerOwner.hpMax) * -3, 3, 0, c_white,1);
draw_sprite_ext(spr, 2, xoffset, yoffset, (playerOwner.hp/playerOwner.hpMax) * -3, 3, 0, c_white,1);
draw_sprite_ext(spr, 3, xoffset, yoffset, -3, 3, 0,c_white,1);

}


if instance_exists(playerOwner) && playerOwner == oCapybaraFighter {
var spr = sHpBar;
var spritewidth = sprite_get_width(spr);
var spriteheidth = sprite_get_height(spr);

var xoffset = display_get_gui_width() - 868;
var yoffset = display_get_gui_height() -1000;

draw_sprite_ext(spr, 0, xoffset, yoffset, 3, 3, 0,c_white,1);
draw_sprite_ext(spr, 1, xoffset, yoffset, (healthpointprev/playerOwner.hpMax) * 3, 3, 0, c_white,1);
draw_sprite_ext(spr, 2, xoffset, yoffset, (playerOwner.hp/playerOwner.hpMax) * 3, 3, 0, c_white,1);
draw_sprite_ext(spr, 3, xoffset, yoffset, 3, 3, 0,c_white,1);

}
