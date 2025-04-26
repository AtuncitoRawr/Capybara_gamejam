var _jefe = choose(BOSS_ATTACK_LASER,BOSS_ATTACK_ASAULT,BOSS_ATTACK_LASER2,BOSS_ATTACK_CHILDREN,BOSS_ATTACK_GATLING)
	ataque = _jefe
	
	if state == BOSS_ATTACK and instance_exists(obj_player) and obj_player.state != STATE_DEAD{
	sprite_index = spr_queen_mimic_4;
	image_blend = c_white

		switch(ataque) 
		{
	
			case BOSS_ATTACK_LASER:
				break;
		
			case BOSS_ATTACK_NOONE:
				instance_create_layer(x,y,"boss",obj_noone)
				break;
		
			case BOSS_ATTACK_ASAULT:
				scrbossDash()
				break;
		
			case BOSS_ATTACK_GATLING:
				instance_create_layer(x,y,"boss",obj_noone)
				break;
			
			case BOSS_ATTACK_CHILDREN:
				audio_play_sound(snd_queen_mimic_intro, 0,false)
				sprite_index = spr_queen_mimic_4;
				speed = 0;
				image_blend = c_fuchsia
				if instance_number(oMimic) <= 4 {
				scrBossInvocation();	
				}
				break;
			case BOSS_ATTACK_LASER2:
				break;
			
		}
 
	} else {
	ataque = BOSS_ATTACK_NOONE;
		
	}
		if ataque == BOSS_ATTACK_LASER {
			alarm_set(0,120)
		}
		
		if ataque == BOSS_ATTACK_LASER2 {
			alarm_set(0,240)
		}

		if ataque == BOSS_ATTACK_ASAULT {
			alarm_set(0,180)
		}

		if ataque == BOSS_ATTACK_NOONE {
			alarm_set(0,100)
		}

		if ataque == BOSS_ATTACK_GATLING {
			alarm_set(0,120)
		}
	
		if ataque == BOSS_ATTACK_CHILDREN{
			alarm_set(0,180)
		}
	
	