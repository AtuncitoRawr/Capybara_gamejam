controlSetup();

hitByAttack = ds_list_create();
countHitAttack = 0
alarm[0] = 1;
depth = -30;

state = STATE_IDLE;

//Sprites

hitByAttack = ds_list_create();
countHitAttack = 0
alarm[0] = 1;
depth = -30;

state = STATE_IDLE;

//Sprites
maskSpr = sCapybaraIdle;
crouchMaskSpr = sCapybaraCrouch;
idleSpr = sCapybaraIdle;
walkSpr = sCapybaraWalk;
jumpSpr = sCapybaraJump;
fallSpr = sCapybaraCrouch;
crouchSpr = sCapybaraCrouch;
hitSpr = sCapyBaraHit;
deadSpr = sFighterDead;
punchLargeSpr = sCapybaraLargePunch;
airPunchLargeSpr = sCapybaraAirPunch;
crouchPunchLargeSpr = sCapybaraCrounchpunch;
kickLargeSpr = sCapybaraKick;
guardSpr = sCapybaraIdle;


//Variables de estados

crouching = false;
runType = 0;
yaxisLeft = 0;
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

attackKeyPressed = 0;
actualAttackdmg = 0;


allowToPunch = false;
allowToKick = false;
allowToMove = false;
allowToJump = false;
allowToCrouch = 0;
allowToGuard = 0;
attackRange = 20;


responseDelay = 15;
responseDelayTimer = 0;

attackDelay = 15;
attackTimer = 0

moveDelay = 15;
moveTimer = 0;

sillyPath = 0;
wisePath = 0;
randomPath = 0;

beAgresive = 1;
beCareful = 2;
beWise = 3;

//Probabilidade de comportamiento fuera del rango de ataque
Behavior[0,0] = beAgresive; //Este sugiere avanzar directamente o saltar y entrar con patada
Behavior[0,1] = beCareful; //Este sugiere avanzar pero con un limite y si se acerca el jugador retroceder
Behavior[0,2] = beWise; //Este analiza cada movimiento del jugador y lo contrarrestra pero tiene reaccion alta
Behavior[1,0] = COMPLETE; 
Behavior[1,1] = COMPLETE; 
Behavior[1,2] = COMPLETE; 

//Probabilidad de que salga cada ataque dentro del rango de ataque
Attack[0,0] = allowToPunch; 
Attack[0,1] = allowToKick; 
Attack[0,2] = allowToCrouch; //Este va de la mano con un combo, o puede que solo se agache
Attack[0,3] = allowToJump; //Al igual que agacharse este va de la mano con una patada
Attack[0,4] = allowToGuard;//Tiene la posibilidad de salir de combate el tiempo en esta o solo para bloquear
Attack[1,0] = COMPLETE; 
Attack[1,1] = COMPLETE; 
Attack[1,2] = COMPLETE; 
Attack[1,3] = COMPLETE; 
Attack[1,4] = COMPLETE; 

decision = 0;

guarding = false;
blocking = false;

attacking = false;

punchLarge = global.attackList.CapybaraLargePunch;
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
jspd[0] = -8;
