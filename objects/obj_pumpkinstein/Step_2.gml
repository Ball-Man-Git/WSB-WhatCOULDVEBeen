if (hitstun.is == false)
{
    switch (state)
    {
        case UnknownEnum.Value_0: 
            sprite_index = spr_idle;
            hsp = 0;
            vsp = 0;
            break;

        case UnknownEnum.Value_1: 
            if (sprite_index != spr_alert)
            {
                sprite_index = spr_alert;
                image_index = 0;
                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
            }
            
            if (animation_end())
            {
                state = UnknownEnum.Value_9;
                sprite_index = spr_chase;
            }
            break;

        case UnknownEnum.Value_9: 
    var target_speed = (obj_player.movespeed > 12) ? obj_player.movespeed : 12;
    movespeed = approach(movespeed, target_speed, 0.2);
    
    xscale = sign(obj_player.x - x);
    if (xscale != 0) x += (movespeed * xscale);
    
    if (place_meeting(x, y, obj_player))
    {
       
        instance_create(0, 0, obj_pumpkinstein_jumpscare);
        instance_destroy();
    }
    break;

case UnknownEnum.Value_8: 
    if (sprite_index != spr_dig)
    {
        sprite_index = spr_dig;
        image_index = 0;
        hsp = 0;
        vsp = 0;
    }
    
    if (animation_end()) 
    {
        
        ds_list_add(global.saveroom, id); 
        instance_destroy();
    }
    break;


    }
}