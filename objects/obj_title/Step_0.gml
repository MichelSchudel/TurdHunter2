if (keyboard_check_pressed(vk_space))
{
	audio_stop_sound(snd_title_music)
    room_goto(rm_game); // Replace 'rm_game' with your main game room
}