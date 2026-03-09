switch (state)
{
    case "normal":
        image_speed = 0.35;
        
  
        event_inherited();
        
  
        if (gx != x || gy != y)
            sprite_index = spr_walk;
        else
            sprite_index = global.escape.active ? spr_panicidle : spr_idle;
        

        if (obj_player.state == UnknownEnum.Value_15)
        {
            sprite_index = spr_taunt;
            image_index = irandom_range(0, image_number);
            state = "taunt";
            image_speed = 0;
        }
        break;
        
    case "taunt":
        if (obj_player.state != UnknownEnum.Value_15)
            state = "normal";
        break;

    case "goofy":
        x += hsp; y += vsp; vsp += 0.5;
        image_angle += hsp * 2;
        if (y > room_height + 150) instance_destroy();
        break;
}
