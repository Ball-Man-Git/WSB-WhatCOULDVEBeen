if (_throw > 0) 
    _throw--;
    
if (launch_buffer > 0)
    launch_buffer--;


if (place_meeting(x, y, obj_player) && _throw <= 0 && launch_buffer <= 0)
{
    with (obj_player)
    {
        hsp = 0;
        vsp = 0;
        movespeed = 0;
        x = lerp(x, other.x, 0.4);
        y = lerp(y, other.y - 60, 0.4);
        
      
        state = UnknownEnum.Value_38; 
        sprite_index = spr_crab_roll;
        image_speed = 0.5;
        
       
        if (floor(current_time / 100) % 2 == 0)
            create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y, 1);
    }
    
    if (sprite_index != spr_throw)
    {
        image_index = 0;
        sprite_index = spr_throw;
        FMODevent_oneshot("event:/Sfx/Player/grab", x, y);
    }
}


if (sprite_index == spr_throw)
{
    if (floor(image_index) == 15 && _throw <= 0)
    {
        _throw = 60; 
        launch_buffer = 80;
        
        with (obj_player)
        {
            vsp = -16;
            movespeed = 18; 
            xscale = other.image_xscale;
            jumpstop = true;
            
   
            FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
            FMODevent_oneshot("event:/Sfx/Player/punch", x, y); 
            shake_camera(6);
            
      
            repeat(12)
            {
                with (create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y, 1))
                {
                    hsp = other.xscale * irandom_range(4, 12);
                    vsp = -irandom_range(4, 10);
                }
            }
        }
    }
    
    if (animation_end())
        sprite_index = spr_idle;
}
