var _w = ceil(room_width / TILE_SIZE);
var _h = ceil(room_height / TILE_SIZE);

/* 
//verifica si hay un mosaico de pared y pone automaticamente un objeto solido (CUANDO HAYAN MOSAICOS SE ACTIVAN)

var _map = layer_tilemap_get_id("Tiles wall")

//crea una pared 1x1

for (var yy = 0; yy < _h ; ++yy) {
	for (var xx = 0; xx < _w; ++xx){
		var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {
			instance_create_layer(xx * TILE_SIZE, yy * TILE_SIZE, "Collisions", o_solid)	
		}
	}
}*/
//Creacion de una grid

global.mp_grid = mp_grid_create(0,0,_w,_h,TILE_SIZE,TILE_SIZE);

//agregar solidos a la grid

mp_grid_add_instances(global.mp_grid, o_solid, true);


//un loop que detecta si hay mas de un solido juntos para duplicar en vez de crearlos por separado (CUANDO HAYAN MOSIACOS SE ACTIVA)
/*
for (var yy = 0; yy < _h ; ++yy) {
	for (var xx = 0; xx < _w; ++xx){
		var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {
			var _inst = collision_point(xx *  TILE_SIZE, yy * TILE_SIZE, o_solid, 0, 1);
			if _inst == noone continue;
			
			with(_inst) {
				do {
					var _change = false;
					var _inst_next = instance_place(x + 1, y, o_solid);
					if _inst_next != noone {
						image_xscale++;
						col = make_color_rgb(irandom(255), irandom(255), irandom(255))
						instance_destroy(_inst_next)
						_change = true;
					}
				} until _change == false;
				
				var _inst_above = instance_place(x, y - 1, o_solid);
				if _inst_above != noone and _inst_above.bbox_left == bbox_left and _inst_above.bbox_right == bbox_right {
					y =	_inst_above.y 
					image_yscale +=  _inst_above.image_yscale;
					instance_destroy(_inst_above)
				}
			}
		} else {
			if random(1) <= 0.01 {
				instance_create_layer(xx * TILE_SIZE + TILE_SIZE/2, yy * TILE_SIZE + TILE_SIZE/2, "Enemy", oMimic)
			}
		}
	}
}

