/// @description scrProcessAttacks(sprite_index, mask_index, damage)
/// @param {real} <sprite_index> el indice del sprite animado
/// @param {real} <mask_index> la mascara del ataque
/// @param {real} <knockback_x> el empuje horizontal
/// @param {real} <knockback_y> el empuje vertical
/// @param {real} <knockback_time> el tiempo de retroceso
/// @param {real} <damage> el daño del ataque
/// @param {real} <frame_start> el primer frame donde es efectiva la colision
/// @param {real} <frame_end> el ultimo frame donde es efectiva la colision

function scrProcessAttacks(_sprite, _mask, _dragx, _dragy, _knockback_time, _damage, _frameStart, _frameEnd){
	


	
//Inicio del ataque
if sprite_index != _sprite
{
	sprite_index = _sprite;
	image_index = 0;
	ds_list_clear(hitByAttack);
	countHitAttack = 0
	actualStartFrame = _frameStart;
	actualEndFrame = _frameEnd;
	
}



actualAttackdmg = _damage
//Usa la hitbox del ataque y comprueba golpes
mask_index = _mask;



var _hitByAttackNow = ds_list_create();

_hits = instance_place_list(x, y , oEntity, _hitByAttackNow, false) 



if (_hits > 0)
{
	for (var i = 0;i < _hits;i++)
	{
		//Si la instancia no ha sido golpeada por este ataque
		var _hitID = _hitByAttackNow[| i];
		if (ds_list_find_index(hitByAttack,_hitID) == -1)
		{
			if _hitID.alarm[0] <= 0
			{
			
			var _par = object_get_parent(_hitID.object_index)
				
			if (_hitID.attacking == true && _hitID.image_index >= _hitID.actualStartFrame && _hitID.image_index <= _hitID.actualEndFrame
			&& _hitID.actualAttackdmg > _damage)
		    {
			
				ds_list_destroy(_hitByAttackNow);
				mask_index = maskSpr;
				exit;
			} 
			
			
			if object_get_parent(object_index) != _par && _hitID.object_index != object_index
			{
			
				ds_list_add(hitByAttack,_hitID);
				countHitAttack += 1;
			
				var _hitTime = hitStopValues(_damage)
	
				scrEnemyHit(self,_hitID, _dragx, _dragy, _knockback_time, _damage);	
					
				if countHitAttack < 2
				{
					hitStop(_hitTime)
					_damage = clamp(_damage, 0, 80);
					Screenshake(_damage,_hitTime);
				}
			
			}

			}
		}
	}
}
ds_list_destroy(_hitByAttackNow);
mask_index = maskSpr;

}