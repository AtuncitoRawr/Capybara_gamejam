if other.hp > 0 {
	other.hp -= 1;
	alarm[0] = 1;
	audio_play_sound(snd_bullet_hit, 0, false);
}