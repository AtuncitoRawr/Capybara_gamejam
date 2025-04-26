function scrGetFacingObject(){
	var tx = x;
	var ty = y;
	
	switch (face) {
		case "D":
			ty += 64;
			break;
			
		case "R":
			tx += 64;
			break;
			
		case "U":
			ty -= 64;
			break;
			
		case "L":
			tx -= 64;
			break;
	}
	
	return instance_place(tx, ty, obj_Interactive);
}