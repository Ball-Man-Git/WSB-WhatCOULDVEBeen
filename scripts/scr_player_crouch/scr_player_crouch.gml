function scr_player_crouch()
{
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);

    get_input();
    hsp = movespeed * xscale;
    var move = key_right + key_left;
    
    if (!key_down && !scr_solid(x, y - 16) && grounded)
    {
        image_index = 0;
        sprite_index = spr_player_idle;
        state = UnknownEnum.Value_0;
    }
    
    if (animation_end() && sprite_index == sprites.crouchstart)
    {
        sprite_index = sprites.crouch;
        image_index = 0;
    }
    
    if (animation_end() && sprite_index == spr_player_crouchhop)
    {
        sprite_index = spr_player_crouchfall;
        image_index = 0;
    }
    
    if (jumpstop == false && !key_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (grounded && (sprite_index == spr_player_crouchhop || sprite_index == spr_player_crouchfall))
    {
        sprite_index = sprites.crouchstart;
        image_index = 2;
        create_particleStatic(spr_landeffect, x, y, 1, 1);
    }
    
    if (move != 0)
    {
        if (sprite_index == sprites.crouch)
        {
            image_index = 0;
            sprite_index = spr_player_crouchmove;
        }
        
        if (!on_ice)
            xscale = move;
        else if (move != xscale && movespeed > 0)
            movespeed = approach(movespeed, 0, 0.05);
        else
            xscale = move;

        var _accel = on_ice ? 0.1 : 0.5;
        movespeed = approach(movespeed, 4, _accel);
        buffers.step--;
        
        if (sprite_index == spr_player_crouchmove)
        {
            image_speed = movespeed / 15;
            
            if (floor(image_index) == 2 && buffers.step <= 0)
            {
                FMODevent_oneshot("event:/Sfx/Player/step", x, y);
                buffers.step = 12;
                create_particleStatic(spr_cloudeffect, x, y + 42, 1, 1);
                
                if (is_kingdom && !on_ice)
                    repeat(2) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
            }
        }
    }
    else
    {
        var _deccel = on_ice ? 0.02 : 1;
        movespeed = approach(movespeed, 0, _deccel);
        image_speed = 0.35;
        
        if (sprite_index == spr_player_crouchmove && movespeed == 0)
        {
            image_index = 0;
            sprite_index = sprites.crouch;
        }
    }
    
    if (!grounded && sprite_index != spr_player_crouchhop)
    {
        image_index = 0;
        sprite_index = spr_player_crouchfall;
    }
    
    if (jumpBuffer && grounded)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        
        if (is_kingdom && !on_ice)
            repeat(2) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);

        image_speed = 0.35;
        image_index = 0;
        sprite_index = spr_player_crouchhop;
        vsp = -8;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
    }
}
