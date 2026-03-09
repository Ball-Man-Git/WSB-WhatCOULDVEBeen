if (ds_list_find_index(global.saveroom, id) == -1)
{
    global.key = true;
    ds_list_add(global.saveroom, id);
    
   
    instance_create(x, y, obj_keyfollow);
    

    FMODevent_oneshot("event:/Sfx/General/Level/Gerome/collect", x, y);
    create_particleStatic(spr_cloudeffect, x, y, 1, 1);
    instance_destroy();
}
