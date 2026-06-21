with (obj_player)
{
    if (sprite_index == sprites.gateslam)
    {
        hsp = 0;
        vsp = 0;
        
        if (animation_end())
            image_index = image_number - 1;
        
        if (place_meeting(x, y, obj_timesup))
        {
            hsp = 4;
            vsp = -10;
			FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
			shake_camera(15);
            sprite_index = choose(spr_player_hurt, sprites.backhurt)
        }
    }
    
    if (sprite_index == spr_player_hurt || sprite_index == sprites.backhurt)
    {
    }
}

if (falling)
{
    y = approach(y, obj_screensizer.displayHeight / 2, vsp);
    vsp += 1;
}
