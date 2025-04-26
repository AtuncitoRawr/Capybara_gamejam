image_xscale = 1
image_yscale = 1
if instance_exists(obj_queen_mimic) && instance_exists(obj_player){
	x = obj_queen_mimic.x
	y = obj_queen_mimic.y
	if image_index >= 35
	 {
		 instance_destroy(self)
	 }
 
	if image_index >= 26 {
		percent = max(0,percent-0.003);
		//scrScreenshake(15,45)
	}
} else { instance_destroy(self); }

if spin == true {

obj_player.image_angle = lerp(obj_player.image_angle, obj_player.image_angle + 360, percent) 
}

if percent <= 0.1 {
	spin = false
}