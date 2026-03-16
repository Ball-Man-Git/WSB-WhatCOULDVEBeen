if (on) {
    switch (state) {
        case 0: 
            y = approach(y, ystart, 2);
            if (instance_exists(obj_player)) { obj_player.visible = false; obj_player.state = -4; }
            if (y <= ystart) { state = 1; image_index = 1; fmod_studio_event_instance_start(obj_player.soundsGroundpound); }
            break;
        case 1: 
            if (instance_exists(obj_player)) { obj_player.visible = true; obj_player.x = approach(obj_player.x, x + 64, 4); }
            if (alarm == -1) alarm = 60;
            break;
        case 2: 
            y = approach(y, ystart + 400, 4);
            with(obj_brewman) { if (intro_state == -1) intro_state = 0; }
            if (y >= ystart + 350) instance_destroy();
            break;
    }
}
