timer--;
if (sprite_index == spr_crab_scared && animation_end()) 
    sprite_index = spr_crab_stun;

if (timer <= 0)
{
    with (create_particleDebri(spr_straw_debris, 0, x, y, 1)) { hsp = irandom_range(-4, 4); vsp = -irandom_range(5, 8); }
    with (create_particleDebri(spr_straw_debris, 1, x, y, 1)) { hsp = irandom_range(-4, 4); vsp = -irandom_range(5, 8); }
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);
    instance_destroy();
}
