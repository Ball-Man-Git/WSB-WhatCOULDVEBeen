x += hsp;
y += vsp;
vsp += grav;

image_angle = point_direction(0, 0, hsp, vsp);
if (image_xscale == -1) image_angle += 180;


if (collision_buffer > 0)
    collision_buffer--;
else if (sink_timer == -1) 
{
    if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_slope))
        sink_timer = 2; 
}

if (sink_timer > 0)
    sink_timer--;
else if (sink_timer == 0)
{
    var _imp = instance_create(x, y, obj_strawimpact);
    _imp.image_angle = image_angle; 
    instance_destroy();
}

if (x > room_width + 100 || x < -100 || y > room_height + 100 || y < -100) 
    instance_destroy();
