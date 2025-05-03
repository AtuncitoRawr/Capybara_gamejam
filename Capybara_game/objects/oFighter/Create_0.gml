controlSetup();

hitByAttack = ds_list_create();
countHitAttack = 0
alarm[0] = 1;
depth = -30;

state = STATE_IDLE;

//Sprites
maskSpr = sFighteridle;
crouchMaskSpr = sFighterCrouchMask;
idleSpr = sFighteridle;
walkSpr = sFighterWalk;
jumpSpr = sFighterJump;
fallSpr = sFighterFall;
crouchSpr = sFighterCrouch;
hitSpr = sFighterHit;
deadSpr = sFighterDead;
punchLargeSpr = sFighterLargePunch;
airPunchLargeSpr = sFighterAirLargePunch;
crouchPunchLargeSpr = sFighterCrouchPunch;
kickLargeSpr = sFighterKick;
guardSpr = sFighterGuard;

//Variables de estados

crouching = false;
allowToCrouch = 0;
runType = 0;

//Estadisticas

hpMax = 200;
hp = hpMax;
flash = false;
hurtTime = 0;
invFrames = 0;
invTimer = 0;
invAlpha = 1;

knockbackSelf = 0;
knockbackOtherTime = 0;
knockback_x = 0;
knockback_y = 0;
attackDamage = 0;
frameHitStart = 0;
frameHitEnd = 0;

guarding = false;
blocking = false;

attacking = false;
allowToAttack = 0;
actualAttackdmg = 0;





punchLarge = global.attackList.playerLargePunch;
AirLarge = global.attackList.playerAirLargePunch;
CrouchLarge = global.attackList.playerCrouchLargePunch;
kickLarge = global.attackList.playerKick;



//Direccion 
face = 1;
moveDir = 0;

//Movimiento
can_move = true;
moveSpd = 0;
moveMaxSpd = 2;
last_dir = 0;
accel = 1;

xspd = 0;
yspd = 0;

//Salto

grav = .375;
termVel = 8;
startJumping = 0;

jumpCount = 0;
jumpMax = 1;
jumpButton = 0;
jumpButtonMax = jumpMax;
jumpHoldTimer = 0;
onGround = true;
falling = false;

//Valores de salto para casos de salto efectivo
jspd[0] = -10;
