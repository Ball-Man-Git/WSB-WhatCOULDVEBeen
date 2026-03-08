
var _player = instance_place(x, y, obj_player);

if (_player != noone)
{
  
    if (_player.state == UnknownEnum.Value_3 || _player.state == UnknownEnum.Value_4)
    {
        instance_destroy();
    }
    else 
    {
       
        with (_player)
        {
            if (state != UnknownEnum.Value_7) // 
            {
                movespeed = 0;
                hsp = 0;
                
                if (abs(hsp) > 2) FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
            }
        }
    }
}
