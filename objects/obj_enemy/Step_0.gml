var dir = 0;
if (instance_exists(obj_player)) {
 dir = point_direction(x, y, obj_player.x, obj_player.y);
}

new_x = x;
new_y = y;

new_x += lengthdir_x(move_speed, dir);
new_y += lengthdir_y(move_speed, dir);


x = new_x;
y = new_y;

//Flip the sprite if it walks to the right
if x - xprevious < 0 {
  image_xscale = -1;
}

//Flip the sprite if if walks to the left
if  x - xprevious > 0 {
  image_xscale = 1;
}