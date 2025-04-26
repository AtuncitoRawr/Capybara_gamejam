target_x = target_x
target_y = target_y



Angle += spd;

if(Angle >= 360) Angle -= 360;

// Update position
x = target_x + lengthdir_x(Orbit, Angle);
y = target_y + lengthdir_y(Orbit, Angle);

if (!instance_exists(owner))  {
	
	instance_destroy(self)
	
}