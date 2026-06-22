with (obj_player)
{
    var _block = other;
    
    if (state == UnknownEnum.Value_4 || state == UnknownEnum.Value_29 || state == UnknownEnum.Value_36 || (state == UnknownEnum.Value_19 && freefallsmash >= 10) || (state == UnknownEnum.Value_55 && movespeed >= 12))
    {
        var _y = y;
        var _x = x + (xscale * 5);
        
        if (state == UnknownEnum.Value_19)
        {
            _y = y + vsp;
            _x = x;
        }
        
        if (state == UnknownEnum.Value_29)
        {
            _y = y + vsp;
            _x = x + (xscale * 5);
        }
        
        if (place_meeting(_x, _y, _block))
        {
            with (_block)
                instance_destroy();
            
            if (state == UnknownEnum.Value_19)
            {
                sprite_index = spr_player_groundpoundland;
                image_index = 0;
                vsp = 0;
                hsp = 0;
                state = UnknownEnum.Value_14;
                movespeed = abs(hsp);
                FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
            }
        }
    }
}
