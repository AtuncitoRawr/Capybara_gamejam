draw_set_color(c_white)
draw_set_alpha(alpha);

if draw == true {
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(xp,yp,text,c_black, c_red, c_black, c_silver,clamp(alpha,0,1));


draw_set_halign(fa_left);
draw_set_valign(fa_top);
}
draw_set_alpha(1)