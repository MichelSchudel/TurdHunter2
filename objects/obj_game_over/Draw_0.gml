// Draw the sprite itself
draw_self();

// Get view size and position from the active camera
var cam = view_camera[0];
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

// Calculate center of the view
var center_x = view_x + view_w / 2;
var center_y = view_y + view_h / 2;

// Draw the score below the "game over" sprite, nicely centered
draw_set_halign(fa_center);
draw_text(center_x, center_y + 60, "Score: " + string(global.score));

if (can_continue) {
    draw_set_halign(fa_center);
    draw_text(center_x,  center_y + 120, "Press any key to continue...");
}