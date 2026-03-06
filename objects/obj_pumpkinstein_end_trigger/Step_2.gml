if (place_meeting(x, y, obj_player))
{
    if (instance_exists(obj_pumpkinstein))
    {
        with (obj_pumpkinstein)
        {
            if (state != UnknownEnum.Value_8)
            {
                state = UnknownEnum.Value_8;
                image_index = 0;
            }
        }
    }
}