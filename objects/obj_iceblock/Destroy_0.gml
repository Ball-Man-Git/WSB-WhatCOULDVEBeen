if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    

    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);
    FMODevent_oneshot("event:/Sfx/Player/slam", x, y); 


    shake_camera(3);


    repeat(6)
    {
        with (create_particleDebri(spr_straw_debris, irandom(1), x, y, 1))
        {
            hsp = irandom_range(-6, 6);
            vsp = -irandom_range(5, 12);
            image_blend = c_white; 
        }
    }
}
