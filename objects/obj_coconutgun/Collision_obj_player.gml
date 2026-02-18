if (other.state == UnknownEnum.Value_22 || other.state == UnknownEnum.Value_36)
{
    with (other)
    {
        x = other.x;
        y = other.y;
        state = UnknownEnum.Value_51;
        sprite_index = spr_player_coconut_intro;
        image_index = 0;
    }
    
    instance_destroy();
}
