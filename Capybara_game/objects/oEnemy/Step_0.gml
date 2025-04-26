if instance_exists(oPlayer)
{

var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);

x += lengthdir_x(moveSpd, _dir);
y += lengthdir_y(moveSpd, _dir);
}