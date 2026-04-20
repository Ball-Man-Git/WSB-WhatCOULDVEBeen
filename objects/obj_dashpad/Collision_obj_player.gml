var t = id
with (other)
{
	if (other.buffer == 0) && (other.sprite_index == spr_dashpad)
	{
	var changecoord = true
            if place_meeting(x, y, obj_presentbox)
                changecoord = false
            if changecoord
                y = (other.y - 14)
            vsp = 0
			FMODevent_oneshot("event:/Sfx/General/Level/Progression/enterpage", x, y);
			            state = UnknownEnum.Value_4;
			sprite_index = sprites.mach3
			xscale = sign(other.image_xscale)
			            if ((movespeed < 14))
            {
                movespeed = 14
                hsp = (xscale * movespeed)
            }
            else
            {
                movespeed += 0.5
                hsp = (xscale * movespeed)
            }
            other.buffer = 30
	}
}