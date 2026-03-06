if (_throw > 0) 
    _throw--;

if (place_meeting(x, y, obj_player) && _throw <= 0)
{
    with (obj_player)
    {
        hsp = 0;
        vsp = 0;
        movespeed = 0;
        x = lerp(x, other.x, 0.2);
        y = lerp(y, other.y - 50, 0.2);
        
        if (state != UnknownEnum.Value_38 && state != UnknownEnum.Value_39 && state != UnknownEnum.Value_40)
        {
            state = UnknownEnum.Value_38;
            sprite_index = spr_player_snowball_idle;
            image_index = 0;
            FMODevent_oneshot("event:/Sfx/Player/grab", x, y);
        }
    }
    
    if (sprite_index != spr_throw)
    {
        image_index = 0;
        sprite_index = spr_throw;
    }
}

if (sprite_index == spr_throw)
{
    if (floor(image_index) >= 15 && _throw <= 0)
    {
        _throw = 40;
        with (obj_player)
        {
            vsp = -14;
            movespeed = 12;
            xscale = other.image_xscale;
            jumpstop = true;
            FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
        }
    }
    
    if (animation_end())
        sprite_index = spr_idle;
}