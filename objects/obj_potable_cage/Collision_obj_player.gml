var _isPermanent = (ds_list_find_index(global.confirmed_ids, potable_ID) != -1);
var _isTemp = (ds_list_find_index(global.unconfirmed_ids, potable_ID) != -1);

if (!_isPermanent && !_isTemp)
{
    ds_list_add(global.unconfirmed_ids, potable_ID);
    show_debug_message("Grabbed: " + potable_ID);
}


instance_create(x, y, content);
instance_destroy(); 

repeat (10)
    create_particleDebri(spr_juiceboxcage_debri, irandom_range(0, sprite_get_number(spr_juiceboxcage_debri)), x, y, 1);

ds_list_add(global.saveroom, id);


if (global.hardMode)
    global.escape.timer += 120;

with (obj_player)
{
    if (irandom(100) <= 25)
        fmod_studio_event_instance_start(soundsLaugh);
}
