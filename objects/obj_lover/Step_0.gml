if (active == false)
{
    sprite_index = asset_get_index(string("spr_lover{0}_idle", lover));
    
    if (place_meeting(x, y, obj_player))
    {
        image_index = 0;
        sprite_index = asset_get_index(string("spr_lover{0}_shoot", lover));
        active = true;
        ds_list_add(global.saveroom, id);
        FMODevent_oneshot("event:/Sfx/General/Collects/bigcollect", x, y);
				with obj_player
		{
			flash = true
			repeat(3)
				instance_create(x + irandom_range(-70, 70), y + irandom_range(-70, 70), obj_notes).sprite_index = spr_heart_part
			switch room
			{
				case mangrove_secret1:
					var _dialog = instance_create(x, y - 32, obj_smallDialog)
					with _dialog
					{
						target = obj_player
						addDialog(dialogChars.mildred, "The worst she can say is no.. right?")
						draw_set_font(global.npcfont)
						draw_set_halign(fa_center)
						global.textSize = 0.8
						draw_text_oyh(x, y, dialogStuff[currentDialog].text, 800)
						global.textSize = 1
						var _stringArr = ds_map_find_value(global.textCache, dialogStuff[currentDialog].text)[0]
						var _stringArrLength = array_length(_stringArr)
						textLength = _stringArrLength
						textLetter = 0
						active = true
						alarm[0] = 45
					}
					break
			}
		}
    }
}
else if (sprite_index == asset_get_index(string("spr_lover{0}_shoot", lover)))
{
    if (!fly)
    {
        repeat (10)
        {
            with instance_create(x + irandom_range(-50, 50), y + irandom_range(-50, 50), obj_loverproj)
			{
				sprite_index = asset_get_index(string("spr_lover{0}_proj", other.lover));
			}
            show_debug_message("disgusting little thing created");
        }
        
        fly = true;
    }
    
    if (animation_end())
        image_index = image_number - 1;
    
    if (fly)
    {
        vspeed = approach(vspeed, -14, 0.2);
        hspeed = approach(hspeed, -4, 0.5);
    }
    else
    {
        hspeed = approach(hspeed, 0, 0.5);
    }
}
