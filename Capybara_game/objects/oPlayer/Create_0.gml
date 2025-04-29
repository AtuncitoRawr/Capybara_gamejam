controlSetup();

hitByAttack = ds_list_create();
countHitAttack = 0
alarm[0] = 1;
depth = -30;

state = STATE_IDLE;

//Sprites
maskSpr = sPlayer;
idleSpr = sPlayer;
runSpr = sPlayer;
walkSpr = sPlayer;
initJump = sPlayer;
jumpSpr = sPlayer;
fallSpr = sPlayer;
crouchSpr = sPlayer;
hitSpr = sPlayer;
deadSpr = sPlayer;

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

moveMaxSpd = 6;
crouchMoveSpd = 2;

xspd = 0;
yspd = 0;


//Salto

grav = 4.75;
termVel = 14;
startJumping = 0;

fallCount = 0;
fallCheck = 6;
jumpCount = 0;
jumpMax = 2;
jumpButton = 0;
jumpButtonMax = jumpMax;
jumpHoldTimer = 0;
onGround = true;
falling = false;

//Valores de salto para casos de salto efectivo
	jumpHoldFrames[0] = 10;
	jspd[0] = -7;
	jumpHoldFrames[1] = 8;
	jspd[1] = -8;
	
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

