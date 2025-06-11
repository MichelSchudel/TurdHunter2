move_speed = 8;
move_direction = irandom_range(0, 360);

var selected_enemy = instance_nearest(x, y, obj_enemy); // nearest enemy

if (selected_enemy != noone) {
	// only shoot towards enemy if they are within camera view
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	var cw = camera_get_view_width(view_camera[0]);

	if point_in_rectangle(selected_enemy.x, selected_enemy.y, cx, cy, cx+cw, cy+ch) {
		move_direction = point_direction(x, y, selected_enemy.x, selected_enemy.y);
	}
}