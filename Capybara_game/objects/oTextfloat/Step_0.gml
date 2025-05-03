

if alpha < alphaMax && !alphaIn 
{

alpha += alphaSpd;
alpha = clamp(alpha, 0, 1);
} 


if alpha >= alphaMax
{
	alphaIn = true;	
}

if alphaIn && timeOn <= 0 
{
	alphaOut = true;
	alpha -= alphaSpd;
	alpha = clamp(alpha, 0, 1);
} else if alphaIn {
	timeOn--	
}

if alpha <= 0 && alphaOut

{
	instance_destroy();	
}
