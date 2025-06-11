var _xx = display_get_gui_width() / 2;

draw_set_font(fnt_default);


draw_healthbar(_xx - 150, 24, _xx - 50, 40, player_stamina, c_black, c_red, c_lime, 0, true, true);
draw_text(_xx - 10, 30, "Stamina");

draw_healthbar(_xx + 50, 24, _xx + 150, 40, player_health, c_black, c_red, c_lime, 0, true, true);
draw_text(_xx + 180, 30, "Health");