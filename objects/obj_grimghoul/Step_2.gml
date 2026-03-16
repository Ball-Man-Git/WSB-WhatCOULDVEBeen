if (hitstun.is == false)
{
    alpha_timer += 0.05; 
    image_alpha = 0.6 + (sin(alpha_timer) * 0.2); 

    var _player = instance_place(x - obj_player.xscale, y, obj_player);
    if (_player == -4) _player = instance_place(x, y + 1, obj_player);
    if (_player == -4) _player = instance_place(x + obj_player.xscale, y, obj_player);

    if (_player != -4 && state == UnknownEnum.Value_0)
    {
        var player_fast = (_player.state == UnknownEnum.Value_3 || _player.state == UnknownEnum.Value_4 || _player.instakill == true);
        
        if (player_fast)
        {
            if (global.pumpkins.count >= 15)
            {
                instance_destroy();
            }
            else 
            {
                state = UnknownEnum.Value_8;
                sprite_index = spr_bounce;
                image_index = 0;

                scr_transfotip("[wave][#ff6a00]You need all 15 pumpkins to slay this ghoul. [white]" + string(global.pumpkins.count) + "/15");
                
                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);

                with (_player)
                {
                    state = UnknownEnum.Value_27;
                    sprite_index = spr_player_wallsplat; 
                    image_index = 0;
                    
                    xscale *= -1;
                    hsp = xscale * 6;
                    vsp = -5;
                    movespeed = 0;
                }
            }
        }
    }

    if (state == UnknownEnum.Value_8 && animation_end()) 
        state = UnknownEnum.Value_0;
}