get_input();

if (keyboard_check_pressed(vk_anykey))
{
    if (!prompSkip)
        prompSkip = true;
    else if (prompSkip && key_jump2)
        video_close();
}

if (video_get_status() == 0)
{
    instance_destroy();
    
    with (obj_player)
    {
        targetRoom = serverMenuShit;
        targetDoor = "A";
        hallway = false;
        
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = other.targetRoom;
        
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = -4
        sprite_index = spr_player_idle;
    }
}

video_set_volume(global.MasterVolume);
