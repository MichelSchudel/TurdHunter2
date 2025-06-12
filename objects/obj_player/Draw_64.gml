//Draw the HUD, so score, health bar, stamina bar, wave level

var _xx = display_get_gui_width() / 2;

draw_set_font(fnt_default);

draw_set_halign(fa_center)
draw_healthbar(_xx - 150, 24, _xx - 50, 40, player_stamina, c_black, c_red, c_lime, 0, true, true);
draw_text(_xx - 10, 30, "Stamina");

draw_healthbar(_xx + 50, 24, _xx + 150, 40, player_health, c_black, c_red, c_lime, 0, true, true);
draw_text(_xx + 180, 30, "Health");

draw_set_halign(fa_left);
draw_text(30, 30, "Score: " + string(global.score) );

draw_set_halign(fa_right);
draw_text(display_get_gui_width() - 30, 30,"Wave: " + string(global.level) );