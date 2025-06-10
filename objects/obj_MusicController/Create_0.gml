if !audio_is_playing(ingamemusic) {
  audio_play_sound(ingamemusic, 1, true);
  audio_sound_gain(ingamemusic, 0.35, 0);
}