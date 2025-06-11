obj_player.player_health -= 10;
effect_create_above(ef_explosion, x, y, 1, c_orange);
instance_destroy();