if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    FMODevent_oneshot("event:/Sfx/General/Enemy/Monolith/cupdead", x, y);
    
    var _xx = x + (sprite_width / 2);
    var _yy = y + (sprite_height / 2);
    
    with (instance_create(_xx, _yy, obj_baddiedead))
    {
        sprite_index = other.spr_dead;
        hsp = random_range(5, 7) * sign(x - obj_player.x);
        image_xscale = other.image_xscale;
    }
    
    repeat (8)
    {
        create_particleDebri(spr_baddie_gibs, irandom(5), x, y, 1, -5);
        create_particleDebri(spr_slapstar, irandom(5), x, y, 1, -5);
    }
    
    global.combo.amt += 1;
    obj_player.supertaunt++;
    global.combo.timer = 60;
    shake_camera(10, 15);
}