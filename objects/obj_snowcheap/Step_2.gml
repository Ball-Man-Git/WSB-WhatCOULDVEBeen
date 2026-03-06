if (!hitstun.is)
{
    switch (state)
    {
        case UnknownEnum.Value_0:
            if (substate == 0) 
            {
                image_blend = make_color_rgb(100, 150, 255);
                timer++;
                if (timer > 60) 
                {
                    vsp = jump_vsp;
                    air_dir = (obj_player.x > x) ? 1 : -1;
                    substate = 1;
                    image_blend = c_white;
                    timer = 0;
                }
            }
            else if (substate == 1) 
            {
                vsp += grav;
                x += (jump_hsp * air_dir);
                y += vsp;

                image_angle = point_direction(0, 0, (jump_hsp * air_dir), vsp);
                image_yscale = (air_dir < 0) ? -1 : 1;

                if (y > ystart && vsp > 0)
                {
                    y = ystart;
                    vsp = 0;
                    substate = 0;
                    image_angle = 0;
                    image_yscale = 1;
                }
            }


            var head_x = x + lengthdir_x(24, image_angle);
            var head_y = y + lengthdir_y(24, image_angle);
            if (place_meeting(head_x, head_y, obj_player) && substate == 1)
                hurt_player(id);
                
            if (place_meeting(x, y, obj_player) && (obj_player.state == UnknownEnum.Value_4 || obj_player.instakill))
                instance_destroy();
        break;

        case UnknownEnum.Value_11:
            scr_enemy_stun();
        break;
    }
}
else 
{
    x = hitstun.x + irandom_range(-5, 5);
    y = hitstun.y + irandom_range(-5, 5);
    if (hitstun.time-- <= 0) hitstun.is = false;
}