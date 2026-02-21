with (obj_player)
{
	if !isJuan
	{
    state = UnknownEnum.Value_0;
    sprite_index = spr_player_idle;
	}
	else
	{
		state = UnknownEnum.Value_48
		instance_create(x, y, obj_explosion)
		xscale = -1
		movespeed = 14
		sprite_index = spr_player_spinout
	}
}
