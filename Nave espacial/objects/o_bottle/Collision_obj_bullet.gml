var _inst = instance_create_layer(x,y,"Instances",o_tutorial)
with (o_tutorial) {
_inst.text = other.text;
}
_inst.xp = x;
_inst.yp = y;

instance_destroy();
effect_create_above(ef_firework,x,y,1,c_white)