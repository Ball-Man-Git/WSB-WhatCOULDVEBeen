if (hitstun.is == false)
{
    alpha_timer += 0.05; 
    var target_alpha = (substate == 1 || state == UnknownEnum.Value_1) ? 0.9 : 0.5;
    image_alpha = lerp(image_alpha, target_alpha + (sin(alpha_timer) * 0.2), 0.1);

    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    var player_killing = (obj_player.state == UnknownEnum.Value_4 || obj_player.instakill == true);
    
    if (global.pumpkins.count >= 15 || player_killing) 
        invincable = false; 
    else 
        invincable = true; 

    if (global.pumpkins.count >= 15) 
    {
        if (dist < 300) 
		{
            state = UnknownEnum.Value_49; 
            hsp = 0; vsp = 0; 
        } 
		else if (state == UnknownEnum.Value_49 && dist > 350) 
		{
            state = UnknownEnum.Value_9; 
        }
    }

    switch (state)
    {
        case UnknownEnum.Value_9:
            angle += orbit_speed;
            if (substate == 0) 
			{ 
                sprite_index = spr_move;
                x = lerp(x, xstart + lengthdir_x(radius, angle), 0.04);
                y = lerp(y, ystart + lengthdir_y(radius, angle), 0.04);
                if (dist < 400) 
				{
                    substate = 1;
                    FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y); 
                }
            } 
            else if (substate == 1) 
			{ 
                sprite_index = spr_orbit; 
                x = lerp(x, obj_player.x + lengthdir_x(radius + 20, angle), 0.06);
                y = lerp(y, obj_player.y + lengthdir_y(radius + 20, angle), 0.06);
                
                if (place_meeting(x, y, obj_player) && player_killing) 
                    instance_destroy();

                dash_timer++;
                if (dash_timer > 120) 
				{
                    state = UnknownEnum.Value_1;
                    sprite_index = spr_dash_start;
                    image_index = 0;
                    dash_timer = 0;
                }
            }
            break;

        case UnknownEnum.Value_1:
            if (sprite_index == spr_dash_start) 
			{
                hsp = 0; vsp = 0;
                if (animation_end()) 
				{
                    sprite_index = spr_dash;
                    FMODevent_oneshot("event:/Sfx/Player/suplexdash", x, y); 
                    var dir = point_direction(x, y, obj_player.x, obj_player.y);
                    dash_hsp = lengthdir_x(16, dir);
                    dash_vsp = lengthdir_y(16, dir);
                }
            } 
			else 
			{
                x += dash_hsp; 
                y += dash_vsp;

                if (place_meeting(x, y, obj_player)) 
				{
                    if (player_killing || global.pumpkins.count >= 15) 
                        instance_destroy(); 
                    else 
                        hurt_player(id); 
                }

                dash_timer++;
                if (dash_timer > 80) 
				{
                    state = UnknownEnum.Value_9;
                    substate = 0;
                    dash_timer = 0;
                }
            }
            break;

        case UnknownEnum.Value_49:
            sprite_index = spr_stun;
            hsp = 0; vsp = 0;
            if (place_meeting(x, y, obj_player)) instance_destroy();
            break;

        case UnknownEnum.Value_11:
            image_alpha = 1;
            scr_collision(); 
            scr_enemy_stun();
            break;
    }
}
else 
    image_alpha = 1;