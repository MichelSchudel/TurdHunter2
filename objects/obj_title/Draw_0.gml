// Set text color and alignment
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the title
draw_text(room_width / 2, room_height / 2 - 40, "TURD HUNTER 2");

// Draw the prompt
// Only draw text every 30 steps for blinking effect
if ((current_time div 500) mod 2 == 0) {
    draw_text(room_width / 2, room_height / 2 + 10, "Press SPACE to Start");
}