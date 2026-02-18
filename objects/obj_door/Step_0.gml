if (obj_player.state == UnknownEnum.Value_20 && !instance_exists(obj_fadeout) && obj_player.x == (x + (sprite_width / 2)))
{
    FMODevent_oneshot("event:/Sfx/General/Level/Progression/door");
    instance_create(x, y, obj_fadeout);
}
