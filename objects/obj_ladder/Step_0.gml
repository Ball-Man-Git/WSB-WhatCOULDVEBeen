with (instance_place(x, y - 1, obj_player))
{
    if ((key_up && place_meeting(x, y, obj_ladder)) || ((key_down && grounded && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid)) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_2 || state == UnknownEnum.Value_1)))
    {
        state = UnknownEnum.Value_28;
        hsp = 0;
        movespeed = 0;
        x = other.x + 16;
        
        if (key_down && grounded && !key_up)
            y = other.y + 1;
    }
}
