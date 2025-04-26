var spr = spr_boss_bar_frame;
var spritewidth = sprite_get_width(spr);
var spriteheidth = sprite_get_height(spr);

var xposition = display_get_gui_width() /2;
var yposition = display_get_gui_height() /11;

var xoffset =(xposition - round(spritewidth/2) - 6 );
var yoffset =(yposition - round(spriteheidth/2));

if instance_exists(obj_queen_mimic) {

 if obj_queen_mimic.state == BOSS_FIRST_VIEW and obj_queen_mimic.image_index > 45 {
draw_set_font(global.TEXTBOX_FONT);
draw_set_halign(fa_center);

draw_text_transformed_color(display_get_gui_width() / 2, display_get_height() / 55, "Queen Mimic",2,2,0,c_red,c_red,c_white,c_white,1);
}
draw_set_halign(fa_left);
if obj_queen_mimic.state == BOSS_ATTACK {

draw_set_halign(fa_center);
draw_set_font(global.TEXTBOX_FONT);
draw_text_transformed_color(xposition, display_get_gui_height() / 100, "Queen Mimic",1,1,0,c_red,c_red,c_white,c_white,1);


draw_sprite_ext(spr, 0, xoffset, yoffset, 1, 1, 0,c_white,1);
draw_sprite_ext(spr, 1, xoffset, yoffset, (healthpointprev/obj_queen_mimic.hpmax), 1, 0, c_white,1);
draw_sprite_ext(spr, 2, xoffset, yoffset, (obj_queen_mimic.hp/obj_queen_mimic.hpmax), 1, 0, c_white,1);
draw_sprite_ext(spr, 3, xoffset, yoffset, 1, 1, 0,c_white,1);

var xlength = 746;
var markervalue = 10;
var markercount = (obj_queen_mimic.hpmax/markervalue);

var markeroffset = (xlength/markercount);
draw_set_halign(fa_left);
for (var i = 1;i<markercount;i++;)
	{
		draw_sprite_ext(spr_boss_bar_marker, 0, xoffset + (markeroffset*i) - 1 , yoffset, 1, 1, 0, c_white, 1);
	}
}
}