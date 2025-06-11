wait_time--;

if (wait_time <= 0) {
    audio_stop_sound(snd_ingamemusic)
    audio_stop_sound(snd_footstep)
	room_goto(rm_title);
}