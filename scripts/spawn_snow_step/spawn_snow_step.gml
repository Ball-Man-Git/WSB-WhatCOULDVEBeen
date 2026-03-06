function spawn_snow_step()
{
    if (place_meeting(x, y + 2, obj_iceslippery))
    {
        if (grounded)
        {
            if (irandom(3) == 0)
            {
                create_particleStatic(spr_snowparticle, x, y, xscale, 1);
            }
        }
    }
}