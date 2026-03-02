function scr_player_hammerattack()
{
    get_input();
    hsp = movespeed * xscale;
    
    if (movespeed < 13)
        movespeed = approach(movespeed, 13, 1);
    
    buffers.hammer = approach(buffers.hammer, 0, 1);
    
    if (movespeed >= 7)
    {
        buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
        
        if (buffers.afterimageBlur == 0)
        {
            buffers.afterimageBlur = 5;
            create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
        }
    }
    
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
    }
    
    if (key_down2 && grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/crouchslide", x, y);
        crouchslip = 25;
        sprite_index = sprites.crouchslip;
        image_index = 0;
        state = UnknownEnum.Value_16;
        
        if (movespeed < 12)
            movespeed = 12;
        
        create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
        fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
    }
    
    if (key_down2 && !grounded)
    {
        image_index = 0;
        sprite_index = sprites.rolling;
        state = UnknownEnum.Value_16;
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
    }
    
    if (jumpBuffer && coyote_time)
    {
        jumpBuffer = false;
        image_index = 0;
        sprite_index = sprites.longjump;
        state = UnknownEnum.Value_3;
        vsp = -12;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
        fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
    }
    
    if (!key_slap && buffers.hammer == 0)
    {
        flash = true;
        state = UnknownEnum.Value_4;
        image_index = 0;
        sprite_index = sprites.mach3;
    }
    
    if (animation_end() && sprite_index == spr_milton_hammerspin_prep)
    {
        image_index = 0;
        sprite_index = spr_milton_hammerspin;
    }
    
    if (vsp >= 2)
        vsp += 0.5;
    
    if (place_meeting(x + xscale, y, obj_solid))
    {
        state = UnknownEnum.Value_37;
        xscale *= -1;
        movespeed = 9 * xscale;
        flash = true;
        vsp = -16;
        squashX = 1.3;
        squashY = 0.8;
        FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
        image_index = 0;
        sprite_index = spr_milton_hammertwirl;
    }
    
    if (sprite_index == spr_milton_hammerspin_prep)
        image_speed = 0.35;
    else
        image_speed = 0.5;
}

function scr_player_hammertwirl()
{
    get_input();
    hsp = movespeed;
    var move = key_right + key_left;
    movespeed = approach(movespeed, move * 11, 0.7);
    
    if (grounded && vsp >= 0)
    {
        if (move != 0)
            xscale = move;
        
        if (key_attack)
        {
            movespeed = 13;
            flash = true;
            state = UnknownEnum.Value_4;
            image_index = 0;
            sprite_index = sprites.mach3;
        }
        else
        {
            movespeed = abs(movespeed);
            state = UnknownEnum.Value_0;
            image_index = 0;
            sprite_index = (move != 0) ? spr_player_land2 : spr_player_land;
        }
    }
    
    if (key_down2 && !grounded)
    {
        image_index = 0;
        sprite_index = sprites.rolling;
        state = UnknownEnum.Value_16;
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
        
        if (move != 0)
            xscale = move;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !isErnie)
    {
        xscale = sign(hsp);
        movespeed = abs(movespeed);
        
        if (movespeed < 12)
            movespeed = 12;
        
        verticalMovespeed = movespeed;
        state = UnknownEnum.Value_17;
        sprite_index = spr_player_wallclimb;
    }
    
    if (vsp >= 2)
        vsp += 0.5;
    
    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
    }
    
    doGrab();
    image_speed = 0.5;
}
