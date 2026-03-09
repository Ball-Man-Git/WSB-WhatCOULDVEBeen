if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    

    FMODevent_oneshot("event:/Sfx/Player/step", x, y); 
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);


    repeat(12) 
    {
        with (create_particleDebri(part_beakerLeaf, 0, x, y + 10, 1))
        {
            
            hsp = irandom_range(-8, 8);
            vsp = -irandom_range(2, 6);
            image_speed = 0.35;
        }
    }
    
}
