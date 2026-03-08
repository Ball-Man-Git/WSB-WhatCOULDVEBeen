global.hasFlag = true;
ds_list_add(global.saveroom, id);
scr_transfotip(lang_get_phrase("tip_flag"));
create_collect(sprite_index, x, y);
FMODevent_oneshot("event:/Sfx/General/Collects/bigcollect", x, y); 
instance_destroy();
