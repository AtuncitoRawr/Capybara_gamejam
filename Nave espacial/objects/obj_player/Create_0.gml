event_inherited();

moveDir = 0;
moveSpd = 4;
xspd = 0;
yspd = 0;
Aimdir = 0;

rightKey = 0;

instance_create_layer(x,y,"ui",obj_hpbar);
//state inicial
action = "Idle"
face = "D"
state = STATE_IDLE
hp = 100;
hpmax = 100;
shield = false
hascontrol = true;
light = false;

// variables de vida
hpprev = hpmax;
followuptimermax = 60;
followuptimer = 0;
knockback = false;

// Variables de acciones
firingFrequency = 0;
can_throw_bomb = true;
bomb_cooldown = 120;
bomb_power = 24;
rolldirection = 0;
dash = 0;
invencible = false;
invisible = false;

ready_to_restart = false;


PlasmaBullet = new create_weapon(TYPE_BULLET, spr_player, obj_bullet, 30, 90)
RandomMine = new create_weapon(TYPE_BULLET, spr_playerL, oMine, 180, 24)
//laser = new create_weapon(TYPE_LASER,spr_playerR, oLaser_player, 120, 0)

//agregar armas al inventario

array_push(global.Playerweapons, global.Weaponlist.PlasmaBullet, global.Weaponlist.RandomMine)
//global.Weaponlist.laser)

selectedweapon = 0;
weapon = global.Playerweapons[selectedweapon];

