function scr_player_machturn()
{
    static snowbuffer = 5;
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);

    image_speed = 0.35;
    get_input();
    hsp = movespeed * xscale;
    var move = key_right + key_left;
    
    var turn_deccel = on_ice ? 0.05 : 0.4;
    movespeed = approach(movespeed, 0, turn_deccel);
    
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
    buffers.dashcloud--;
	
    if (slapBuffer > 0 && isErnie)
    {
		slapBuffer = false;
	}
    
    if (buffers.dashcloud <= 0 && grounded)
    {
        buffers.dashcloud = 12;
        create_particleStatic(spr_dashcloud1, x, y, xscale, 1);
        
        if (is_kingdom && !on_ice)
            repeat(2) create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 42, 1);
    }
    
    if (buffers.afterimageBlur == 0)
    {
        buffers.afterimageBlur = 3;
        create_blur_effect(palIndex != 0 ? sprite_index : spr_mildredKart, image_index, x, y, xscale);
    }
    
    if (animation_end() && sprite_index == spr_player_mach2turn)
    {
        sprite_index = spr_player_mach2turnfall;
        squashX = 1.3;
        squashY = 0.8;
        
        if (!grounded)
            FMODevent_oneshot("event:/Sfx/Player/gasp", x, y);
    }
    
    if (animation_end() && sprite_index == sprites.mach3turn)
    {
        sprite_index = spr_player_mach3turnfall;
        squashX = 1.3;
        squashY = 0.8;
        
        if (!grounded)
            FMODevent_oneshot("event:/Sfx/Player/gasp", x, y);
    }
    
    if (grounded && animation_end())
    {
        if (sprite_index == spr_player_mach2turn)
        {
            xscale *= -1;
            movespeed = 8;
            state = UnknownEnum.Value_3;
            sprite_index = spr_player_mach2;
            image_index = 0;
        }
        else if (sprite_index == sprites.mach3turn)
        {
            xscale *= -1;
			if isErnie
			    movespeed = 14;
			else
                movespeed = 12;
            state = UnknownEnum.Value_4;
            sprite_index = sprites.mach3;
            image_index = 0;
        }
    }
    
    if (grounded)
    {
        if (sprite_index == spr_player_mach2turnfall)
        {
            xscale *= -1;
            movespeed = 8;
            state = UnknownEnum.Value_3;
            sprite_index = spr_player_mach2;
            image_index = 0;
        }
        else if (sprite_index == spr_player_mach3turnfall)
        {
            xscale *= -1;
			if (character == UnknownEnum.Value_2)
			    movespeed = 14;
			else
                movespeed = 12;
            state = UnknownEnum.Value_4;
            sprite_index = sprites.mach3;
            image_index = 0;
        }
    }
}
