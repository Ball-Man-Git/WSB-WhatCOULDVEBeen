if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    global.pumpkins.count++;
    

    FMODevent_oneshot("event:/Sfx/General/collect", x, y);
    create_particleStatic(spr_cloudeffect, x, y, 1, 1);
    
    if (global.pumpkins.count < 15)
        scr_transfotip(string("[wave]There are {0} Pumpkins Left...", 15 - global.pumpkins.count));
    else
    {
        scr_transfotip("[wave][#ff6a00]You've found all the pumpkins! The Grimghoul can now be slain.");
        FMODevent_oneshot("event:/Sfx/General/treasure", x, y);
    }


    instance_create(x, y, obj_pumpkinfollow);
    instance_destroy();
}
