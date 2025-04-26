controlSetup()

hitByAttack = ds_list_create();
countHitAttack = 0
hp = 1000;
flash = false;
hurtTime = 0;
depth = -20


//Sprites
maskSpr = sEnemy3_idle
idleSpr = sEnemy3_idle;
walkSpr = sEnemy3_idle;
chaseSpr = sEnemy3_idle;
runSpr = sEnemy3_idle;
jumpSpr = sEnemy3_idle;
fallSpr = sEnemy3_idle;
firstPunchSpr = sEnemy3_idle;
secondPunchSpr = sEnemy3_idle;
thirdPunchSpr = sEnemy3_idle;
crouchSpr = sEnemy3_idle;
hitSpr = sEnemy3_idle;
deadSpr = sEnemy3_idle;

//Variables de estados
crouching = false;

//Identificar entidad
rangeVision = 1500;
rangeRay = 500;
rayDir = 1;
rayX = 0;
rayY = 0;
rayDelayTimer = 0;
rayDelayFrames = 15;

target = 0;
target_name = "";

//patrullaje 
face = 1;
patrolMoveTimer = 0;
patrolMoveFrames = 120;
//descanso
patrolMove = false;
patrolRestTimer = 0;
patrolRestFrames = 120;


//Ataques
attackDistance = 0;
attackDelayTimer = 0;
attackDelayFrames = 15;

knockbackSelf = 0;
knockbackOtherTime = 0;

knockback_x = 0;
knockback_y = 0;
attackDamage = 0;
frameHitStart = 0;
frameHitEnd = 0;
attacking = false;
actualAttackdmg = 0;
actualStartFrame = 0;
actualEndFrame = 0;
airAttackCount = 0;
airAttackMaxCount = 1;


firstAttack = global.attackList.assault;
//Daño

//Salto
jspd = -90;
can_jump = true;
jump_timer = 60;
jumpKeyBuffered = false;
yaxisLeft = 0;

//Movimiento
moveDir = choose(1,-1)
can_move = true;
last_dir = 0;
accel = 2;
xspd = 0;
moveSpd = 0;
moveMaxSpd = 20;
runType = 0;

//Coyote time
coyoteHangTimer = 0;
coyoteHangFrames = 4;

//Gravedad 
yspd = 0;
grav = 4.75;
termVel = 80;
fallCount = 0;
fallCheck = 20;
falling = false;
onGround = true;


state = STATE_IDLE;

//Plataformas en movimiento
myFloorPlat = noone;
forgetSemiSolid = noone;
earlyMoveplatXspd = false;
downSlopeSemiSolid = noone;
movePlatXspd = 0;
movePlatMaxYspd = termVel;

//Codigo de aplastamiento
crushTimer = 0;
crushDeathTime = 6;
