if (state == "normal")
{
    event_inherited();
}
else if (state == "unlock")
{
    var _door = instance_nearest(x, y, obj_keydoor);
    if (_door != noone)
    {
        persistent = false;
        x = lerp(x, _door.x, 0.2);
        y = lerp(y, _door.y, 0.2);
        if (point_distance(x, y, _door.x, _door.y) < 10) instance_destroy();
    }
}
