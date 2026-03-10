function scr_player_snowball()
{
    static snowbuffer = 5;
    var roomname = string_letters(room_get_name(room));
    var is_kingdom = string_pos("kingdom", roomname) > 0;
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);

    get_input();
    move = key_left + key_right;
    hsp = movespeed * xscale;
    var maxspeed = 12;
    
    var _accel = on_ice ? 0.25 : 0.5;
    var _deccel = on_ice ? 0.1 : 0.5;

    if (move != 0)
    {
        if (move == xscale)
        {
            if (movespeed < maxspeed)
                movespeed = approach(movespeed, maxspeed, _accel);
            
            if (scr_slope(x, y + 4) && hsp != 0 && movespeed > 8 && movespeed < 18)
                slope_momentum(0.2, 0);
        }
        else if (move == -xscale)
        {
            if (movespeed <= 0) { xscale = move; movespeed = 0; }
            movespeed = approach(movespeed, 0, _deccel);
        }
    }
    else movespeed = approach(movespeed, 0, _deccel);
    
    if (is_kingdom && grounded && !on_ice && movespeed > 2)
    {
        if (--snowbuffer <= 0)
        {
            repeat(2) with (create_particleDebri(spr_snowparticle, irandom(3), x - (xscale * 15), y + 42, 1))
            {
                hsp = -(other.xscale * irandom_range(2, 5));
                vsp = -irandom_range(2, 4);
            }
            snowbuffer = 5;
        }
    }

    sprite_index = (movespeed < 1) ? spr_player_snowball_idle : spr_player_snowball_move;
    
    if (grounded && vsp > 0 && jumpBuffer > 0)
    {
        jumpstop = false;
        state = UnknownEnum.Value_39;
        jumpBuffer = 0;
        vsp = -11;
        image_index = 0;
        sprite_index = spr_player_snowball_jump;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
        if (is_kingdom && !on_ice) repeat(3) create_particleDebri(spr_snowparticle, irandom(3), x, y + 42, 1);
        exit;
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
        shake_camera(3, 5);
        vsp = -5;
        movespeed = approach(movespeed, 0, 4); 
        xscale *= -1; 
        sprite_index = spr_player_snowball_fall;
        repeat(3) create_particleDebri(spr_snowparticle, irandom(3), x + (xscale * 20), y, 1);
        exit;
    }
    
    if (!grounded) { state = UnknownEnum.Value_39; exit; }
}

function scr_player_snowball_jump()
{
    var on_ice = place_meeting(x, y + 1, obj_iceslippery);
    get_input();
    move = key_left + key_right;
    hsp = movespeed * xscale;
    var maxspeed = 12;
    var _accel = on_ice ? 0.25 : 0.5;
    var _deccel = on_ice ? 0.1 : 0.5;

    if (move != 0)
    {
        if (move == xscale) { if (movespeed < maxspeed) movespeed = approach(movespeed, maxspeed, _accel); }
        else if (move == -xscale) { if (movespeed <= 0) { xscale = move; movespeed = 0; } movespeed = approach(movespeed, 0, _deccel); }
    }
    else movespeed = approach(movespeed, 0, _deccel);
    
    if (jumpstop == false && !key_jump && vsp < grav) { jumpstop = true; vsp /= 20; }
    if (key_down2 && vsp < 10) vsp = 10;
    
    if (sprite_index == spr_player_snowball_jump && animation_end())
    {
        image_index = 0;
        sprite_index = spr_player_snowball_fall;
    }
    
    if (grounded && vsp > 0)
    {
        FMODevent_oneshot("event:/Sfx/Player/step", x, y);
        shake_camera(2, 3);
        repeat(4) create_particleDebri(spr_snowparticle, irandom(3), x, y + 42, 1);
        state = UnknownEnum.Value_38;
        exit;
    }
    
    if (place_meeting(x + xscale, y, obj_solid))
    {
        if (vsp > 0) vsp = 0;
        state = UnknownEnum.Value_40;
        exit;
    }
}

function scr_player_snowball_wall()
{
    get_input();
    move = key_left + key_right;
    hsp = 0;
    grav = 0;
    vsp = approach(vsp, move * xscale * -12, 0.5);
    

    if (!place_meeting(x + xscale, y, obj_solid))
    {
        grav = 0.5;
        jumpstop = true;
        state = UnknownEnum.Value_39;
        sprite_index = spr_player_snowball_fall;
        image_index = 0;
        exit;
    }
    
    if (vsp != 0 && floor(current_time / 100) % 5 == 0)
    {
        with (create_particleDebri(spr_snowparticle, irandom(3), x + (xscale * 15), y + irandom_range(-20, 20), 1))
        {
            hsp = -(other.xscale * irandom_range(2, 4));
            vsp = irandom_range(-2, 2);
        }
    }

    if (jumpBuffer > 0)
    {
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
        grav = 0.5;
        xscale *= -1;
        movespeed = 5;
        jumpBuffer = 0;
        vsp = -11;
        state = UnknownEnum.Value_39;
        exit;
    }
    
    sprite_index = (vsp > 1) ? spr_player_snowball_walldown : (vsp < 0 ? spr_player_snowball_wallup : spr_player_snowball_wall);
}
