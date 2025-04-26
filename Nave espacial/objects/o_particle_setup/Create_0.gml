particle_system = part_system_create_layer("Bullets", 0);

particleType_hit = part_type_create();
part_type_sprite(		particleType_hit, spr_player_collision,0,0,0);
part_type_size(			particleType_hit, 0.5,1,0.1,0);
part_type_life (		particleType_hit, 5, 15);
part_type_alpha3(		particleType_hit, 1, 0.6, 0.2);
part_type_orientation(	particleType_hit, 0, 359, 0, 0, 0);

particleType_spark = part_type_create();

part_type_sprite(		particleType_spark, spr_spark,0,0,0);
part_type_size(			particleType_spark, 0.8,1.4,-0.01,0);
part_type_life (		particleType_spark, 24, 30);
part_type_alpha3(		particleType_spark, 1, 0.8, 0.1);
part_type_orientation(	particleType_spark, 0, 359, 0, 0, 0);
part_type_speed(		particleType_spark, 2, 4, -0.1, 0);
part_type_direction(	particleType_spark, 0,359,0,0);
part_type_color3(		particleType_spark, 45823, 829418, 952788)

particleType_shield = part_type_create();

part_type_sprite(		particleType_spark, spr_spark,0,0,0);
part_type_size(			particleType_spark, 0.8,1.4,-0.01,0);
part_type_life (		particleType_spark, 24, 30);
part_type_alpha3(		particleType_spark, 1, 0.8, 0.1);
part_type_orientation(	particleType_spark, 0, 359, 0, 0, 0);
part_type_speed(		particleType_spark, 2, 4, -0.1, 0);
part_type_direction(	particleType_spark, 0,359,0,0);
part_type_color2(		particleType_spark, c_green, c_lime)
