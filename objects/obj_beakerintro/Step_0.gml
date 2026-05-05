if (obj_player.state == -4)
{
    if (start)
    {
        with (obj_player)
        {
            hsp = 0;
            movespeed = 0;
            vsp += 0.5;
            
            if (sprite_index == spr_player_spinout)
            {
                buffers.afterimageBlur = approach(buffers.afterimageBlur, 0, 1);
                
                if (buffers.afterimageBlur == 0)
                {
                    buffers.afterimageBlur = 4;
                    create_blur_effect(sprite_index, image_index, x, y, xscale);
                }
            }
            
            if (grounded && sprite_index == spr_player_spinout)
            {
                FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
                sprite_index = spr_player_beakerintro;
                image_index = 0;
                image_speed = 0.35;
				if global.hardMode
				{
					global.escape.active = true
					global.escape.timer = 0
					            global.collect = global.Srank;
            global.escape.party = true;
            global.combo.dropped = false;
            global.treasure = true;
            global.secretCount = 3;
			scr_escapeTilesets()
			instance_create(x, y, obj_whiteflash);
				}
                shake_camera(15);
				with (obj_baddie)
				{
	                FMODevent_oneshot("event:/Sfx/Player/mach2bump", x, y);
	                xscaleMulti = 0.5;
	                yscaleMulti = 3;
	                vsp = -10;
	                scared = 120;
	                state = UnknownEnum.Value_11;
	                movespeed = 0
	                sprite_index = spr_stun;
				}
            }
            
            if (animation_end() && sprite_index == spr_player_beakerintro)
            {
                instance_destroy(other);
                state = UnknownEnum.Value_0;
                sprite_index = spr_player_idle;
                image_index = 0;
            }
        }
    }
    else
    {
        obj_player.vsp = 0;
        obj_player.hsp = 0;
    }
}
