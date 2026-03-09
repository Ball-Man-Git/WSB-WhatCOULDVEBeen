if (other.grounded && other.key_up && other.state != UnknownEnum.Value_20 && other.state != UnknownEnum.Value_21 && other.state != UnknownEnum.Value_38)
{
    if (global.key) 
    {
        global.key = false;
        ds_list_add(global.saveroom, id);
        open = true;
        
     
        with (obj_keyfollow) state = "unlock";
        
  
        FMODevent_oneshot("event:/Sfx/General/Level/Gerome/unlock", x, y);
        shake_camera(3, 5);

        with (other)
        {
            targetRoom = other.targetRoom;
            door = other.targetDoor;
            hallway = false;
            movespeed = 0;
            vsp = 0;
            hsp = 0;
            state = UnknownEnum.Value_20;
            image_index = 0;
            sprite_index = spr_player_doorunlock;
        }
    }
    else if (open) 
    {
        with (other)
        {
            targetRoom = other.targetRoom;
            door = other.targetDoor;
            state = UnknownEnum.Value_20;
            image_index = 0;
            sprite_index = spr_player_lookdoor;
            FMODevent_oneshot("event:/Sfx/General/Level/Progression/door");
            instance_create(x, y, obj_fadeout);
        }
    }
}
