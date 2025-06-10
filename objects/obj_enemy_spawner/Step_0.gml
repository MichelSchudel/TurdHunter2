spawn_timer -= 1;

if (spawn_timer <= 0) {
    var spawned = 0;
    var attempts = 0;

    while (spawned < enemy_batch_size && attempts < 100) {
        var sx = random_range(64, room_width - 64);
        var sy = random_range(64, room_height - 64);

        // Don't spawn on top of another enemy
        if (!position_meeting(sx, sy, obj_enemy)) {
            instance_create_layer(sx, sy, "Instances", obj_enemy);
            spawned += 1;
        }

        attempts += 1;
    }

    // Reset the timer
    spawn_timer = spawn_interval;
}