function scr_collide_destructibles()
{
    with (obj_destructibles)
    {
        with (obj_player)
        {
            if (state == UnknownEnum.Value_2 && vsp < 0)
            {
                if (place_meeting(x, y + vsp, other))
                {
                    var _destroy = true;
                    
                    if (_destroy)
                    {
                        instance_destroy(other);
                        vsp = 0;
                    }
                }
            }
            
            if (state == UnknownEnum.Value_3 || state == UnknownEnum.Value_4 || state == UnknownEnum.Value_22 || state == UnknownEnum.Value_16 || state == UnknownEnum.Value_36 || (sprite_index == spr_player_swingading && state == UnknownEnum.Value_23) || state == UnknownEnum.Value_38 || (state == UnknownEnum.Value_55 && movespeed >= 9))
            {
                if (place_meeting(x + (hsp * 2) + xscale, y - 1, other))
                {
                    var _destroy = true;
                    
                    if (_destroy)
                        instance_destroy(other);
                }
            }
            
            if (state == UnknownEnum.Value_16 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_26 || state == UnknownEnum.Value_13 || state == UnknownEnum.Value_29 || state == UnknownEnum.Value_17 || state == UnknownEnum.Value_42 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_46 || state == UnknownEnum.Value_45 || state == UnknownEnum.Value_48)
            {
                if (place_meeting(x + (hsp * 2), y + (vsp * 2), other))
                {
                    var _destroy = true;
                    
                    if (_destroy)
                        instance_destroy(other);
                }
            }
        }
    }
}
