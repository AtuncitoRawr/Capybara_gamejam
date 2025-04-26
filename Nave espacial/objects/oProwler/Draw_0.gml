event_inherited();


//var _area = point_in_circle(x,y,xstart,ystart,200);




///This whole step is basically visual only, and it not required for the AI code
// * visual only - moves char with mouse when being carried


draw_set_colour(c_white);

draw_text(x + 20, y + 20, state)
draw_text(x + 60, y + 60, txp)
draw_text(x + 60, y + 40, typ)

draw_text(x - 120, y - 60, x)
draw_text(x - 120, y - 40, y)

/*
if path_get_number(ppath) > 0 {
	if ty < y draw_path(ppath, x, y, true);
}
// * visual only end

//draw sprite

// * visual only - if we are holding a key, draw it next to us
// * visual only - if we have interact options, draw their weight and stroke around them
var _size = array_length(options_arr);
for (var i = 0; i < _size; ++i) {
	//get the options struct
    var _stt = options_arr[i];
	
	//get the id from the struct and ensure it exists
	var _id = _stt.id;
	if !instance_exists(_id) continue;
	
	//draw the instances weight value
	switch(_id.object_index) {
		default:
			var _x = _id.x;
			var _y = _id.bbox_bottom;
		break;
	}
	draw_text_color(_x, _y, _stt.weight, c_white, c_white, c_white, c_white, 1);
	
	//draw the target instance with a white stroke

}

// * visual only - draw the path to the target instance over the player sprite
draw_set_colour(c_white);
if path_get_number(ppath) > 0 {
	if ty >= y draw_path(ppath, x, y, true);
}

// * visual only - draw the range circle



draw_set_alpha(.5)

//----- Draw Danger Sensors -----\\
var i,current,len,dir;
draw_set_color(c_red)
for (i=0;i<oa_sensor_count;i++)
	{
	current = oa_danger_sensor[i]
	len = current * oa_sensor_length
	dir = (360 / oa_sensor_count) * i
	draw_line_width(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),3)
	}

//----- Draw Interest Sensors -----\\
draw_set_color(c_lime)
for (i=0;i<oa_sensor_count;i++)
	{
	current = oa_interest_sensor[i]
	len = current * oa_sensor_length
	dir = (360 / oa_sensor_count) * i
	draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir))
	}

//----- Draw Resulting Direction -----\\
draw_set_color(c_aqua)
len = 256
dir = oa_result
draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir))

draw_set_alpha(1)
draw_set_color(c_white)
