function scr_player_grab()
{
    static snowbuffer = 5;
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);

    static grabOut = function()
    {
        var move = key_right + key_left;
        
        if (key_attack)
        {
            state = UnknownEnum.Value_3;
            sprite_index = spr_player_mach2;
            image_index = 0;
        }
        else
        {
            sprite_index = spr_player_idle;
            image_index = 0;
            state = UnknownEnum.Value_0;
            
            if (move == 0)
                movespeed = 0;
        }
    };
    
    FMODSet3dPos(soundGrab, x, y);
    get_input();
    hsp = movespeed * xscale;
	
	if isErnie
	    instakill = true;
    
    if (jumpstop == false && !key_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    var move = key_right + key_left;
    

    var _accel = on_ice ? 0.25 : 1;
    if (movespeed < 10) && !isErnie
        movespeed = approach(movespeed, 10, _accel);
		
    if (movespeed > 13) && isErnie
        movespeed = lerp(movespeed, 13, 0.075);
		

    if (is_kingdom && grounded && !on_ice && movespeed > 0)
    {
        if (snowbuffer > 0)
            snowbuffer--;
        else
        {
            create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
            snowbuffer = 5;
        }
    }

    buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_blur_effect(palIndex != 0 ? sprite_index : spr_mildredKart, image_index, x, y, xscale);
    }
    
    buffers.dashcloud--;
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
        
        if (is_kingdom && !on_ice)
            repeat(2) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
    }
    
    image_speed = 0.35;
	
    if (!grounded && sprite_index == spr_player_grab)
    {
        image_index = 0;
        sprite_index = spr_player_airgrabstart;
    }
	
	var ChosenKungFuSprite = irandom_range(1, 3);
	
	if (!grounded && (sprite_index == spr_ernie_kungfu1 || sprite_index == spr_ernie_kungfu2 || sprite_index == spr_ernie_kungfu3))
    {
        image_index = 0;
        sprite_index = asset_get_index(string("spr_ernie_kungfu{0}airstart", ChosenKungFuSprite));
    }
	
    if (animation_end() && sprite_index == spr_ernie_kungfu1airstart)
        sprite_index = spr_ernie_kungfu1air;
		
    if (animation_end() && sprite_index == spr_ernie_kungfu2airstart)
        sprite_index = spr_ernie_kungfu2air;
		
    if (animation_end() && sprite_index == spr_ernie_kungfu3airstart)
        sprite_index = spr_ernie_kungfu3air;
    
    if (grounded && sprite_index == spr_player_airgrab)
    {
        grabOut();
        exit;
    }
	
    if (grounded && (sprite_index == spr_ernie_kungfu1air || sprite_index == spr_ernie_kungfu2air || sprite_index == spr_ernie_kungfu3air))
    {
        grabOut();
        exit;
    }
    
    if (animation_end() && sprite_index == spr_player_grab)
    {
        grabOut();
        exit;
    }
	
    if (animation_end() && (sprite_index == spr_ernie_kungfu1 || sprite_index == spr_ernie_kungfu2 || sprite_index == spr_ernie_kungfu3))
    {
        grabOut();
        exit;
    }
    
    if (animation_end() && sprite_index == spr_player_airgrabstart)
        sprite_index = spr_player_airgrab;
    
    if (key_down2 && grounded)
    {
        FMODevent_oneshot("event:/Sfx/Player/crouchslide", x, y);
        crouchslip = 25;
        sprite_index = sprites.crouchslip;
        image_index = 0;
        state = UnknownEnum.Value_16;
        movespeed = isErnie ? 14 : 12;
        create_particleStatic(spr_superdashcloud, x, y, xscale, 1);
        fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
        exit;
    }
    
    if (move != 0 && move != xscale)
    {

        var _turn_deccel = on_ice ? 0.05 : 1;
        movespeed = approach(movespeed, 0, _turn_deccel);
        
        if (movespeed <= 0 || !on_ice)
        {
            movespeed = 0;
            sprite_index = spr_player_grabcancel;
            state = UnknownEnum.Value_2;
            fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
            exit;
        }
    }
    
    if (jumpBuffer && coyote_time)
    {
        jumpBuffer = false;
        image_index = 0;
        sprite_index = sprites.longjump;
        state = UnknownEnum.Value_3;
		if isErnie
		    movespeed = 14;
        vsp = -12;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/rollgetup", x, y);
        fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
        create_particleStatic(spr_grabcloud, x, y, xscale, 1);
        
        if (is_kingdom && !on_ice)
            repeat(3) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !grounded)
    {
        wallgrab = 10;
        verticalMovespeed = isErnie ? 16 : movespeed;
        state = UnknownEnum.Value_17;
        sprite_index = spr_player_wallclimb;
        image_index = 0;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && grounded)
    {

        var _bump_deccel = on_ice ? 0.05 : 1;
        if (on_ice && movespeed > 4)
        {
            movespeed = approach(movespeed, 0, _bump_deccel);
        }
        else
        {
    		if !isErnie
    		{
                movespeed = 0;
                hsp = 0;
                vsp = -6;
                state = UnknownEnum.Value_2;
                sprite_index = spr_player_grabbump;
                create_particleStatic(spr_hurteffect, x, y, 1);
                image_index = 0;
                fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
                FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
    		}
    		else
    		{
                movespeed = -0;
                hsp = -16 * xscale;
                vsp = -10;
                state = UnknownEnum.Value_26;
                sprite_index = spr_ernie_kungfubump;
                create_particleStatic(spr_hurteffect, x, y, 1);
                image_index = 0;
                fmod_studio_event_instance_stop(soundGrab, UnknownEnum.Value_1);
                FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
    		}
        }
    }
}
