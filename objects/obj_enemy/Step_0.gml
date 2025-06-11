var dir = 0;
if (instance_exists(obj_player)) {
 dir = point_direction(x, y, obj_player.x, obj_player.y);
}

new_x = x;
new_y = y;

new_x += lengthdir_x(move_speed, dir);
new_y += lengthdir_y(move_speed, dir);


// Check collision with other enemies
if (!place_meeting(new_x, new_y, obj_enemy)) {
    // Safe to move
    x = new_x;
    y = new_y;
} else {
    var arc_offset = 60 * sin(degtorad(dir));
	var new_xx = x;
	var new_yy = y + lengthdir_y(move_speed, dir) + arc_offset;// 32 is the strength of the arc
     
	if (!place_meeting(new_xx, new_yy, obj_enemy)) {
		x = new_xx;
		y = new_yy;
	} else {
    hspeed = 0;
    vspeed = 0;
	}
}

//Flip the sprite if it walks to the right
if x - xprevious < 0 {
  image_xscale = -1;
}

//Flip the sprite if if walks to the left
if  x - xprevious > 0 {
  image_xscale = 1;
}