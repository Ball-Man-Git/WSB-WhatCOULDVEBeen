if (hitstun.is == false)
{
    event_inherited();
    
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
        
        case UnknownEnum.Value_3:
            image_speed = 0.4;
            hsp = movespeed * xscale;
            movespeed = 8;
            sprite_index = spr_move;
            
            if (place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_hallway) || (!(place_meeting(x + (xscale * 18), y + 31, obj_solid) || place_meeting(x + (xscale * 18), y + 31, obj_slope) || place_meeting(x + (xscale * 18), y + 31, obj_platform)) && grounded))
            {
                vsp = -5;
                xscale *= -1;
            }
            
            break;
        
        case UnknownEnum.Value_1:
            image_speed = 0.5;
            sprite_index = spr_pancake_getup;
            
            if (animation_end())
            {
                if (obj_player.x != x)
                    xscale = -sign(obj_player.x - x);
                
                vsp = -11;
                state = UnknownEnum.Value_3;
                
                with (instance_create(x, y, obj_slipperybutter))
                {
                    other.syrupInst = self;
                    vsp = -7;
                    hsp = -1 * other.xscale;
                }
            }
            
            break;
        
        case UnknownEnum.Value_9:
            image_speed = 0.35;
            movespeed = 0;
            hsp = movespeed * xscale;
            sprite_index = spr_pancake_sleep;
            
            if (point_distance(x, 0, obj_player.x, 0) <= 512 && point_distance(0, y, 0, obj_player.y) <= 96)
            {
                if (sprite_index != spr_pancake_getup)
                {
                    image_index = 0;
                    sprite_index = spr_pancake_getup;
                    
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
