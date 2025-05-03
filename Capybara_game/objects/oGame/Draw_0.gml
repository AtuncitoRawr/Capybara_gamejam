var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

/*
draw_set_font(fFont)
draw_set_color(c_white)
draw_text(_x + 10, _y + 10, room_get_name(room));

if instance_exists(oText_box)
{
draw_text(_x + 10, _y + 20, oText_box.text_length[oText_box.page]);


}

draw_text(_x + 10, _y + 30, alarm_get(0));

if instance_exists(oDoor)
{
	draw_text(_x + 10, _y + 50, oDoor.doorColor);	
}

draw_text(_x + 10, _y + 70, $"space wins: {global.spaceWins} " + $"\nfight wins: {global.fightWins}" +
 $"\nplataformer wins: {global.platafomerWins}" + $"\nRepetitions: {global.repetitions}");
 
 
draw_text(_x + 10, _y + 200, doorList)

if instance_exists(oFighter) and instance_exists(oCapybaraFighter)
{
	var _push = instance_place(oCapybaraFighter.x + oCapybaraFighter.xspd, oCapybaraFighter.y, oFighter) 
	draw_text(_x + 10, _y + 210, $"push: {_push}")
}
