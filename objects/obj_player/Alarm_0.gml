bullet_amount = 1 + floor((global.level - 2) / 2);
bullet_amount = max(1, bullet_amount); // make sure it's never below 1
bullet_amount = min(bullet_amount, 5); // make sure it's never above 5

var _spawn_bullet = function() {
    // Collect all enemies with their distance
    var enemies = array_create(0);
    with (obj_enemy) {
        var d = point_distance(other.x, other.y, x, y);
        array_push(enemies, [id, d]);
    }

    // Sort enemies by distance
    array_sort(enemies, function(a, b) {
        return a[1] - b[1];
    });

    // Camera bounds
    var cx = camera_get_view_x(view_camera[0]);
    var cy = camera_get_view_y(view_camera[0]);
    var cw = camera_get_view_width(view_camera[0]);
    var ch = camera_get_view_height(view_camera[0]);

    var bullets_fired = 0;

    for (var i = 0; i < array_length(enemies) && bullets_fired < bullet_amount; i++) {
        var enemy_id = enemies[i][0];

        // Only fire at enemies visible in camera
        if (point_in_rectangle(enemy_id.x, enemy_id.y, cx, cy, cx + cw, cy + ch)) {
            // Create bullet
            var b = instance_create_layer(x, y, "Instances", obj_bullet);
            b.target = enemy_id;  // assign target immediately after creation
            bullets_fired += 1;
        }
    }

    // Play sound if we fired any bullets
    if (bullets_fired > 0) {
        audio_stop_sound(snd_single_laser);
        audio_sound_gain(snd_single_laser, 0.25, 0);
        audio_play_sound(snd_single_laser, 10, false);
    }
};

_spawn_bullet();



// Reset the timer for continuous shooting
alarm[0] = bullet_spawn_timer;
