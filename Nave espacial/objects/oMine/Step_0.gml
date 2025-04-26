calc_entity_movement();
//depth = -bbox_bottom;

percent = max(0,percent-random_range(0.006, 0.001));

if spin == true {

image_angle = lerp(image_angle, image_angle + 360, percent) 
}

if percent <= 0.01 {
	spin = false
}
