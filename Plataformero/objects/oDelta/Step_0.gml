if time < 10 {

	time += global.actual_delta
} else {
	time = 0;
}

if framespd < 600 {
	framespd += global.delta_multiplier	
} else {
	framespd = 0;
}