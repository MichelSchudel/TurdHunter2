var step_size =2;


//Input handling
if keyboard_check(vk_left) || keyboard_check(ord("A"))  {
  x = x - step_size;
  image_xscale = -1;
}

if keyboard_check(vk_right) || keyboard_check(ord("D")) {
	x = x + step_size;
	image_xscale = 1;
}

if keyboard_check(vk_up) || keyboard_check(ord("W")) {
	y = y - step_size; 
}

if keyboard_check(vk_down) || keyboard_check(ord("S")) {
	y = y + step_size;
}

//Movement handling
var isIdle = (x == xprevious && y == yprevious)

if (isIdle) {
	sprite_index = spr_player_idle
	audio_stop_sound(snd_footstep);
	is_footstep_playing = false;
} else {
    sprite_index = spr_player_walking
	if (!is_footstep_playing) {
	  audio_play_sound(snd_footstep, 1, true);
	  is_footstep_playing = true;
	
	}
	
}

x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);