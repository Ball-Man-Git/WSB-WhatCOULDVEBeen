function scr_player_enterdoor()
{
    get_input();
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    
    if (place_meeting(x, y, obj_door))
    {
        var _door = instance_place(x, y, obj_door);
        var _tX = _door.x + (_door.sprite_width / 2);
        x = approach(x, _tX, 6);
    }
    
    if (place_meeting(x, y, obj_keydoor))
    {
        var _door = instance_place(x, y, obj_keydoor);
        var _tX = _door.x + (_door.sprite_width / 2);
        x = approach(x, _tX, 6);
    }
    
    if (place_meeting(x, y, obj_magicianDoor))
    {
        var _door = instance_place(x, y, obj_magicianDoor);
        var _tX = _door.x + (_door.sprite_width / 2);
        x = approach(x, _tX, 6);
    }
    
    if (place_meeting(x, y, obj_levelgate))
    {
        var _door = instance_place(x, y, obj_levelgate);
        var _tX = _door.x;
        x = approach(x, _tX, 6);
    }
    
    if (animation_end())
    {
        image_index = image_number - 1;
        
        if (sprite_index == spr_player_downbox || sprite_index == spr_player_upbox)
        {
            if (!instance_exists(obj_fadeout))
            {
                FMODevent_oneshot("event:/Sfx/General/Level/Progression/door");
                instance_create(x, y, obj_fadeout);
            }
        }
    }
}

function scr_player_walkfront()
{
    get_input();
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    
    if (sprite_index == spr_player_walkfront)
    {
        if ((floor(image_index) == 5 || floor(image_index) == 13) && buffers.step <= 0)
        {
            buffers.step = 12;
            FMODevent_oneshot("event:/Sfx/Player/step", x, y);
            create_particleStatic(spr_cloudeffect, x, y + 42, 1, 1);
        }
        
        buffers.step--;
    }
    
    if (animation_end())
    {
        if (sprite_index == spr_player_walkfront)
        {
            if (place_meeting(x, y, obj_exitgate))
            {
                sprite_index = sprites.gateslam;
                image_index = 0;
                shake_camera(25);
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
			instance_destroy(obj_exitgate)
				}
                
                with (instance_place(x, y, obj_exitgate))
                {
                    image_index = 0;
                    FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
                    ds_list_add(global.saveroom, id);
                }
            }
            else
            {
                sprite_index = spr_player_idle;
                image_index = 0;
                state = UnknownEnum.Value_0;
				if isNaomi
				state = UnknownEnum.Value_55;
            }
        }
        else
        {
            sprite_index = spr_player_idle;
            image_index = 0;
            state = UnknownEnum.Value_0;
							if isNaomi
				state = UnknownEnum.Value_55;
        }
    }
}
