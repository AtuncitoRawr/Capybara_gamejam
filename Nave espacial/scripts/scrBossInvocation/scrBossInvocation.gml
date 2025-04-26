// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scrBossInvocation(){
	
	// Get Camera Pos
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

// Get Camerra Size
var vw = camera_get_view_width(view_camera[0]) / 2;
var vh = camera_get_view_height(view_camera[0]) / 2;


var diagonalLength = 250;

// Choose a spawn direction


var spawnDir = 0;

for (var i = 0; i<360;i+=90) {
	
	
	spawnDir += i;
	

// Calculate Spawn position
var spawnX = lengthdir_x(diagonalLength, spawnDir);
var spawnY = lengthdir_y(diagonalLength, spawnDir);





// Make the spawn position relative to view center
spawnX += vx + vw;
spawnY += vy + vh;

if (place_empty(spawnX,spawnY, o_solid))   {
	
var mimic =	instance_create_layer(spawnX,spawnY,"Instances", oPortalmimic);


	
} 



}


}