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
		 health_timer = STAMINA_TIMER_VALUE;
		 if (player_stamina <= MAX_PLAYER_STAMINA) { 
			 player_stamina = player_stamina + 10;
		 }
	}
} else {
	if health_timer <= 0 {
		 health_timer = STAMINA_TIMER_VALUE;
		 if (player_stamina >= 0) {
			 player_stamina = player_stamina - 3;
		 }
    }
}

if (player_health <= 0)
{
  // Get the camera ID for view 0
var cam = view_camera[0];

// Get camera position and size
var cx = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
var cy = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;
    instance_create_layer(x, y, layer, obj_player_explosion);
	instance_create_layer(cx,cy, layer, obj_game_over);
    instance_destroy(); // remove the player

	//todo add game over sound
    audio_play_sound(snd_explosion, 1, false);
	
	instance_destroy(); // remove the player
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
bullet_spawn_timer = max(45, 60 - global.level * 3); // Every level, we will shoot quicker, until 45


// Trigger explosion
if (keyboard_check_pressed(vk_space) && player_stamina > NUKE_EXPLOSION_STAMINA_THESHOLD) {

	effect_create_above(ef_explosion, x, y, obj_player.NUKE_EXPLOSION_RADIUS, c_aqua);

    // Destroy all enemies within radius
    with (obj_enemy) {
        if (point_distance(x, y, other.x, other.y) < obj_player.NUKE_EXPLOSION_RADIUS) {
            instance_destroy();
        }
    }

    // Play explosion sound (optional)
    audio_play_sound(snd_explosion, 10, false);
	
	//After triggering a nuke, the player is temporarily exhausted
	player_stamina = 0;
}