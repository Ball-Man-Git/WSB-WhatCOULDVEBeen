if (other.i_frame <= 0)
{
    with (other) hurt_player(id);
    
   
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);
    

    with (create_particleDebri(spr_straw_debris, 0, x, y, 1)) { 
        hsp = irandom_range(-4, 4); 
        vsp = -irandom_range(5, 8); 
    }
 
    with (create_particleDebri(spr_straw_debris, 1, x, y, 1)) { 
        hsp = irandom_range(-4, 4); 
        vsp = -irandom_range(5, 8); 
    }
    
    instance_destroy();
}
