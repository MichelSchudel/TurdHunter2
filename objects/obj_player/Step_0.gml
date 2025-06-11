var step_size;

if (player_stamina <= 0) {
	step_size = SLOW_SPEED;
} else {
	step_size = FAST_SPEED;
}


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

//stamina management
health_timer -= 1;

//Movement handling
var isIdle = (x == xprevious && y == yprevious)

if (isIdle) {
	 if health_timer <= 0 {
            health_timer = MAX_HEALTH_TIMER_VALUE;
    		if (player_stamina <= 100) {
               player_stamina = player_stamina + 10;
    		}
           }
	sprite_index = spr_player_idle
	audio_stop_sound(snd_footstep);
	is_footstep_playing = false;
} else {
     if health_timer <= 0 {
          health_timer = MAX_HEALTH_TIMER_VALUE;
    	  if (player_stamina >= 0) {
    	       player_stamina = player_stamina - 5;
          }
        }
    sprite_index = spr_player_walking
	if (!is_footstep_playing) {
	  audio_play_sound(snd_footstep, 1, true);
	  is_footstep_playing = true;
	
	}
	
}

x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);