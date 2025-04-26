var _gx = screenWidth
var _gy = screenHeight
var _sep = sep
var _col = c_white;

draw_set_color(c_gray)
draw_rectangle(_gx - 10,(_gy - 10) , _gx + 141, (_gy + 86) , true)
draw_set_color(c_white)

for(var i = 0; i < array_length(inv);i++ )
{
	draw_set_color(c_gray)
	draw_rectangle(_gx - 10,(_gy - 10) + _sep*i, _gx + 141, (_gy + 86) + _sep*i, true)
	draw_set_color(c_white)
	draw_set_font(Fcondorito_icon)
	
	draw_sprite(inv[i].icon, 0, _gx, _gy + _sep*i);
	
	if selected_item == i {_col = c_yellow;} else {_col = c_white}
	
	draw_set_color(_col)
	draw_text_ext(_gx, (_gy + 86) + _sep * i, inv[i].name, 36, 100)
	
	//Descripciones
	if selected_item == i
	{
	draw_text_ext(_gx - 60, _gy + _sep*array_length(inv) + 40, inv[i].description,36,200);
	}
	draw_set_font(Fcondorito)
	draw_set_color(c_white)
	
}