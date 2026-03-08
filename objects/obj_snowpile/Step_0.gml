
var _player = instance_place(x, y, obj_player);
if (_player != noone)
{

    if (abs(_player.hsp) > 0 || abs(_player.vsp) > 0)
    {
        instance_destroy();
    }
}
