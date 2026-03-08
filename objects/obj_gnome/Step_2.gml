if (hitstun.is == false)
{

    if (state == 15)
    {
        hsp = 0;
        vsp = 0;
        sprite_index = spr_idle;
        if (global.escape.active && point_distance(x, y, obj_player.x, obj_player.y) < 250)
        {
            state = 16; 
            sprite_index = spr_popout;
            image_index = 0;
        }
        exit;
    }
    

    event_inherited();

 
    if (state == 16)
    {
        hsp = 0;
        if (floor(image_index) >= (image_number - 1))
        {
            state = UnknownEnum.Value_9;
            sprite_index = spr_move;
        }
    }


    switch (state)
    {
        case UnknownEnum.Value_11: scr_enemy_stun(); break;
        case UnknownEnum.Value_10: scr_enemy_hit(); break;
        case UnknownEnum.Value_8:  scr_enemy_turn(); break;
        case UnknownEnum.Value_22: scr_enemy_grabbed(); break;
        case UnknownEnum.Value_25: scr_enemy_thrown(); break;
        
        case UnknownEnum.Value_9: 
            sprite_index = spr_move;
            image_speed = 0.45;
            movespeed = 5; 
            
            var _dist_x = obj_player.x - x;
            if (abs(_dist_x) > 64) 
                xscale = sign(_dist_x);
            hsp = xscale * movespeed;

       
            if (point_distance(x, 0, obj_player.x, 0) < 200 && chargeBuffer <= 0 && state == UnknownEnum.Value_9)
            {
                state = 17; 
                sprite_index = spr_attackstart;
                image_index = 0;
                movespeed = 0;
                FMODevent_oneshot("event:/Sfx/Player/hammerspin", x, y);
            }
            break;

        case 17: 
            hsp = 0;
            if (floor(image_index) >= (image_number - 1))
            {
                state = 18; 
                sprite_index = spr_attack;
                movespeed = 12;
            }
            break;

        case 18: 
           
            hsp = xscale * movespeed; 
            
            if (floor(image_index) % 4 == 0)
                create_particleStatic(spr_dashcloud1, x, y, xscale, 1);

            if (place_meeting(x + hsp, y, obj_solid))
            {
                FMODevent_oneshot("event:/Sfx/Player/hammerbounce", x, y);
                vsp = -16;
                state = UnknownEnum.Value_11;
                sprite_index = spr_stun;
                movespeed = -5;
                chargeBuffer = 120;
            }
            break;
    }
    
    chargeBuffer = approach(chargeBuffer, 0, 1);
}


hitbox = (state == 18); 
if (hitbox == true)
{
    if (!instance_exists(hitboxInst))
    {
        hitboxInst = instance_create(x, y, obj_forkbox);
        with (hitboxInst) enemy_inst = other;
    }
}
else if (instance_exists(hitboxInst))
{
    instance_destroy(hitboxInst);
    hitboxInst = -4;
}


scr_collide();
