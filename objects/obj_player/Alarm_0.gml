var _spawn_bullet = function() {
    // Find the nearest enemy
    var selected_enemy = instance_nearest(x, y, obj_enemy);

    // Check if there's an enemy AND it's in camera view
    if (selected_enemy != noone) {
        var cx = camera_get_view_x(view_camera[0]);
        var cy = camera_get_view_y(view_camera[0]);
        var cw = camera_get_view_width(view_camera[0]);
        var ch = camera_get_view_height(view_camera[0]);

        if (point_in_rectangle(selected_enemy.x, selected_enemy.y, cx, cy, cx + cw, cy + ch)) {
            // Spawn bullet and play sound
            instance_create_layer(x, y, "Instances", obj_bullet);
            audio_stop_sound(snd_single_laser);
            audio_sound_gain(snd_single_laser, 0.25, 0);
            audio_play_sound(snd_single_laser, 10, false);
        }
    }
};

_spawn_bullet();

// Reset the timer for continuous shooting
alarm[0] = bullet_spawn_timer;
