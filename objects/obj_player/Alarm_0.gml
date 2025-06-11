// define a function for spawning bullets
var _spawn_bullet = function() {
	//if (hitpoints <= 0) exit;
	instance_create_layer(x, y, "Instances", obj_bullet);
	//audio_stop_sound(snd_bullet);
	//audio_play_sound(snd_bullet, 10, false);
}
_spawn_bullet();

// reset player bullet spawn timer
// the delay between the shots decreases depending on the speed upgrade level
alarm[0] = bullet_spawn_timer;