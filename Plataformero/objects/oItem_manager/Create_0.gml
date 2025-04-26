depth = -9999;

controlSetup();
//crear constructor para los items

function create_item(_name, _desc, _icon ,_spr, _can_drop ,_effect) constructor
{
	name = _name;
	description = _desc;
	icon = _icon;
	sprite = _spr;
	can_drop = _can_drop;
	effect = _effect;
	
}

//Crear items

global.item_list =
{

	completo : new create_item("Completo",
	"¡¡Completo!! recupera 20 de HP.",
	sCompleto,
	sCompleto,
	true,
	
	function()
	{
		oPlayer.hp += 20;
		
		array_delete(inv, selected_item, 1);
		array_insert(inv, selected_item, global.item_list.completo_half)
	}
	),
	
	
	completo_half : new create_item("Completo a la mitad",
	"!!Completo a la mitad!! recupera 20 de HP.",
	sCompleto_1,
	sCompleto_1,
	true,
	
	function()
	{
		oPlayer.hp += 20;
		
		array_delete(inv, selected_item, 1);
	}
	),
	
	bomba : new create_item("Bomba",
	"Si, explota, por si te quedaba alguna duda.",
	sBomba,
	sBomba,
	true,
	function()
	{
	var _bomb = instance_create_layer(oPlayer.x, oPlayer.y - 20, "Instances", oBomb)	
	_bomb.moveSpd = 60;
	_bomb.moveDir = oPlayer.face;
	_bomb.yspd = -100;
	
	array_delete(inv, selected_item, 1);
		
	}
	),
	
	blue_key : new create_item("LLave azul",
	"Dedujiste bien, abre puertas azules.",
	sB_tarjeta,
	sB_tarjeta,
	false,
	
	function()
	{
		var _used = false;
		if instance_exists(oBlue_door)
		{
			with(oBlue_door)
			{
				if distance_to_object(oPlayer) < 200 {
					instance_destroy();
					_used = true;
					
					};	
			}
		}
		
		if _used == true {
		array_delete(inv, selected_item, 1);
		}
		
	}
	),
	
	red_key : new create_item("LLave roja",
	"Dedujiste bien, abre puertas rojas.",
	sR_tarjeta,
	sR_tarjeta,
	false,
	
	function()
	{
		var _used = false;
		if instance_exists(oRed_door)
		{
			with(oRed_door)
			{
				if distance_to_object(oPlayer) < 200 {
					instance_destroy();
					_used = true;
					
					};	
			}
		}
		
	}
	)

}

//Crear sistema de inventario

inv = array_create(0);
inv_max = 4;
	
selected_item = -1;
	
//Variables de dibujo
screenWidth = display_get_gui_width()  -80;
screenHeight = display_get_gui_height() -1020;
sep = 130;