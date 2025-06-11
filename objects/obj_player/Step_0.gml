var step_size =2;


//input 
if keyboard_check(vk_left) {
  x = x - step_size;
  image_xscale = -1;

}
if keyboard_check(vk_right) {
	x = x + step_size;
	image_xscale = 1;
	
}
if keyboard_check(vk_up) {
	y = y - step_size;
	 
}
if keyboard_check(vk_down) {
	y = y + step_size;
	 
}

//input determination
if (x == xprevious && y == yprevious) {
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