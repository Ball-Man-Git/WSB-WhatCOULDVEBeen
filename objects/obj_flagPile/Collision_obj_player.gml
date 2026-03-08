if (global.hasFlag && !planted)
{
    // 1. DATA & POINTS
    planted = true;
    global.hasFlag = false;
    global.collect += 500;
    global.combo.timer = 60;
    ds_list_add(global.saveroom, id); // SAVE the data

    if (global.hardMode)
        global.escape.timer += 60;

    // 2. AUDIO JUICE (The "Crunchy" Slam)
    FMODevent_oneshot("event:/Sfx/Player/slam", x, y);
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);

    // 3. VISUAL JUICE
    shake_camera(8); 
    create_smalltext(500, x, y);
    
    // Massive Snow Spray
    repeat(10)
    {
        with (create_particleDebri(spr_snowparticle, irandom_range(0, 3), x, y + 20, 1))
        {
            hsp = irandom_range(-8, 8);
            vsp = -irandom_range(4, 12);
        }
    }

    // 4. TV & PLAYER REACTION
    var tv_sprites = global.PlayerCharacters[obj_player.character].sprites.tv;
    tv_anim(tv_sprites.collect, 180);

    with (obj_player)
    {
        if (irandom(100) <= 50)
            fmod_studio_event_instance_start(soundsLaugh);
    }
}
