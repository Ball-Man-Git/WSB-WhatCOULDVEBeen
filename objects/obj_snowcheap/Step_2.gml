if (!hitstun.is)
{
    switch (state)
    {
        case UnknownEnum.Value_0:
            if (substate == 0) 
            {
                image_alpha = 0.6;
                hsp = 0;
                vsp = 0;
                image_angle = 0; 
                timer++;
                
                if (timer > 80 && point_distance(x, y, obj_player.x, obj_player.y) < 400) 
                {
                    vsp = jump_vsp;
                   
                    air_dir = (obj_player.x > x) ? 1 : -1;
                    image_xscale = air_dir; 
                    
                    substate = 1;
                    image_alpha = 1;
                    timer = 0;
                    FMODevent_oneshot("event:/Sfx/Player/jump", x, y);
                }
            }
            else if (substate == 1) 
            {
                vsp += grav;
                hsp = (jump_hsp * air_dir);

                if (place_meeting(x + hsp, y, obj_solid))
                    hsp = 0;

                x += hsp;
                y += vsp;

                
                image_angle = point_direction(0, 0, hsp, vsp);
                
           
                if (image_xscale == -1) 
                    image_angle += 180;

          
                if (y > ystart && vsp > 0)
                {
                    y = ystart;
                    vsp = 0;
                    hsp = 0;
                    substate = 0;
                    image_angle = 0;
                    image_alpha = 0.6;
                    FMODevent_oneshot("event:/Sfx/Player/slipbump", x, y);
                    repeat(4) create_particleDebri(spr_snowparticle, irandom(3), x, y, 1);
                }
            }

 
            var _player = instance_place(x, y, obj_player);
            if (_player != noone)
            {
                if (_player.state == UnknownEnum.Value_3 || _player.state == UnknownEnum.Value_4 || _player.instakill)
                    instance_destroy();
                else if (substate == 1 && _player.i_frame <= 0)
                    hurt_player(id);
            }
        break;

        case UnknownEnum.Value_11: 
            scr_enemy_stun();
        break;
    }
}
else 
{
    x = hitstun.x + irandom_range(-2, 2);
    y = hitstun.y + irandom_range(-2, 2);
    if (hitstun.time-- <= 0) hitstun.is = false;
}
