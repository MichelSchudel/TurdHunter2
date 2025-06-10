// Move slowly toward the player
var dir = point_direction(x, y, obj_player.x, obj_player.y);
x += lengthdir_x(move_speed, dir);
y += lengthdir_y(move_speed, dir);


if x - xprevious < 0 {
  image_xscale = -1;
}
if  x - xprevious > 0 {
  image_xscale = 1;
}