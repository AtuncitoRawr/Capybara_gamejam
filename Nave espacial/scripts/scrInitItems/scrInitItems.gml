function scrInitItems(){
global.ITEMS = [];
	
global.ITEMS[ITEM_ID_TARJETA] = scrCreateItem("Tarjeta", "Una llave para abrir alguna puerta", spr_tarjeta_1, scrUseTarjeta, 1);
global.ITEMS[ITEM_ID_REPARADOR] = scrCreateItem("C. energia", "Arregla un poco la nave", spr_reparador_1, scrUseReparador,3);
global.ITEMS[ITEM_ID_LINTERNA] = scrCreateItem("Iluminador", "Proporciona un poco de luz", s_linterna_1, scrUseIluminador,1);
	
}