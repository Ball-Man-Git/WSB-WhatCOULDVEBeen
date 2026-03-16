vsp += grav;
x += hsp;
y += vsp;
image_angle += (hsp * 2);


if (place_meeting(x, y + vsp, obj_solid))
{
    vsp = -8; 
    bounce_count++;
    if (instance_exists(obj_player)) fmod_studio_event_instance_start(obj_player.soundsGroundpound);
    shake_camera(2, 3);
    
    instance_create(x, y, obj_chargeeffect);
    
    if (bounce_count >= 3)
    {
        instance_create(x, y, obj_explosion);
        instance_destroy();
    }
}


var _target = instance_place(x, y, obj_player);
