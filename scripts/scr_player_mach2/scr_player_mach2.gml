function scr_player_mach2()
{
    get_input();
    hsp = movespeed * xscale;
    var move = key_right + key_left;
    var _accel = 0.1;
    
    if (character == UnknownEnum.Value_1)
        _accel = 0.065;
		
		if character == UnknownEnum.Value_2
		_accel = 0
		
		if isErnie
		movespeed = approach(movespeed, 14, 0.75)
    
    if (grounded)
        movespeed += _accel;
    
    buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
    
    if (buffers.afterimageMach <= 0)
    {
        buffers.afterimageMach = 6;
        create_machEffect(sprite_index, image_index, x, y, xscale, movespeed / 12);
    }
    
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
    }
    
    slope_momentum();
    
    if (animation_end() && sprite_index == sprites.mach1)
    {
		if character != UnknownEnum.Value_2
		{
        image_index = 0;
        sprite_index = sprites.mach2;
		}
		else
		{
			        movespeed = max(movespeed, 14);
        flash = true;
        state = UnknownEnum.Value_4;
        
        if (sprite_index != spr_player_rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
		}
    }
    
    if (animation_end() && sprite_index == spr_player_rollgetup)
    {
						if character != UnknownEnum.Value_2
		{
        image_index = 0;
        sprite_index = sprites.mach2;
		}
    }
    
    if (animation_end() && sprite_index == spr_player_mach2jump)
    {
        image_index = 0;
        sprite_index = spr_player_mach2jumpend;
    }
    
    if (animation_end() && sprite_index == spr_player_longjump)
    {
        image_index = 0;
        sprite_index = spr_player_longjumpend;
    }
    
    if (animation_end() && sprite_index == spr_player_walljumpstart)
    {
        image_index = 0;
        sprite_index = spr_player_walljump;
    }
    
    if (!grounded && (sprite_index == sprites.mach2 || sprite_index == sprites.mach1))
    {
        image_index = 0;
        sprite_index = spr_player_mach2jump;
    }
    
    if (grounded && (sprite_index == spr_player_mach2jump || sprite_index == spr_player_mach2jumpend || sprite_index == spr_player_walljump || sprite_index == spr_player_walljumpstart || sprite_index == spr_player_longjump || sprite_index == spr_player_longjumpend))
    {
				if character != UnknownEnum.Value_2
		{
        image_index = 3;
        sprite_index = sprites.mach2;
		}
				else
		{
			        movespeed = max(movespeed, 14);
        flash = true;
        state = UnknownEnum.Value_4;
        
        if (sprite_index != spr_player_rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
		}
    }
    
    if (grounded && sprite_index == spr_player_groundpoundcancel)
    {
        image_index = 0;
        sprite_index = spr_player_rollgetup;
    }
    
    if (sprite_index == sprites.mach2)
        image_speed = movespeed / 18;
    else
        image_speed = 0.45;
    
    if (jumpstop == false && !key_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (movespeed >= 12 && grounded)
    {
        movespeed = max(movespeed, character != UnknownEnum.Value_2 ? 12 : 14);
        flash = true;
        state = UnknownEnum.Value_4;
        
        if (sprite_index != spr_player_rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
        
        exit;
    }
    
    if (jumpBuffer && coyote_time)
    {
        grounded = false;
        jumpBuffer = false;
        image_index = 0;
        sprite_index = spr_player_mach2jump;
        vsp = -12;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
    }
    
    if (!key_attack && grounded)
    {
        if (sprite_index == sprites.mach1)
        {
            state = UnknownEnum.Value_0;
            sprite_index = global.escape.active ? spr_player_panic : sprites.idle
            image_index = 0;
            image_speed = 0.35;
            movespeed = 0;
        }
        else
        {
            FMODevent_oneshot("event:/Sfx/Player/machend", x, y);
            state = UnknownEnum.Value_5;
            sprite_index = spr_player_machslidestart;
            image_index = 0;
        }
        
        exit;
    }
    
    if (move != xscale && move != 0 && grounded)
    {
        if (sprite_index == sprites.mach1)
        {
            xscale *= -1;
        }
        else
        {
            FMODevent_oneshot("event:/Sfx/Player/machturn", x, y);
            sprite_index = spr_player_mach2turn;
            image_index = 0;
            state = UnknownEnum.Value_6;
            show_debug_message("mach turned from mach 2");
            exit;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x, y + 1, obj_slope) && grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
        state = UnknownEnum.Value_7;
        sprite_index = spr_player_wallsplat;
        image_index = 0;
        exit;
    }
    
    if (key_down)
    {
        image_index = 0;
        sprite_index = spr_player_rollstart;
        state = UnknownEnum.Value_16;
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        exit;
    }
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !grounded) || (scr_slope(x, y + 4) && place_meeting(x + sign(hsp), y - 4, obj_solid) && !place_meeting(x + hsp, y, obj_metalblock)))
    {
        var _climb = true;
        
        if (isMildred)
            _climb = doBump(40, abs(hsp) + 1);
        
        if (_climb)
        {
            verticalMovespeed = isErnie ? 16 : movespeed;
            state = UnknownEnum.Value_17;
            sprite_index = spr_player_wallclimb;
            image_index = 0;
            exit;
        }
    }
	if sprite_index == spr_player_mach2 && character == UnknownEnum.Value_2
	{
		        movespeed = max(movespeed, 14);
        flash = true;
        state = UnknownEnum.Value_4;
        
        if (sprite_index != spr_player_rollgetup)
        {
            image_index = 0;
            sprite_index = sprites.mach3;
        }
	}
    
    doTaunt();
    doGrab();
}
