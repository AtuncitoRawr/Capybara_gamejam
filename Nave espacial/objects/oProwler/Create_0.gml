event_inherited();

alert_dis = 500
hp_max = 100;
alarm[2] = 20;

hp = hp_max;
attack_dis = 300;
cure_dis = 128;
attack_frame = 0;
attack_cooldown = 60;
damage = 20;
knockback_time = 10;

range_initial = 500;
set_angle = x
angle = 0;
radius = 0;
range = range_initial
target_range = range;
tx = x;
ty = y;
_tx = x;
_ty = y;
target_id = noone;
final_weight = 0;
calc_path_timer = 15;
calc_path_delay = irandom(30);
pathing = true;
ppath = path_add();
change_move = false;
can_path = true;
fo = object_index;
follow_object = true;
move_spd = 4;
//add our current position as the first path point
//path_add_point(path, x, y, move_spd);

check_path = true;

options_arr = [];


s_idle = spr_Prowler;
s_walk = spr_Prowler_move;
s_attack = spr_Prowler_attack;
s_dead = spr_Prowler_dead;
s_hit = spr_Prowler_hit;


