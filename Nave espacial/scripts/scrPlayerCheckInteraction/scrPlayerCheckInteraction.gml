function scrPlayerCheckInteraction(){
	if global.Interact {
		var interactive = scrGetFacingObject();
	
		if (interactive) {
			with (interactive) {
				event_user(0);
			}
		}
	}
}