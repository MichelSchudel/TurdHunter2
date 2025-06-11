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

//Health handling
if (isIdle) {
	 if health_timer <= 0 {
		 health_timer = MAX_HEALTH_TIMER_VALUE;
		 if (player_stamina <= MAX_PLAYER_STAMINA) { 
			 player_stamina = player_stamina + 10;
		 }
	}
} else {
	if health_timer <= 0 {
		 health_timer = MAX_HEALTH_TIMER_VALUE;
		 if (player_stamina >= 0) {
			 player_stamina = player_stamina - 5;
		 }
    }
}

if (player_health <= 0)
{
    instance_create_layer(x, y, layer, obj_player_explosion);
    instance_destroy(); // remove the player
	//todo add game over sound
	//audio_play_sound(snd_big_explosion, 1, false);
}


// Get sprite size and origin
var sw = abs(sprite_width);
var sh = sprite_height;
var ox = abs(sprite_xoffset);
var oy = sprite_yoffset;

// Clamp x and y so the sprite stays inside the room
x = clamp(x, ox, room_width - (sw - ox));
y = clamp(y, oy, room_height - (sh - oy));

// Update level and spawn timer:
global.level = floor(log2(global.score / 50)) + 1;
if (global.level < 0) global.level = 0;
bullet_spawn_timer = 60 - global.level * 5;