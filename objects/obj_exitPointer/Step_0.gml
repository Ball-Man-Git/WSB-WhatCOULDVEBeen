var spr_idle = ismilton ? spr_mildrednew_mach3turn : spr_exitpointer_naomipoint;
var spr_fall = ismilton ? spr_milton_diveprep : spr_player_groundpound;

switch (state)
{
    case UnknownEnum.Value_13:
        visible = false;
        y = camera_get_view_y(view_camera[0]) - 100;
        
        if (abs(x - obj_player.x) <= 480 && global.escape.active)
        {
            state = UnknownEnum.Value_1;
            sprite_index = spr_fall;
        }
        
        break;
    
    case UnknownEnum.Value_1:
        var spd = 20;
        visible = true;
        
        if (y < ystart)
        {
            y = approach(y, ystart, spd);
        }
        else
        {
			create_particleStatic(spr_landeffect, x, y, 1, 1);
            sprite_index = spr_idle;
            image_index = 0;
            state = UnknownEnum.Value_0;
        }
        
        with (instance_place(x, y, obj_baddie))
                instance_destroy();
        
        break;
}
