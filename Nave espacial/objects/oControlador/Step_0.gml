


if (!instance_exists(o_linterna)) and progreso == 0{
	progreso = 1;
	var _inst = instance_create_layer(178,3678,"Instances",o_bottle)
	_inst.text = "usa Y y RT para equipar el iluminador"
	_inst.speed = 5;
	
}

if progreso == 2 {
progreso = 3;
var _inst = instance_create_layer(719,3811,"Instances",o_bottle)
_inst.text = "Gran Trabajo :D"
}

if progreso == 3 {
progreso = 4;
var _inst = instance_create_layer(119,3611,"Instances",o_bottle)
_inst.text = "Usa RT para disparar"
_inst.speed = 3;
}

if progreso == 5 {
progreso = 6;
var _inst = instance_create_layer(900,3600,"Instances",o_bottle)
_inst.text = "Bien hecho ;)"
_inst.speed = 6;
}

if progreso == 6 {
progreso = 7;
var _inst = instance_create_layer(200,2000,"Instances",o_bottle)
_inst.text = "OH NO, ES UN MONSTRUO QUE TE QUIERE MATARRR"
var _inst2 = instance_create_layer(900,2000,"Instances",o_bottle)
_inst2.text = "Puedes usar B para hacer un dash"
var _mimic = instance_create_layer(500, 2800, "Instances", oMimic)
_inst.speed = 6.5;
_inst2.speed = 4;

}

if instance_number(oMimic) <= 0 and progreso == 7 {
progreso = 8;	
var _inst = instance_create_layer(800,2700,"Instances",o_bottle)
_inst.text = "Excelente :)"
_inst.speed = 6;
}

if progreso == 8 {
progreso = 9;
var _inst = instance_create_layer(500,2200,"Instances",o_bottle)
_inst.text = "Interactua con ese objeto"
var _celda = instance_create_layer(500,2500,"Instances",obj_Reparador)
_inst.speed = 4;
}

if progreso == 9 and (instance_number(obj_Reparador) <= 0)  {
progreso = 10;
var _inst = instance_create_layer(800,1900,"Instances",o_bottle)
_inst.text = "Usalo con RT y curate, con X cambias los Items"
_inst.speed = 3;
}

if progreso == 11  {
progreso = 12;
var _inst = instance_create_layer(600,2000,"Instances",o_bottle)
_inst.text = "Grandioso :D"
_inst.speed = 5;
}

if progreso == 12{
progreso = 13;
var _inst = instance_create_layer(900,3000,"Instances",o_bottle);
_inst.text = "CUIDADO, UN ALIENIGENA QUIERE RAPTARTE";
var _inst2 = instance_create_layer(150,2000,"Instances",o_bottle);
_inst2.text = "Escudo con RT y puedes girarlo con LB y RB";
_inst.speed = 7;
_inst2.speed = 2;
var _prowler = instance_create_layer(600,2000,"Instances", oProwler)
}

if progreso == 13 and instance_number(oProwler) <= 0 {
progreso = 14;
var _inst = instance_create_layer(200,1600,"Instances",o_bottle)
_inst.text = "Bien hecho, un poco mas y terminas el juego :3"
_inst.speed = 7;
}


if progreso == 15 and instance_number(oProwler) <= 0 {
progreso = 16;
var _inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",o_bottle)
_inst.text = "HUYE PARA ARRIBA"
_inst.speed = 8;
}

if room == 2 and progreso == 16 {
progreso = 20;
var _inst = instance_create_layer(obj_player.x,obj_player.y,"Instances",o_bottle)
_inst.text = "Que diosito te acompañe"
	
}




