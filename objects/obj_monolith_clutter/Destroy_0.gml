if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    
    with (instance_create(x, y, obj_baddiedead))
    {
        sprite_index = spr_monolith_antDestroyablesCentered;
        image_speed = 0;
        image_index = other.image_index;
    }
    
    FMODevent_oneshot("event:/Sfx/General/Level/breakblock", x, y);
	push_achievement(achievements.waybackFodder)
}
