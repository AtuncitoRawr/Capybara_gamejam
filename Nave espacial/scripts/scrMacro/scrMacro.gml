function scrMacro(){
//Sistema de guardado

	#macro SAVEFILE "Save.sav"
	
//Tipos de armas
	#macro TYPE_BULLET 0
	#macro TYPE_LASER 1
	
//states del jugador
	#macro STATE_IDLE 0
	#macro STATE_READING 1
	#macro STATE_INVENTORY 2
	#macro STATE_DASH 3
	#macro STATE_CINEMATIC 4
	#macro STATE_CHECK_SHIELD 5
	#macro STATE_SHIELD 6
	#macro STATE_ATTACK 7
	#macro STATE_KNOCKBACK 8
	#macro STATE_DEAD 9 
	#macro STATE_MOVE 10
	#macro STATE_FLEE 11
	#macro STATE_CURE 12
	
//Definicion de items
	#macro ITEM_DEF_NAME 0
	#macro ITEM_DEF_DESCRIPTION 1
	#macro ITEM_DEF_SPRITE 2
	#macro ITEM_DEF_ACTION 3
	#macro ITEM_DEF_MAX 4
//Inventario
	#macro INVENTORY_ITEM 0
	#macro INVENTORY_QUANTITY 1
//Items
	#macro ITEM_ID_TARJETA 0
	#macro ITEM_ID_REPARADOR 1
	#macro ITEM_ID_LINTERNA 2
	
//BOSS FIGHT 
	#macro BOSS_IDLE 0
	#macro BOSS_FIRST_VIEW 1
	#macro BOSS_ATTACK 2
	#macro BOSS_DASH 3
	
//BOSS ATAQUES

	#macro BOSS_ATTACK_LASER 4
	#macro BOSS_ATTACK_ASAULT 5
	#macro BOSS_ATTACK_GATLING 6
	#macro BOSS_ATTACK_NOONE 7
	#macro BOSS_ATTACK_CHILDREN 8
	#macro BOSS_ATTACK_LASER2 9
	
//MAP GRID
	
	#macro TILE_SIZE 64
	
//alarmas
	#macro CAN_ATTACK 0
	#macro HURT		  1
}

