if (hitstun.is == false)
{
    event_inherited();
    chargeBuffer--;
    
    switch (state)
    {
        case UnknownEnum.Value_11:
            scr_enemy_stun();
            break;
        
        case UnknownEnum.Value_10:
            scr_enemy_hit();
            break;
        
        case UnknownEnum.Value_8:
            scr_enemy_turn();
            break;
        
        case UnknownEnum.Value_1:
            image_speed = 0.4;
            hsp = movespeed * xscale;
            
            if (sprite_index == spr_egghead_charge)
            {
                movespeed = 8;
                
                if (place_meeting(x + hsp, y - 7, obj_solid))
                {
                    FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
                    xscaleMulti = 3;
                    yscaleMulti = 0.5;
                    vsp = -5;
                    scared = 120;
                    state = UnknownEnum.Value_11;
                    movespeed = -5;
                    sprite_index = spr_stun;
                }
            }
            
            if (animation_end() && sprite_index == spr_egghead_chargestart)
                sprite_index = spr_egghead_charge;
            
            break;
        
        case UnknownEnum.Value_9:
            image_speed = 0.35;
            movespeed = 0;
            hsp = movespeed * xscale;
            sprite_index = spr_egghead;
            
            if (point_distance(x, 0, obj_player.x, 0) <= 320 && point_distance(0, y, 0, obj_player.y) <= 160 && chargeBuffer <= 0)
            {
                if (sprite_index != spr_egghead_charge)
                {
                    image_index = 0;
                    sprite_index = spr_egghead_chargestart;
                    
                    if (obj_player.x != x)
                        xscale = sign(obj_player.x - x);
                    
                    state = UnknownEnum.Value_1;
                }
            }
            
            break;
        
        case UnknownEnum.Value_22:
            scr_enemy_grabbed();
            break;
        
        case UnknownEnum.Value_25:
            scr_enemy_thrown();
            break;
    }
    
    hitbox = sprite_index == spr_egghead_charge;
    
    if (hitbox == true)
    {
        if (!instance_exists(hitboxInst))
        {
            hitboxInst = instance_create(x, y, obj_forkbox);
            
            with (hitboxInst)
                enemy_inst = other;
        }
    }
    else if (instance_exists(hitboxInst))
    {
        instance_destroy(hitboxInst);
        hitboxInst = -4;
    }
}
else if (hitstun.time >= 0)
{
    image_speed = 0;
    x = hitstun.x + irandom_range(-5, 5);
    y = hitstun.y + irandom_range(-5, 5);
    hitstun.time--;
}
else
{
    x = hitstun.x;
    y = hitstun.y;
    hitstun.is = false;
}

    if (scared == 0 && point_distance(x, 0, obj_player.x, 0) <= 320 && point_distance(0, y, 0, obj_player.y) <= 160 && (obj_player.state == UnknownEnum.Value_4 && obj_player.isErnie == true))
    {
        vsp = -5;
        
        if (obj_player.x != x)
            xscale = sign(obj_player.x - x);
        
        sprite_index = spr_scared;
        scared = 120;
        state = UnknownEnum.Value_11;
    }