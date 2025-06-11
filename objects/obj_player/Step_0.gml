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

// Get sprite size and origin
var sw = abs(sprite_width);
var sh = sprite_height;
var ox = abs(sprite_xoffset);
var oy = sprite_yoffset;

// Clamp x and y so the sprite stays inside the room
x = clamp(x, ox, room_width - (sw - ox));
y = clamp(y, oy, room_height - (sh - oy));