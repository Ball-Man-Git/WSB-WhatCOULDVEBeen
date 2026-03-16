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

function scr_player_hammerdive()
{
    get_input();
    var move = key_right + key_left;
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    
 
    if (abs(hsp) > 0.1) xscale = sign(hsp);
    
    if (sprite_index != spr_milton_diveprep)
        hsp = approach(hsp, move * 10, 0.8); 
    else 
        hsp = 0; 


    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        state = UnknownEnum.Value_36; 
        sprite_index = spr_milton_hammerspin;
        image_index = 0;
        
        xscale *= -1; 
        movespeed = 12; 
        vsp = -5; 
        
        FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
        flash = true;
        
      
        var _bang = asset_get_index("spr_bang_effect");
        if (_bang != -1) create_particleStatic(_bang, x, y, 1, 1);
        else create_particleStatic(spr_genericpoofeffect, x, y, 1, 1);
        
        exit;
    }


    if (!key_attack && vsp < 0)
    {
        state = UnknownEnum.Value_37; 
        sprite_index = spr_milton_hammertwirl;
        vsp = -8; 
        flash = true;
        exit;
    }


    if (sprite_index == spr_milton_diveprep)
    {
        vsp = 0;
        if (animation_end())
        {
            sprite_index = spr_milton_dive;
            vsp = 22; 
            fmod_studio_event_instance_start(soundsMach); 
            hammer_bounces = 0; 
        }
    }
    
 
    if (sprite_index == spr_milton_dive)
    {
        vsp += 0.65;
        if (vsp > 30) vsp = 30;
        
       
        buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
        if (buffers.afterimageBlur == 0)
        {
            buffers.afterimageBlur = 3;
            create_miltonAfterimage(sprite_index, image_index, x, y, xscale);
        }


        var _baddie = instance_place(x, y + vsp, obj_baddie);
        if (_baddie != noone) {
            with (_baddie) { instance_destroy(); create_particleStatic(spr_genericpoofeffect, x, y, 1, 1); }
            shake_camera(3, 5);
        }
        
        var _met = instance_place(x, y + vsp, obj_metalblock);
        if (_met != noone) { 
            instance_destroy(_met); 
            shake_camera(8, 16); 
            FMODevent_oneshot("event:/Sfx/Player/slam", x, y); 
        }
        
        var _dest = instance_place(x, y + vsp, obj_destructibles);
        if (_dest != noone) instance_destroy(_dest);


        if (grounded || place_meeting(x, y + vsp, obj_baddie))
        {
      
            if (key_down) 
            {
                shake_camera(4, 8);
                
           
                var _impact_idx = asset_get_index("obj_miltonimpact");
                if (_impact_idx != -1) instance_create(x, y, _impact_idx);
                else create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
                

                if (is_kingdom) repeat(4) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);

                vsp = -20; 
                FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
            }
            else 
            {

                state = UnknownEnum.Value_3; 
                sprite_index = sprites.mach2;
                movespeed = 12; 
                flash = true;
                image_index = 0;
                create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
                FMODevent_oneshot("event:/Sfx/Player/step", x, y);
            }
        }
        
        if (vsp < 0 && key_down2)
        {
            vsp = 28; 
            flash = true;
            fmod_studio_event_instance_start(soundsMach);
            instance_create(x, y, obj_chargeeffect);
        }
    }
}




