if (hitstun.is == false)
{
    event_inherited(); 

    switch (state)
    {
        case UnknownEnum.Value_11: scr_enemy_stun(); break;
        case UnknownEnum.Value_10: scr_enemy_hit(); break;
        case UnknownEnum.Value_8:  scr_enemy_turn(); break;
        case UnknownEnum.Value_22: scr_enemy_grabbed(); break;
        case UnknownEnum.Value_25: scr_enemy_thrown(); break;

        case UnknownEnum.Value_9:
            attackTimer--;
            hsp = movespeed * xscale;
            sprite_index = spr_move;
            image_speed = 0.35;
            
            if (place_meeting(x + xscale, y, obj_solid) || (!(place_meeting(x + (xscale * 15), y + 31, obj_solid) || place_meeting(x + (xscale * 15), y + 31, obj_slope) || place_meeting(x + (xscale * 15), y + 31, obj_platform)) && grounded))
                xscale *= -1;

            if (point_distance(x, 0, obj_player.x, 0) <= 320 && point_distance(0, y, 0, obj_player.y) <= 160 && (obj_player.state == UnknownEnum.Value_4 || obj_player.state == UnknownEnum.Value_29))
            {
                vsp = -5;
                if (obj_player.x != x) xscale = sign(obj_player.x - x);
                sprite_index = spr_scared;
                scared = 120;
                state = UnknownEnum.Value_11; 
            }

            if (state == UnknownEnum.Value_9 && attackTimer <= 0 && point_distance(x, 0, obj_player.x, 0) <= 280 && point_distance(0, y, 0, obj_player.y) <= 60)
            {
                attackTimer = 220; 
                state = UnknownEnum.Value_26; 
                sprite_index = spr_shootprep;
                image_index = 0;
                if (obj_player.x != x) xscale = sign(obj_player.x - x);
            }
            break;

        case UnknownEnum.Value_26:
            hsp = 0;
            image_speed = 0.35;
            if (state != UnknownEnum.Value_26) break;

            if (animation_end() && sprite_index == spr_shootprep)
            {
                sprite_index = spr_shoot;
                image_index = 0;
                var _straw = instance_create(x + (xscale * 10), y - 20, obj_slushiestraw);
                _straw.hsp = xscale * 7.5;
                _straw.vsp = -6;
                _straw.image_xscale = xscale;
                FMODevent_oneshot("event:/Sfx/General/Enemy/dart", x, y);
            }
            if (animation_end() && sprite_index == spr_shoot)
            {
                sprite_index = spr_reload;
                image_index = 0;
                FMODevent_oneshot("event:/Sfx/General/Collects/toppin", x, y);
            }
            if (animation_end() && sprite_index == spr_reload)
            {
                state = UnknownEnum.Value_9;
                sprite_index = spr_move;
            }
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

hitbox = (state == UnknownEnum.Value_9 || (state == UnknownEnum.Value_26 && sprite_index != spr_reload));
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
