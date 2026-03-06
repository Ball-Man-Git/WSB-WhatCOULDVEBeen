if (place_meeting(x, y, obj_player))
{
    if (instance_exists(obj_pumpkinstein))
    {
        with (obj_pumpkinstein)
        {
            if (state == UnknownEnum.Value_0) 
                state = UnknownEnum.Value_1;
        }
    }
    instance_destroy(); 
}