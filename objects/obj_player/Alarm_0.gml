// define a function for spawning bullets
var _spawn_bullet = function() {
	//if (hitpoints <= 0) exit;
	instance_create_layer(x, y, "Instances", obj_bullet);
	audio_stop_sound(snd_single_laser);
	audio_sound_gain(snd_single_laser, 0.25, 0);
	audio_play_sound(snd_single_laser, 10, false);
}
_spawn_bullet();

// reset player bullet spawn timer
// the delay between the shots decreases depending on the speed upgrade level
alarm[0] = bullet_spawn_timer;