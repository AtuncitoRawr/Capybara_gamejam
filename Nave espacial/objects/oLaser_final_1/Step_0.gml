if (!instance_exists(obj_player)) || obj_player.state == STATE_DEAD		
{
	instance_destroy();
	
}
if instance_exists(oLaser_player){
x = oLaser_player.xEnd
y = oLaser_player.yEnd
image_angle = oLaser_player.image_angle
} else {
	
instance_destroy();	
}