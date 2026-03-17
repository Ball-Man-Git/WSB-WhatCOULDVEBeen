var player_dist = distance_to_object(obj_player);


_total_potables = ds_list_size(global.confirmed_ids);


if (bump_timer > 0) bump_timer--;
else triggered_by_bump = false;

if (player_dist < 100) triggered_by_bump = false;


if (global.escape.active)
{
    sprite_index = (player_dist < 150) ? spr_escape_talk : spr_escape_idle;

    if (player_dist < 150)
    {
        text = "[shake]THE HOUSE IS COMIN' DOWN! EVERY MAN FOR HIMSELF!";
        
        if (borderpart == 0) {
            borderY = approach(borderY, 43, borderVsp);
            borderVsp += 0.5;
            if (borderY >= 43) borderpart = 1;
        }
    }

    if (player_dist < 60)
    {
        with instance_create(x, y, obj_baddiedead)
		sprite_index = spr_escape_die
        instance_destroy();
    }
    
    exit; 
}


if ((player_dist < 150 || triggered_by_bump) && state == 0)
{
    if (sprite_index != spr_talk)
    {
        sprite_index = spr_talk;
        image_index = 0;
        if (!FMODevent_isplaying(snd_voice)) 
            fmod_studio_event_instance_start(snd_voice);
    }
    FMODSet3dPos(snd_voice, x, y);
    
    var _world = 1;
    var _rm = room_get_name(room);
    if (string_pos("hotel_2", _rm) > 0) _world = 2; 
    if (string_pos("hotel_3", _rm) > 0) _world = 3; 

    if (_total_potables < needed)
    {
		//Change the dialouge if you want, I just thought it would be funny to make Lester southern, because of his hat and name "lester"
        var _tracker = " That's [b]" + string(_total_potables) + "[/b] out of the [b]" + string(needed) + "[/b] I require, friend!";

        if (triggered_by_bump)
            text = "[shake]Now hold your horses! VIPs only! This attraction is temporarily closed until I see all [b]" + string(needed) + "[/b] of those Potables!";
        else
        {
            switch (_world)
            {
                case 1: text = "[wave]Welcome to the Sunnyside Inn, darlin'! Such a pleasure! But the curtain stays up until you check in with " + string(needed) + " Potables!" + _tracker; break;
                case 2: text = "[wave]Season's greetings from the Sunnyside Giftshop! This gate is locked until I see " + string(needed) + " Potables!" + _tracker; break;
                case 3: text = "[wave]Mind the wallpaper, darlin', it's a bit... rustic! Bring me " + string(needed) + " Potables and I'll personally clear the way for ya!" + _tracker; break;
            }
        }
    }
    else 
    {
        text = "[wave]Magnificent! Simply divine! You've got the goods, so I've got the show! Step aside, the Ringmaster is openin' the gate! It's showtime, y'all!";
    }

    if (borderpart == 0) 
    {
        borderY = approach(borderY, 43, borderVsp);
        borderVsp += 0.5;
        if (borderY >= 43) borderpart = 1;
    } 
    else 
    {
        borderY = floor(lerp(borderY, 32 + wave(-2, 2, 8, 0), 0.15));
    }
}
else if (state == 0)
{
    sprite_index = spr_idle;
    borderpart = 0;
    borderY = approach(borderY, borderTargetpos, 5);
    fmod_studio_event_instance_stop(snd_voice, true);
}


if (player_dist < 80 && _total_potables >= needed && state == 0)
{
    state = 1; 
    image_index = 0; 
    sprite_index = spr_snap; 
    if (instance_exists(obj_player)) obj_player.state = -4; 
    FMODevent_oneshot("event:/Sfx/General/Level/Gerome/collect", x, y);
}

if (state == 1 && animation_end()) 
{
    state = 2; 
    sprite_index = spr_die; 
    image_index = 0;
    image_speed = 0.35;
    
    global.level_gate_unlocked = true; 
    ini_open(filename);
    ini_write_real("Markers", "w1lester", 1);
    ini_close();
    
    with (obj_gate_curtain) { state = 1; image_index = 0; }
}


if (state == 2 && animation_end())
{
    if (instance_exists(obj_player)) obj_player.state = 0; 
    instance_destroy();
}
