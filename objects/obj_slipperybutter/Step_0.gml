scr_collision();

if (grounded)
{
    slippery = true;
    hsp = 0;
}

if (place_meeting(x, y, obj_player))
{
    var _cantSlip = [UnknownEnum.Value_42, UnknownEnum.Value_44, UnknownEnum.Value_41, UnknownEnum.Value_43, UnknownEnum.Value_45, UnknownEnum.Value_46, UnknownEnum.Value_47];
    
		with instance_create(x, y, obj_paintsplatter)
	blendColor = #ffe061
	
    with (obj_player)
    {
        instance_destroy(other);
        
        if (!array_contains(_cantSlip, state))
        {
            state = isErnie ? UnknownEnum.Value_29 : UnknownEnum.Value_48;
            movespeed = 12;
            vsp = -15;
            sprite_index = isErnie ? spr_player_buzzsawBump : spr_player_slipsyrup;
            image_index = 0;
            FMODevent_oneshot("event:/Sfx/Player/slip", x, y);
        }
    }
}
