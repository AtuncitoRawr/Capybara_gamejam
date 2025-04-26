if hp <= 0 {

	instance_destroy();	
	
}


if image_index >= 13 and created == false {

created = true;
var portal = instance_create_layer(x,y,"Instances",OmimicportalSpawn);	

	portal.portal_id = id;
	portal.depth = -100;
	
}

