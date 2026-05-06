if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    FMODevent_oneshot("event:/Sfx/General/Enemy/Monolith/cupdead", x, y);
    
    with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_baddiedead))
    {
        sprite_index = spr_mugmonolith_dead;
        hsp = random_range(5, 7) * sign(x - obj_player.x);
        image_xscale = other.image_xscale;
    }
    
    repeat (8)
    {
        create_particleDebri(spr_baddie_gibs, irandom_range(0, sprite_get_number(spr_baddie_gibs)), x, y, 1, -5);
        create_particleDebri(spr_slapstar, irandom_range(0, sprite_get_number(spr_slapstar)), x, y, 1, -5);
    }
    
	
	var fidelity = obj_player.isMildred && obj_player.palIndex == 12
    instance_create(x, y, !fidelity ? obj_goodmourning : obj_newmourning);
    instance_create(x, y, obj_whiteflash);
	scr_escapeTilesets()
    global.escape.active = true;
    
    switch (global.level)
    {
        default:
            global.escape.timer = 10800;
            break;
        
        case "forest":
            global.escape.timer = 12600;
            break;
    }
    
    obj_hud.bar.chunkMax = global.escape.timer;
    global.combo.amt += 1;
    obj_player.supertaunt++;
    global.combo.timer = 60;
	
				switch room
			{
				case mangrove_11:
					var _dialog = instance_create(x, y - 32, obj_smallDialog)
					with _dialog
					{
						target = obj_player
						addDialog(dialogChars.mildred, "Oh no... [shake]RUN!!!")
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
