if global.escape.active == false
{
if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    global.level_timer = 0;
    
    with (obj_player)
    {
        state = -4;
        y = -200;
        sprite_index = spr_player_spinout;
        image_speed = 0.35;
        vsp = 10;
        grounded = false;
        other.alarm[0] = 60;
    }
}
else
{
    instance_destroy();
}
}