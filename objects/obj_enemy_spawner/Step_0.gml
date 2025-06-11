spawn_timer -= 1;
var amount = 8;

if (spawn_timer <= 0) {
	 global.level++;
	 
	repeat(amount + global.level * 4) {
		var xx, yy;

		// define camera values as variables for better readabilty
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam)
		var cam_y = camera_get_view_y(cam)
		var cam_width = camera_get_view_width(cam)
		var cam_height = camera_get_view_height(cam)

		switch (irandom_range(1, 4)) {
		    case 1: // top edge
		        xx = irandom_range(cam_x, cam_x + cam_width);
				yy = cam_y;
		    break;
		    case 2: // bottom edge
		        xx = irandom_range(cam_x, cam_x + cam_width);
				yy = cam_y + cam_height;
		    break;
		    case 3: // left edge
		        xx = cam_x;
				yy = irandom_range(cam_y, cam_y + cam_height);
		    break;
		    case 4: // right edge
		        xx = cam_x + cam_width;
				yy = irandom_range(cam_y, cam_y + cam_height);
		    break;
		}

		// spawn the enemy after determining its position
		instance_create_layer(xx, yy, "Instances", obj_enemy)
	}

    spawn_timer = spawn_interval;
}