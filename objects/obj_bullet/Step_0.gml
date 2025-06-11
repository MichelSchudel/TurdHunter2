if (instance_exists(target)) {
    // Calculate direction to the target's current position
    move_direction = point_direction(x, y, target.x, target.y);
    image_angle = move_direction;

    // Move bullet towards target
    var rad = degtorad(move_direction);
    x += lengthdir_x(move_speed, move_direction);
    y += lengthdir_y(move_speed, move_direction);

    // Optional: Destroy bullet if close enough to target
    if (point_distance(x, y, target.x, target.y) < 8) {
        // Add hit logic here (damage, destroy enemy, etc.)
        instance_destroy();
    }
} else {
    // Target no longer exists, destroy bullet or do something else
    instance_destroy();
}
