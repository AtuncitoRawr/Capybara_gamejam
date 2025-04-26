function scrDamage_entity(_tid, _sid, _damage, _time, _dis){
	///@arg tid	   id del objetivo real
	///@arg sid	   id del origen real
	///@arg damage cuanto daño hace
	///@arg time   cuanto knockback tendra el objetivo
	///@arg dis    cuanto knockback de distancia tendra el objetivo

	with (_tid) {
		
		if alarm[HURT] > 0 or state == STATE_DEAD exit;
		
		hp -= _damage;
		var _dead = is_dead();
		path_end();
		//establecer knockback
		if _dead{ _dis *= 1 }else {_dis *= 1;}
		var _dir = point_direction(_sid.xstart,_sid.ystart,x,y) 
		hsp +=  lengthdir_x(_dis,_dir);  //horizontal speed
		vsp +=  lengthdir_y(_dis,_dir);	//vertical speed
		calc_path_delay = _time;
		alert = true;
		knockback_time = _time
		if _damage != 0 {
		alarm[HURT] = hurt_time;
		}
		if !_dead state = STATE_KNOCKBACK;
		image_index = 0;
		return _dead;
		
	}
}

function is_dead(){
	///@desc ve si una instancia esta muerta
	
	if state != STATE_DEAD {
		if hp <= 0 {
			state = STATE_DEAD;
			hp = 0;
			image_index = 0;
			//establecer un sonido de muerte
			switch(object_index) {
				default:
				//reproducir sonido
				break;
				case obj_player:
				audio_play_sound(snd_player_death, 0, false)
				break;
			}
			return true;
				
		}
	
	} else return true;

}

function check_if_stopped() {
	if abs(hsp) < 0.1  hsp = 0;
	if abs(vsp) < 0.1  vsp = 0;	
}

function show_healthbar() {
	if hp != hp_max and hp > 0 {
		draw_healthbar(x - 14, y - 32, x + 14, y-28, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1)
	}
}
	
	