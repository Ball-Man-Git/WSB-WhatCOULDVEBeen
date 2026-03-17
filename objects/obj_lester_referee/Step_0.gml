
if (state == 2 || state == 4) 
{
    y += vsp;
    vsp += 0.5;
    scr_collision();
}


switch (state)
{
    case 0: 
        hsp = 0;
        if (floor(image_index) % 60 == 0) image_xscale *= -1;
        break;
        
    case 1: 
        sprite_index = spr_flotalk;
        if (animation_end())
        {
          
            if (!instance_exists(obj_boss_announcement)) {
                instance_create(x, y, obj_boss_announcement);
                fmod_studio_event_instance_start(obj_player.soundsSuperjump); 
            }
            
            state = 2; 
            vsp = -16; 
        }
        break;
        
    case 2: 
        if (y > room_height + 200) 
        {
            visible = false;
            hsp = 0; vsp = 0;
        }
        break;

    case 3: 
        visible = true;
        sprite_index = spr_floidle;
        x = approach(x, obj_player.x + (obj_player.xscale * 100), 12);
        if (x == obj_player.x + (obj_player.xscale * 100)) 
        {
            state = 4;
            vsp = -8;
            image_xscale = -obj_player.xscale;
        }
        break;

    case 4: 
        sprite_index = spr_flotalk;
        if (vsp >= 0 && !instance_exists(obj_bosskey))
        {
            instance_create(x, y - 60, obj_bosskey); 
            fmod_studio_event_instance_start(obj_player.soundsOk);
        }
        if (grounded)
        {
            state = 2;
            vsp = -12;
        }
        break;
}
