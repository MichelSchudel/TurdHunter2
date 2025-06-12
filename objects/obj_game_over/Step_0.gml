wait_time--;

if (!can_continue) {
    wait_time--;
    if (wait_time <= 0) {
        can_continue = true;
    }
} else {
    // Wait for any key press
    if (keyboard_check_pressed(vk_anykey)) {
		// Stop music or sounds
        audio_stop_all();
		
        room_goto(rm_title);
    }
}