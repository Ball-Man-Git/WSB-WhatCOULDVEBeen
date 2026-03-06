if (hitstun.is == false)
{
    var player_killing = (obj_player.state == UnknownEnum.Value_4 || obj_player.instakill == true);
    var player_in_beam = point_in_rectangle(obj_player.x, obj_player.y, x - 32, y, x + 32, y + 800);
    var dist_x = abs(x - obj_player.x);

    switch (state)
    {
        case UnknownEnum.Value_0: 
            invincable = true;
            if (substate == 0) 
            {
                sprite_index = spr_idle;
                image_speed = 0;
                image_blend = c_gray;
                if (player_in_beam && !collision_line(x, y, x, obj_player.y, obj_solid, false, true))
                {
                    substate = 1;
                    image_speed = 0.35;
                    sprite_index = spr_wobble;
                    image_blend = c_white;
                }
            }
            else if (substate == 1) 
            {
                if (animation_end())
                {
                    substate = 2;
                    sprite_index = spr_fall;
                }
            }
            else if (substate == 2) 
            {
                y += vsp;
                vsp += grav;

                if (place_meeting(x, y, obj_player))
                {
                    if (player_killing) 
                        instance_destroy();
                    else 
                        hurt_player(id);
                    substate = 3;
                }

                if (place_meeting(x, y + 1, obj_solid)) 
                    substate = 3;

                if (substate == 3)
                {
                    vsp = 0;
                    sprite_index = spr_splash;
                    image_index = 0;
                    repeat (5) create_particleDebri(spr_baddie_gibs, irandom(5), x, y, 1, -5);
                }
            }
            else if (substate == 3) 
            {
                if (animation_end())
                {
                    state = UnknownEnum.Value_9; 
                    sprite_index = spr_move;
                }
            }
            break;

        case UnknownEnum.Value_9: 
            invincable = !player_killing;
            scr_collision();
            
            if (dist_x < 400 && player_killing)
            {
                state = UnknownEnum.Value_11;
                sprite_index = spr_scared;
                scared = 120;
                break; 
            }

            var player_moving = (abs(obj_player.hsp) > 0.5 || abs(obj_player.vsp) > 0.5);
            if (player_moving && abs(obj_player.x - x) > 12)
            {
                xscale = sign(obj_player.x - x);
                movespeed = approach(movespeed, 8, 0.4); 
            }
            else
            {
                movespeed = approach(movespeed, 0, 0.2);
            }

            hsp = movespeed * xscale;

            if (grounded)
            {
                sprite_index = spr_move;
                if (place_meeting(x + xscale, y, obj_solid) || (obj_player.y < y - 64 && player_moving))
                {
                    vsp = -11; 
                    sprite_index = spr_puddle_jump;
                }
            }

            if (place_meeting(x, y, obj_player))
            {
                if (player_killing) 
                    instance_destroy();
                else if (obj_player.i_frame <= 0)
                    hurt_player(id);
            }
            break;

        case UnknownEnum.Value_11: 
            invincable = false;
            scr_collision();
            scr_enemy_stun();
            break;
    }
}