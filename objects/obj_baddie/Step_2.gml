if (distance_to_object(obj_player) <= 200 && obj_player.super)
    state = UnknownEnum.Value_49;

if (state == UnknownEnum.Value_49)
{
    xoffset = irandom_range(-20, 25);
    yoffset = irandom_range(25, -25);
    fear++;
    xscaleMulti += 0.015;
    yscaleMulti += 0.015;
    sprite_index = spr_scared;
    
    if (fear >= 120)
	{
		instance_create(x, y, obj_explosion)
        instance_destroy();
	}
    
    exit;
}

scr_collision();
mask_index = spr_player_mask;

if (y > (room_height + 100) || y < -100)
    instance_destroy();

if ((x > (room_width + 100) || x < -100 || y < -100) && state == UnknownEnum.Value_25)
    instance_destroy();

if (escape && spawnerId == -4)
{
    with (instance_create(x, y, obj_escapespawn))
    {
        content = other.id;
        other.spawnerId = self;
    }
    
    instance_deactivate_object(self);
}

with (obj_player)
{
    if (place_meeting(x, y + (vsp * 2), other) && y < other.y && vsp > 0 && !other.invincable)
    {
        if (state == UnknownEnum.Value_2)
        {
            vsp = -10;
            
            if (key_jump)
                vsp = -15;
            
            jumpstop = true;
            sprite_index = spr_player_bumpenemystart;
            image_index = 0;
            
            with (other)
            {
                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
                xscaleMulti = 3;
                yscaleMulti = 0.5;
                vsp = -5;
                xscale = obj_player.xscale;
                scared = 120;
                state = UnknownEnum.Value_11;
                movespeed = 5 * other.xscale;
                sprite_index = spr_stun;
            }
        }
        
        if (state == UnknownEnum.Value_23 && enemyID != other && !other.invincable)
        {
            vsp = -10;
            
            if (key_jump)
                vsp = -15;
            
            jumpstop = true;
            sprite_index = spr_player_haulingjump;
            image_index = 0;
            
            with (other)
            {
                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
                xscaleMulti = 3;
                yscaleMulti = 0.5;
                vsp = -5;
                xscale = obj_player.xscale;
                scared = 120;
                state = UnknownEnum.Value_11;
                movespeed = 5 * other.xscale;
                sprite_index = spr_stun;
            }
        }
    }
    
    if (place_meeting(x + (hsp * 2), y + vsp, other) && hitstun.is == false && other.state != UnknownEnum.Value_10 && !other.invincable)
    {
        var _baddie = other;
        
        if (state == UnknownEnum.Value_3 || state == UnknownEnum.Value_16)
        {
            with (_baddie)
            {
                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
                xscaleMulti = 3;
                yscaleMulti = 0.5;
                vsp = -5;
                xscale = obj_player.xscale;
                scared = 120;
                state = UnknownEnum.Value_11;
                movespeed = abs(8 + (other.movespeed / 2));
                sprite_index = spr_stun;
            }
        }
        
        if (state == UnknownEnum.Value_22 && !other.invincable)
        {
			if !isErnie
			{
            state = UnknownEnum.Value_23;
            
            if (key_attack || movespeed > 10)
                sprite_index = spr_player_swingading;
            else
                sprite_index = spr_player_haulingland;
            
            image_index = 0;
            enemyID = _baddie;
            
            if (!grounded)
            {
                jumpstop = true;
                vsp = -6;
            }
            
            with (_baddie)
            {
                playerID = other;
                xscaleMulti = 3;
                yscaleMulti = 0.5;
                sprite_index = spr_stun;
                state = UnknownEnum.Value_22;
            }
			}
        }
        
        if (instakill && !other.invincable)
        {
            if (enemyID == _baddie)
                exit;
            
            FMODevent_oneshot("event:/Sfx/Player/punch", x, y);
            
            if (state == UnknownEnum.Value_4 && sprite_index == sprites.mach3)
            {
                sprite_index = sprites.mach3hit;
                image_index = 0;
            }
            
            if (state == UnknownEnum.Value_36 || sprite_index == spr_milton_dive)
            {
                movespeed = approach(movespeed, 30, 2);
                create_particleStatic(spr_miltonEffect, x, y, xscale, 1).image_speed = 0.5;
                squashX = 3;
                squashY = 0.5;
            }
            
            hitstun.x = x;
            hitstun.y = y;
            hitstun.time = 5;
            hitstun.is = true;
            create_particleStatic(spr_kungfueffect, x, y, 1, -5);
            
            if (key_jump || state == UnknownEnum.Value_29)
                vsp = -10;
            
            with (_baddie)
            {
                xscaleMulti = 3;
                yscaleMulti = 0.5;
                hitstun.x = x;
                hitstun.y = y;
                hitstun.time = 5;
                hitstun.is = true;
                sprite_index = spr_stun;
                state = UnknownEnum.Value_10;
            }
        }
    }
}
