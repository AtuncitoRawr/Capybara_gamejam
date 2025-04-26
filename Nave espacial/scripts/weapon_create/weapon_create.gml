function create_weapon(_type = TYPE_BULLET, _sprite = spr_player, _bulletobject = obj_bullet, _cooldown = 1, _distance = 0) constructor
{
	typebullet = _type;
	sprite = _sprite;
	bulletobject = _bulletobject;
	cooldown = _cooldown;
	vsp = _distance;
	hsp = _distance;
	
}

//inventario de armas del jugador 

global.Playerweapons = array_create(0);

//armas

global.Weaponlist = {

PlasmaBullet : new create_weapon(TYPE_BULLET, spr_player, obj_bullet, 30, 90),
RandomMine : new create_weapon(TYPE_BULLET, spr_playerL, oMine, 120, 24)
//laser : new create_weapon(TYPE_LASER,spr_playerR, oLaser_player, 120, 0)

}

function WeaponSwap() {
	
with obj_player {
	var _playerweapons = global.Playerweapons;


	if swapkeypressed {
	
	selectedweapon++
	if selectedweapon >= array_length(_playerweapons) {selectedweapon = 0;}

	weapon = _playerweapons[selectedweapon]
	
	
	}
/*
	if swapkeypresseddown {
	
	selectedweapon--
	if selectedweapon < 0 {selectedweapon = array_length(_playerweapons) - 1 }
	
	weapon = _playerweapons[selectedweapon]
	
	}
	*/
}
	
}