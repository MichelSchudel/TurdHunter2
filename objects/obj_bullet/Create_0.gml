// Make sure target variable exists
if (!variable_instance_exists(id, "target")) {
    target = noone;
}

move_speed = 8;

// Optionally set initial direction toward target if it exists
if (instance_exists(target)) {
    move_direction = point_direction(x, y, target.x, target.y);
    image_angle = move_direction;
} else {
    move_direction = 0; // or just leave it for now
}
