var _type = ds_map_find_value(async_load, "type");

if (_type == "video_end")
{
    video_close();
    instance_destroy();
    
    with (obj_player)
    {
        targetRoom = serverMenuShit
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
