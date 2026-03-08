if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    
    // AUDIO: The "Crunchy" Snow Sound mix
    FMODevent_oneshot("event:/Sfx/Player/step", x, y); 
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);

    // VISUAL: Heavy Snow Spray (Offset 10 pixels down)
    repeat(10)
    {
        // y + 10 ensures particles spawn at the ground level
        with (create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 10, 1))
        {
            hsp = irandom_range(-6, 6);
            vsp = -irandom_range(4, 9);
        }
    }
    
    // Create the cloud poof at the same lower offset
    create_particleStatic(spr_cloudeffect, x, y + 10, 1, 1);
}
