//naomi's finally getting coded! hooray!!!!!!
function scr_naomi_normal()
{
    get_input();
    hsp = approach(hsp, movespeed * xscale, 0.5);
	var move = key_right + key_left;
	var r = naomi_movespeed
	
	    if (sprite_index == spr_naomi_move)
    {
        if ((floor(image_index) == 3 || floor(image_index) == 8) && buffers.step <= 0)
        {
            buffers.step = 12;
            FMODevent_oneshot("event:/Sfx/Player/step", x, y);
            create_particleStatic(spr_cloudeffect, x, y + 42, 1, 1, c_white);
        }
        
        buffers.step--;
    }
    
    if (jumpstop == false && !key_jump && vsp < grav)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (move != 0)
    {
		if sprite_index == spr_naomi_move
        image_speed = (abs(movespeed) / 12)
		else if sprite_index == spr_naomi_mach3
		image_speed = 0.4
		else
		image_speed = 0.35
        xscale = move;
        
        if (grounded)
		{
			                if movespeed >= 12
                    sprite_index = spr_naomi_mach3;
                else if key_attack
                    sprite_index = spr_naomi_mach;
                else
                    sprite_index = spr_naomi_move;
		}
			
				    if key_attack
    {
        if ((movespeed < 13))
            movespeed = approach(movespeed, 13, 0.15);
    }
	else
	movespeed = 8;
    }
    else
    {
        image_speed = 0.35;
        movespeed = 0;
        
        if (grounded)
            sprite_index = spr_naomi_idle;
    }
    
    if (animation_end() && sprite_index == spr_player_jump)
        sprite_index = spr_player_fall;
		
			    if movespeed >= 12
    {
		instakill = true
        if (!instance_exists(chargeeffect))
            chargeeffect = instance_create(x, y, obj_chargeeffect);
    }
	else
	{
	instakill = false
	if (instance_exists(chargeeffect))
	instance_destroy(chargeeffect)
	}
    
    if (jumpBuffer && coyote_time && grounded)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = spr_player_jump;
        vsp = -12;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
    }
	    if slapBuffer > 0 && key_up
    {
		        slapBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
        sprite_index = spr_player_jump;
        vsp = -20;
        jumpstop = false;
        FMODevent_oneshot("event:/Sfx/Player/uppercut", x, y);
	}
	
	    if ((key_down && grounded && (vsp > 0)) || scr_solid(x, y))
        state = UnknownEnum.Value_56
	doTaunt()
}

function scr_naomi_normalNEW()
{
	get_input();
	var move = key_right + key_left;
	hsp = movespeed;
	var r = naomi_movespeed;
	    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || ((abs(movespeed) < 8) && (move != xscale)) || (!key_attack) || (abs(movespeed) <= 6))
    {
        naomi_dash = 0;
        naomi_movespeed = 8;
    }
	
	    if ((naomi_movespeed >= 12) && (naomi_dash != 51))
    {
        instance_create(x, y, obj_jumpdust);
        naomi_dash = 51;
    }
	    if ((naomi_movespeed >= 12) || (naomi_dashpadbuffer > 0))
    {
        if (!instance_exists(chargeeffect))
            chargeeffect = instance_create(x, y, obj_chargeeffect);
    }
    if ((move != xscale) && (move != 0) && (naomi_dashpadbuffer <= 0))
    {
        xscale = move;
        if ((abs(movespeed) > 2) && (abs(hsp) > 2) && grounded)
        {
            state = UnknownEnum.Value_57;
            movespeed = abs(movespeed);
        }
    }
	    if ((naomi_dashpadbuffer > 0) && (movespeed != 0))
        xscale = sign(movespeed);
    if ((naomi_dashpadbuffer > 0))
        naomi_dashpadbuffer--;
    if ((naomi_dashpadbuffer <= 0))
    {
        if ((move != 0))
		{
			if ((move == xscale))
                movespeed = approach(movespeed, (xscale * naomi_movespeed), 0.5);
				            else
                movespeed = approach(movespeed, 0, 0.5)
		}
        else
            movespeed = approach(movespeed, 0, 0.5);
    }
    else
    {
        naomi_movespeed = 12;
        movespeed = (xscale * naomi_movespeed);
    }
    if ((abs(movespeed) > 2))
        image_speed = (abs(movespeed) / 12);
    else
        image_speed = 0.35;
    if sprite_index == spr_naomi_mach3
        image_speed = 0.4;
    var front = (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	if (!naomi_landanim)
        {
            if ((hsp != 0) && (!front))
            {
                if ((naomi_movespeed >= 12) || (naomi_dashpadbuffer > 0))
                    sprite_index = spr_naomi_mach3;
                else if key_attack
                    sprite_index = spr_naomi_mach;
                else
                    sprite_index = spr_naomi_move;
            }
            else
            {
                image_speed = 0.35;
                if ((sprite_index != spr_milton_idleanim1))
                {
                    sprite_index = spr_naomi_idle;
                        if ((buffers.idle < 400))
                            buffers.idle++;
                        if ((buffers.idle >= 150))
                        {
                            sprite_index = spr_milton_idleanim1;
                            image_index = 0;
                        }
                }
                else if animation_end()
                {
                    buffers.idle = 0;
                    sprite_index = spr_naomi_idle;
                }
            }
        }
        if animation_end()
        {
            naomi_landanim = false;
            if ((sprite_index == spr_player_land))
                sprite_index = spr_naomi_idle;
        }
        if ((sprite_index == spr_player_land))
            image_speed = 0.35;
			    if (jumpBuffer && coyote_time && naomi_dashpadbuffer == 0)
    {
        jumpBuffer = false;
        create_particleStatic(spr_jumpeffect, x, y, 1, 1);
        image_index = 0;
		if (((naomi_movespeed >= 12) && key_attack) || (naomi_dashpadbuffer > 0))
		sprite_index = spr_naomi_dashjump;
		else
        sprite_index = spr_player_jump;
        vsp = -11;
        jumpstop = false;
		naomi_landanim = false;
		state = UnknownEnum.Value_56;
        FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
    }
	    if (key_attack && grounded && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        move = xscale;
        if ((naomi_movespeed < 12))
            naomi_movespeed = approach(naomi_movespeed, 12, 0.15);
    }
	doTaunt();

}

function scr_naomi_skid()
{
	    hsp = (xscale * (-movespeed));
    movespeed = approach(movespeed, 0, 0.8);
	sprite_index = spr_player_machslide;
	    naomi_dash = 0;
    naomi_movespeed = 8;
    image_speed = 0.4;
	    if ((abs(movespeed) <= 0) || (abs(hsp) <= 0))
    {
        movespeed = 0;
        state = UnknownEnum.Value_55;
    }

}

function scr_naomi_jump()
{
		get_input();
	    var move = (key_left + key_right)
		    if ((sprite_index == spr_naomi_dashjump))
        image_speed = 0.6
    else
        image_speed = 0.35
    if ((!jumpStop) && (vsp < 0.5) && (!key_jump2))
    {
        vsp /= 10
        jumpstop = true
    }
    hsp = movespeed
	var r = naomi_movespeed
		    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || ((abs(movespeed) < 8) && (move != xscale)) || (!key_attack) || (abs(movespeed) <= 6))
    {
        naomi_dash = 0;
        naomi_movespeed = 8;
    }
	    if ((naomi_dashpadbuffer > 0))
        naomi_dashpadbuffer--
    if ((naomi_dashpadbuffer <= 0))
    {
        if ((move != 0))
        {
            if ((move == xscale))
                movespeed = approach(movespeed, (xscale * naomi_movespeed), 0.5)
            else if ((naomi_dash == 51))
                movespeed = approach(movespeed, 0, 0.5)
            else
                movespeed = approach(movespeed, 0, 0.5)
        }
        else if ((naomi_dash == 51))
            movespeed = approach(movespeed, 0, 0.5)
        else
            movespeed = approach(movespeed, 0, 0.5)
        if ((move != xscale) && (move != 0))
        {
            naomi_movespeed = 8
            xscale = move
        }
    }
    if ((naomi_dashpadbuffer > 0) && (movespeed != 0))
        xscale = sign(movespeed)
	

}

function scr_naomi_crouch()
{
	get_input();
	    var move = (key_left + key_right)
    hsp = movespeed * xscale;
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        movespeed = 0
    if ((move != 0))
    {
		xscale = move
            if ((abs(movespeed) < 4))
                movespeed = approach(movespeed, 4, 0.5)
            else
                movespeed = approach(movespeed, 4, 0.1)
        if ((abs(movespeed) < 3) && (move != 0))
            image_speed = 0.35
        else if ((abs(movespeed) > 3) && (abs(movespeed) < 6))
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        movespeed = approach(movespeed, 0, 0.5)
    if (!grounded)
    {
        state = UnknownEnum.Value_55
        jumpAnim = false
        sprite_index = spr_player_fall
    }
    if (((grounded && (!key_down))) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
        state = UnknownEnum.Value_55
    if ((hsp != 0))
        sprite_index = spr_player_crouchmove
    else
        sprite_index = spr_player_crouch

}

function scr_naomi_attack()
{

}

function scr_naomi_flying()
{

}