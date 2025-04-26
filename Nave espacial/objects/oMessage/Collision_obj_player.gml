with (oControlador) {
	
	if progreso == 14 {
		progreso = 15
		
			var _inst = instance_create_layer(800,1544,"Instances", oMimic)
			effect_create_above(ef_explosion, 800,1544,1,c_red)
			var _inst2 = instance_create_layer(750,1758,"Instances", oMimic)
			effect_create_above(ef_explosion, 750,1758,1,c_red)
			var _inst3 = instance_create_layer(400,1544,"Instances", oMimic)
			effect_create_above(ef_explosion, 400,1544,1,c_red)
			var _inst4 = instance_create_layer(350,1758,"Instances", oMimic)
			effect_create_above(ef_explosion, 350,1758,1,c_red)
	
	}
	
}