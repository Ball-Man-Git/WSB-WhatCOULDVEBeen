instance_create(x, y, obj_baddiedead).sprite_index = sprite_index;

with (obj_player)
    state = UnknownEnum.Value_38;

ds_list_add(global.saveroom, id);
instance_destroy();
