function scr_player_mach2()
{
    static snowbuffer = 5;
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);

    get_input();
    hsp = movespeed * xscale;
    var move = key_right + key_left;
    var _accel = 0.1;
    
    if (on_ice)
        _accel = 0.2;

    if (character == UnknownEnum.Value_1)
        _accel = 0.065;
		
    if (character == UnknownEnum.Value_2)
        _accel = 0;
		
    if (isErnie)
        movespeed = approach(movespeed, 14, 0.75);
    
    if (grounded)
        movespeed += _accel;
    
    if (is_kingdom && grounded && !on_ice && movespeed > 0)
    {
        if (snowbuffer > 0)
            snowbuffer--;
        else
        {
            repeat(2)
            {
                with (create_particleDebri(spr_snowparticle, irandom_range(0, 3), x - (xscale * 10), y + 42, 1))
                {
                    hsp = -(other.xscale * irandom_range(2, 4));
                    vsp = -irandom_range(2, 4);
                }
            }
            snowbuffer = 5;
        }
    }

    buffers.afterimageMach = approach(buffers.afterimageMach, 0, 1);
    
    if (buffers.afterimageMach <= 0)
    {
        buffers.afterimageMach = 6;
        create_machEffect(palIndex != 0 ? sprite_index : spr_mildredKart, image_index, x, y, xscale, movespeed / 12);
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
        if (character != UnknownEnum.Value_2)
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
        if (character != UnknownEnum.Value_2)
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
    
    if (animation_end() && sprite_index == sprites.longjump)
    {
        image_index = 0;
        sprite_index = sprites.longjumpend;
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
    
    if (grounded && (sprite_index == spr_player_mach2jump || sprite_index == spr_player_mach2jumpend || sprite_index == spr_player_walljump || sprite_index == spr_player_walljumpstart || sprite_index == sprites.longjump || sprite_index == sprites.longjumpend))
    {
        if (character != UnknownEnum.Value_2)
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
        
        if (is_kingdom && !on_ice)
            repeat(3) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
    }
    
    if (!key_attack && grounded)
    {
        if (sprite_index == sprites.mach1)
        {
            state = UnknownEnum.Value_0;
            sprite_index = global.escape.active ? spr_player_panic : sprites.idle;
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
            if (on_ice)
            {
                movespeed = approach(movespeed, 0, 0.1);
                if (movespeed <= 0)
                {
                    xscale *= -1;
                    movespeed = 2;
                }
            }
            else
            {
                FMODevent_oneshot("event:/Sfx/Player/machturn", x, y);
                sprite_index = spr_player_mach2turn;
                image_index = 0;
                state = UnknownEnum.Value_6;
                exit;
            }
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x, y + 1, obj_slope) && grounded)
    {
        if (on_ice && movespeed > 4)
        {
            movespeed = approach(movespeed, 0, 0.05);
        }
        else
        {
            FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            state = UnknownEnum.Value_7;
            sprite_index = spr_player_wallsplat;
            image_index = 0;
            exit;
        }
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

    if (sprite_index == spr_player_mach2 && character == UnknownEnum.Value_2)
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
