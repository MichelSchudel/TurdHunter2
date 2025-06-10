// Move slowly toward the player
var dir = point_direction(x, y, obj_player.x, obj_player.y);
x += lengthdir_x(move_speed, dir);
y += lengthdir_y(move_speed, dir);