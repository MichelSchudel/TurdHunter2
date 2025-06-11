if !audio_is_playing(snd_ingamemusic) {
  audio_play_sound(snd_ingamemusic, 1, true);
  audio_sound_gain(snd_ingamemusic, 0.5, 0);
}