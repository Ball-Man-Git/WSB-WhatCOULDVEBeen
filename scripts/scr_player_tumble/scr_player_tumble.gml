function scr_player_tumble()
{
    get_input();
    hsp = movespeed * xscale;
    
    if (sprite_index != sprites.dive && sprite_index != spr_milton_diveprep)
        image_speed = movespeed / 18;
    else
        image_speed = 0.5;
    
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
    }
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_blur_effect(sprite_index, image_index, x, y, xscale);
    }
    
    slope_momentum();
    crouchslip--;
    
    if ((sprite_index == sprites.rolling || sprite_index == spr_player_crouchslip || sprite_index == spr_player_rollstart) && !grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/dive", x, y);
        sprite_index = sprites.dive;
        image_index = 0;
        vsp = 10;
    }
    
    if (sprite_index == sprites.dive || sprite_index == spr_milton_diveprep)
    {
        if (jumpBuffer && !grounded && character != UnknownEnum.Value_1)
        {
            vsp = isErnie ? -10 : -6;
			if !isErnie
            sprite_index = sprites.divebomb;
			else
			sprite_index = spr_ernie_divebombprep
            image_index = 0;
            state = UnknownEnum.Value_18;
            squashX = 1.3;
            squashY = 0.8;
        }
    }
    
    if (character == UnknownEnum.Value_1)
    {
        if (sprite_index == spr_milton_diveprep && animation_end())
            sprite_index = sprites.dive;
        
        if (jumpBuffer && grounded)
        {
            state = UnknownEnum.Value_37;
            flash = true;
            vsp = -16;
            squashX = 1.3;
            squashY = 0.8;
            movespeed = hsp;
            FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
            image_index = 0;
            sprite_index = spr_milton_hammertwirl;
            exit;
        }
    }
    
    if (sprite_index == sprites.dive && grounded)
    {
        sprite_index = spr_player_rollstart;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_rollstart && animation_end())
    {
        sprite_index = sprites.rolling;
        image_index = 0;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        if (character != UnknownEnum.Value_1)
        {
            crouchslip = 0;
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            state = UnknownEnum.Value_7;
            sprite_index = spr_player_wallsplat;
            image_index = 0;
        }
        else
        {
            FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
            create_particleStatic(spr_miltonEffect, x + (5 * xscale), y, 1, -2);
            xscale *= -1;
            squashX = 1.3;
            squashY = 0.8;
            
            if (movespeed < 20)
                movespeed++;
        }
    }
    
    if (!key_down && !scr_solid(x, y - 16) && grounded && crouchslip <= 0)
    {
        FMODevent_oneshot("event:/Sfx/Player/rollgetup", x, y);
        image_index = 0;
        sprite_index = spr_player_rollgetup;
        state = !isErnie ? UnknownEnum.Value_3 : UnknownEnum.Value_4;
		if character == UnknownEnum.Value_2
		movespeed = max(movespeed, isErnie ? 14 : 12);
    }
}
