// Set text color and alignment
draw_set_font(fnt_title);       // Use your large title font
draw_set_color(c_yellow);       // Any GameMaker color like c_red, c_white, or custom
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the title
draw_text(room_width / 2, room_height / 2 - 40, "TURD HUNTER 2");

draw_set_font(fnt_small);       // Use your large title font
draw_set_color(c_white);       // Any GameMaker color like c_red, c_white, or custom
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the prompt
// Only draw text every 30 steps for blinking effect
if ((current_time div 500) mod 2 == 0) {
    draw_text(room_width / 2, room_height / 2 + 50, "Press SPACE to Start");
}

draw_text(room_width / 2, room_height / 2 + 300, "(C) 1982 the Boyz");