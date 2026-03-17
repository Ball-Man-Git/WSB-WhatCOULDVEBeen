if (state == 0) 
{
    x += hsp;
    y += vsp;
    image_angle = point_direction(0, 0, hsp, vsp);
    

    var _target = instance_place(x, y, obj_player);
    
  
    if (place_meeting(x + hsp, y, obj_solid))
    {
        state = 1;
        alarm[0] = 60; 
        if (instance_exists(obj_player)) fmod_studio_event_instance_start(obj_player.soundsHammer);
    }
}
else if (state == 2) 
{
    vsp += grav;
    y += vsp;
    image_angle += 10;
    if (y > room_height + 100) instance_destroy();
}
