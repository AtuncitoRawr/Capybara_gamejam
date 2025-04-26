// Mover en circulo
dir += rotSpd * global.timeStop;

if dir > 359 {dir = 0;}

//Obtener la posicion de destino
var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

//Obtener nuestra xpsd y yspd

xspd = _targetX - x;
yspd = _targetY - y;

//Moverse

x += xspd * global.timeStop;
y += yspd * global.timeStop;