
if (global.level_gate_unlocked) 
{

    instance_create(x, y, obj_explosion); 
    repeat(6) instance_create(x + irandom_range(-20, 20), y + irandom_range(-20, 20), obj_chargeeffect);
    
  
    instance_destroy();
    exit;
}


var _player = instance_place(x, y, obj_player);

if (_player != noone && _player.state != UnknownEnum.Value_48)
{
    with (_player)
    {
     
        xscale = 1; 
        hsp = -8;   
        vsp = -6;
        state = UnknownEnum.Value_48; 
        sprite_index = spr_player_slipsyrup;
        image_index = 0;
        
    
        if (instance_exists(obj_camera)) {
            with(obj_camera) { shake_mag = 3; shake_mag_acc = 3 / 5; }
        }
    }
    

    FMODevent_oneshot("event:/Sfx/Player/bump", x, y);
    
    
    with (obj_lester) 
    { 
        triggered_by_bump = true; 
        bump_timer = 180; 
    }
}
