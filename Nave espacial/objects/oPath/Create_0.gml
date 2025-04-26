
//initialize target location variables
target_x = x
target_y = y
owner = id;
right = 0;
left = 1;
dir = 0;

Orbit = irandom_range(200,400); // Orbit distance
Angle = irandom(359); // Current orbital angle
spd = 1; // Orbital speed

x = target_x + lengthdir_x(Orbit, Angle);
y = target_y + lengthdir_y(Orbit, Angle);
