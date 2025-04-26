// Inherit the parent event
event_inherited();


//Sprites
maskSpr = sEnemy2_idle
idleSpr = sEnemy2_idle;
walkSpr = sEnemy2_idle;
chaseSpr = sEnemy2_chase;
jumpSpr = sEnemy2_idle;
fallSpr = sEnemy2_idle;
firstPunchSpr = sEnemy2_attack;
secondPunchSpr = sEnemy2_attack;
thirdPunchSpr = sEnemy2_attack;
hitSpr = sEnemy2_idle;
deadSpr = sEnemy2_chase;


rangeVision = 2800;
attackDistance = 2000;
attackDelayTimer = 30;
attackDelayFrames = 30;
knockbackSelf = 0;
knockbackOtherTime = 0;
knockback_x = 0;
knockback_y = 0;
attackDamage = 0;
attacking = false;

firstAttack = global.attackList.ambush;