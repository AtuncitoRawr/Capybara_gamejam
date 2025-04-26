speed = 40

if instance_exists(obj_player){
move_towards_point(obj_player.x,obj_player.y, 20)
audio_play_sound(Snd_boss_dash,0,false)
audio_play_sound(snd_queen_mimic_dash,0,false)

image_blend = c_red

}

alarm_set(4, 45)