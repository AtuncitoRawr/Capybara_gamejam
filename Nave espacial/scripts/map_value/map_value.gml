function map_value(_in, _ins, _ine, _outs, _oute) {
	///	@desc map_value(input, input_start, input_end, output_start, output_end)
	///	@arg input			real	input value
	///	@arg input_start	real	input start value to map from
	///	@arg input_end		real	input end value to map from
	///	@arg output_start	real	start value to map to
	///	@arg output_end		real	end value to map to

	//  Takes an input value, clamped between 2 variables and
	//	remaps it to another value between 2 other variables.

	//Figure out how 'wide' each range is
	var inr = _ine - _ins;
	var outr = _oute - _outs;

	//Convert the in range into a 0-1 range
	var in_scaled = (_in - _ins) / (inr);

	//Convert that 0-1 range into a value in the out range.
	return _outs + (in_scaled * outr);

}