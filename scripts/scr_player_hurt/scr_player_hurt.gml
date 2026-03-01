function scr_player_hurt()
{
    image_speed = 0.35;
    
    if (grounded && vsp >= 0)
    {
        movespeed = 0;
		image_index = 0
        sprite_index = sprites.land;
        state = UnknownEnum.Value_0;
    }
}
