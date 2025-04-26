if (!instance_exists(obj_player)) || obj_player.state == STATE_DEAD		
{
	instance_destroy();
	
}
if instance_exists(oLaser){
x = oLaser.xEnd
y = oLaser.yEnd
image_angle = oLaser.image_angle
} else {
	
instance_destroy();	
}