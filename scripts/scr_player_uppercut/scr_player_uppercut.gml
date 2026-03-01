function scr_player_uppercut()
{
    get_input();
    var move = key_right + key_left;
	if sprite_index != spr_ernie_kungfubump || sprite_index != spr_ernie_superjumpstart || sprite_index != spr_ernie_superjump
    hsp = approach(hsp, movespeed * move, 0.8);
	else
	hsp = approach(hsp, movespeed * move, 0.8);
    
    if (move != 0)
        movespeed = isErnie ? 10 : 6;
    
    image_speed = 0.4;
    
    if (vsp < 0)
    {
        buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
        
        if (buffers.afterimageMach == 0)
        {
            buffers.afterimageMach = 4;
            create_machEffect(sprite_index, image_index, x, y, xscale, 1);
        }
    }
    
			    if (animation_end() && sprite_index == spr_ernie_superjumpstart)
    {
        image_index = 0;
        sprite_index = spr_ernie_superjump;
    }
	
	        if ((key_attack2 || key_slap2) && (sprite_index == spr_ernie_superjumpstart || sprite_index == spr_ernie_superjump))
        {
            sprite_index = spr_player_superjumpcancelstart;
            image_index = 0;
						verticalMovespeed = 0
			state = UnknownEnum.Value_13
            FMODevent_oneshot("event:/Sfx/Player/superjumpcancel", x, y);
        }
	
    if (animation_end() && sprite_index != spr_ernie_kungfubump && sprite_index != spr_ernie_superjumpstart && sprite_index != spr_ernie_superjump)
        image_index = image_number - 1;
    
    if (grounded && vsp > 0)
    {
        create_particleStatic(spr_landeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = (move != 0) ? sprites.land2 : sprites.land;
        state = UnknownEnum.Value_0;
		if isErnie
		{
			if key_attack
			{
						        movespeed = max(movespeed, 16);
        flash = true;
        state = UnknownEnum.Value_4;
        
        if (sprite_index != spr_player_rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
			}
		}
        FMODevent_oneshot("event:/Sfx/Player/step", x, y);
        movespeed = abs(hsp);
        
        if (move != 0)
            xscale = move;
        
        hsp = movespeed * xscale;
    }
}
