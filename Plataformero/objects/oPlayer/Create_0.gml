//Funciones personalizadas para el jugador

//Iniciadores

controlSetup();

hitByAttack = ds_list_create();
countHitAttack = 0
alarm[0] = 1;
depth = -30;

state = STATE_IDLE;

//Sprites
maskSpr = sMerluzoboy_idle
idleSpr = sMerluzoboy_idle;
runSpr = sMerluzoboy_run;
walkSpr = sMerluzoboy_walk;
initJump = sMerluzoboy_initjump;
jumpSpr = sMerluzoboy_jump;
fallSpr = sMerluzoboy_fall;
firstPunchSpr = sMerluzoboy_fPunch;
secondPunchSpr = sMerluzoboy_sPunch;
thirdPunchSpr = sMerluzoboy_tPunch;
airSpr = sMerluzoboy_airattack;
crouchSpr = sMerluzoboy_crouching;
hitSpr = sMerluzoboy_fall;
deadSpr = sMerluzoboy_dead;

//Variables de estados

crouching = false;
runType = 0;

//Estadisticas

hpMax = 200;
hp = hpMax;
flash = false;
hurtTime = 60;
invFrames = 2;
invTimer = 0;
invAlpha = 1;

knockbackSelf = 0;
knockbackOtherTime = 0;
knockback_x = 0;
knockback_y = 0;
attackDamage = 0;
frameHitStart = 0;
frameHitEnd = 0;

//ataques

firstAttack = global.attackList.fishfirstSlap;
secondAttack = global.attackList.fishSecondSlap;
thirdAttack = global.attackList.fishThirdBoink;
airAttack = global.attackList.airKick;
diagonalAirkick = global.attackList.diagonalairkick;
smashDownPunch = global.attackList.smashdownpunch;

attacking = false;

//Direccion 
face = 1;
moveDir = 0;

//Movimiento
can_move = true;
startRunning = 0;

moveSpd = 0;
accel = 4;
last_dir = 0;

moveMaxSpd = 60;
crouchMoveSpd = 20;

xspd = 0;
yspd = 0;

//Ataque y daño
actualAttackdmg = 0;
actualStartFrame = 0;
actualEndFrame = 0;
airAttackCount = 0;
airAttackMaxCount = 1;

//Salto

grav = 4.75;
termVel = 140;
startJumping = 0;

fallCount = 0;
fallCheck = 60;
jumpCount = 0;
jumpMax = 2;
jumpButton = 0;
jumpButtonMax = jumpMax;
jumpHoldTimer = 0;
onGround = true;
falling = false;

//Valores de salto para casos de salto efectivo
	jumpHoldFrames[0] = 10;
	jspd[0] = -70;
	jumpHoldFrames[1] = 8;
	jspd[1] = -80;
	
	//Coyote time
	//Tiempo en aire
	coyoteHangFrames = 4;
	coyoteHangTimer = 0;
	//Buffer de salto
	coyoteJumpFrames = 4;
	coyoteJumpTimer = 0;

//Plataformas en movimiento

myFloorPlat = noone;
earlyMoveplatXspd = false;
downSlopeSemiSolid = noone;
forgetSemiSolid = noone;
movePlatXspd = 0;
movePlatMaxYspd = termVel; //Que tan rapido pueded el jugador seguir una plataforma que se mueva para abajo;

//Codigo de aplastamiento
crushTimer = 0;
crushDeathTime = 3;


object_id = id;
text_id = "prueba";
color = c_white;
spd = 2;