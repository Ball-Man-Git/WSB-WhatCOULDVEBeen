vsp += grav;
y += vsp;
x += hsp;
image_angle += 5;


if (place_meeting(x, y, obj_solid))
{
    if (instance_exists(obj_player)) fmod_studio_event_instance_start(obj_player.soundsHammer);
    instance_create(x, y, obj_chargeeffect);
    instance_destroy();
}


var _target = instance_place(x, y, obj_player);
