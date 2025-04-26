event_inherited();


//Variables fijas
hp_max = 60;
hp = hp_max;
can_attack = true;
attack_angle = irandom(360)
path = path_add();
calc_path_timer = 15;
calc_path_delay = irandom(30);
alert = false;

txp = x;
typ = y;
behavior = false;
//variables Cambiantes
alert_dis = 500
//hp_max = 60;
move_spd = 0;
attack_dis = 20;
attack_frame = 0;
attack_cooldown = 75;
damage = 20;
knockback_time = 10;


oa_sensor_count = 96 //set initial sensor count
oa_interest_sensor = array_create(oa_sensor_count) //initialize array for interest sensors
oa_danger_sensor = array_create(oa_sensor_count) //initialize array for danger sensors
oa_sensor_length = 512 //sensor length
oa_result = 0; //initialize resulting direction variable


range_initial = 500;
range = range_initial
target_range = range;
target_id = noone;
final_weight = 0;

pathing = true;

check_path = true;

options_arr = [];




